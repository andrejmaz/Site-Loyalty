-- Альтернативный вариант для N8N с возвратом JSON
-- Параметры: 
--   $1 - user_id
--   $2 - task_id (ID задания daily_bonus)

WITH task_check AS (
    -- Проверяем задание
    SELECT 
        t.id,
        t.points,
        t.title,
        t.is_active,
        t.system_name
    FROM tasks t
    WHERE t.id = $2 AND t.system_name = 'daily_bonus'
),
today_check AS (
    -- Проверяем выполнение сегодня
    SELECT 
        EXISTS (
            SELECT 1 
            FROM user_tasks 
            WHERE user_id = $1 
              AND task_id = $2 
              AND DATE(completed_at) = CURRENT_DATE
              AND status = 'approved'
        ) as completed_today
),
validation AS (
    -- Валидация
    SELECT 
        CASE 
            WHEN tc.id IS NULL THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Задание не найдено или неактивно'
                )
            WHEN tc.is_active = false THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Задание неактивно'
                )
            WHEN tod.completed_today = true THEN 
                jsonb_build_object(
                    'status', false,
                    'message', 'Ежедневный бонус уже получен сегодня. Возвращайся завтра!'
                )
            ELSE NULL
        END as error,
        tc.points,
        tc.title
    FROM task_check tc
    CROSS JOIN today_check tod
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
            'message', 'Ежедневный бонус успешно получен!',
            'points_awarded', et.points_awarded,
            'new_balance', ub.card_balance
        )
    ) as result
FROM validation v
LEFT JOIN execute_task et ON v.error IS NULL
LEFT JOIN update_balance ub ON v.error IS NULL;

