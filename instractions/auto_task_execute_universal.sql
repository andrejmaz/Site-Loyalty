-- Универсальный запрос для выполнения заданий с автоматической проверкой
-- Подходит для: telegram_subscribe, referral (при добавлении реферала)
-- Параметры: 
--   $1 - user_id
--   $2 - task_id

WITH task_check AS (
    -- Проверяем задание
    SELECT 
        t.id,
        t.points,
        t.title,
        t.is_active,
        t.system_name,
        t.is_one_time,
        t.monthly_limit,
        t.verification_type
    FROM tasks t
    WHERE t.id = $2 AND t.verification_type = 'auto'
),
user_stats AS (
    -- Собираем статистику пользователя по этому заданию
    SELECT 
        -- Проверка на выполнение одноразовых заданий
        BOOL_OR(status = 'approved') as ever_completed,
        -- Количество выполнений за текущий месяц
        COUNT(*) FILTER (
            WHERE status = 'approved' 
            AND DATE_TRUNC('month', completed_at) = DATE_TRUNC('month', CURRENT_DATE)
        ) as monthly_completed_count,
        -- Проверка для ежедневного бонуса (если вдруг используется)
        BOOL_OR(
            DATE(completed_at) = CURRENT_DATE 
            AND status = 'approved'
        ) as completed_today
    FROM user_tasks
    WHERE user_id = $1 AND task_id = $2
),
validation AS (
    -- Валидация всех условий
    SELECT 
        CASE 
            WHEN tc.id IS NULL THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Задание не найдено'
                )
            WHEN tc.is_active = false THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Задание неактивно'
                )
            -- Проверка для ежедневного бонуса
            WHEN tc.system_name = 'daily_bonus' AND COALESCE(us.completed_today, false) = true THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Ежедневный бонус уже получен сегодня. Возвращайся завтра!'
                )
            -- Проверка для одноразовых заданий
            WHEN tc.is_one_time = true AND COALESCE(us.ever_completed, false) = true THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Вы уже выполнили это задание'
                )
            -- Проверка месячного лимита
            WHEN tc.monthly_limit IS NOT NULL 
                 AND COALESCE(us.monthly_completed_count, 0) >= tc.monthly_limit THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Месячный лимит исчерпан'
                )
            ELSE NULL
        END as error,
        tc.points,
        tc.title,
        tc.system_name
    FROM task_check tc
    LEFT JOIN user_stats us ON true
),
execute_task AS (
    -- Вставляем запись только если нет ошибки
    INSERT INTO user_tasks (
        user_id,
        task_id,
        status,
        points_awarded,
        completed_at,
        verified_at,
        salebot_order_id,
        created_at
    )
    SELECT 
        $1,
        $2,
        'approved',
        v.points,
        NOW(),
        NOW(),
        0,
        NOW()
    FROM validation v
    WHERE v.error IS NULL
    RETURNING id, points_awarded
),
add_transaction AS (
    -- Добавляем транзакцию
    INSERT INTO point_transactions (
        user_id,
        amount,
        transaction_type,
        description,
        task_id,
        created_at
    )
    SELECT 
        $1,
        et.points_awarded,
        'task_completion',
        v.title,
        $2,
        NOW()
    FROM execute_task et
    CROSS JOIN validation v
    RETURNING id
),
update_balance AS (
    -- Обновляем баланс
    UPDATE users 
    SET card_balance = card_balance + (SELECT points_awarded FROM execute_task)
    WHERE id = $1 
      AND EXISTS (SELECT 1 FROM execute_task)
    RETURNING card_balance
)
-- Возвращаем результат
SELECT 
    COALESCE(
        v.error,
        jsonb_build_object(
            'status', true,
            'message', 
                CASE 
                    WHEN v.system_name = 'daily_bonus' THEN 'Ежедневный бонус успешно получен!'
                    WHEN v.system_name = 'telegram_subscribe' THEN 'Спасибо за подписку! Бонус начислен'
                    WHEN v.system_name = 'referral' THEN 'Друг добавлен! Бонус начислен'
                    ELSE 'Задание выполнено! Бонус начислен'
                END,
            'points_awarded', et.points_awarded,
            'new_balance', ub.card_balance
        )
    ) as result
FROM validation v
LEFT JOIN execute_task et ON v.error IS NULL
LEFT JOIN update_balance ub ON v.error IS NULL;

