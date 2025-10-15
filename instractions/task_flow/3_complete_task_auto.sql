-- ШАГ 3: Завершение задачи (для verification_type = 'auto')
-- Выполняет: обновление статуса, создание транзакции, обновление баланса
-- Параметры: 
--   $1 - user_task_id (ID записи из user_tasks)

WITH user_task_info AS (
    SELECT 
        ut.id,
        ut.user_id,
        ut.task_id,
        ut.points_awarded,
        t.title,
        t.system_name
    FROM user_tasks ut
    JOIN tasks t ON t.id = ut.task_id
    WHERE ut.id = $1 AND ut.status = 'pending'
),
update_task AS (
    UPDATE user_tasks 
    SET 
        status = 'approved',
        completed_at = NOW(),
        verified_at = NOW()
    WHERE id = $1 AND status = 'pending'
    RETURNING id
),
add_transaction AS (
    INSERT INTO point_transactions (
        user_id,
        amount,
        transaction_type,
        description,
        task_id,
        user_task_id,
        created_at
    )
    SELECT 
        uti.user_id,
        uti.points_awarded,
        'task_reward',
        uti.title,
        uti.task_id,
        uti.id,
        NOW()
    FROM user_task_info uti
    WHERE EXISTS (SELECT 1 FROM update_task)
    RETURNING id, amount
),
update_balance AS (
    UPDATE users 
    SET card_balance = card_balance + (SELECT points_awarded FROM user_task_info)
    WHERE id = (SELECT user_id FROM user_task_info)
      AND EXISTS (SELECT 1 FROM update_task)
    RETURNING id, card_balance
)
-- Используем VALUES для гарантированного возврата результата
SELECT 
    COALESCE(
        (SELECT jsonb_build_object(
            'status', true,
            'message', 
                CASE 
                    WHEN uti.system_name = 'daily_bonus' THEN 'Ежедневный бонус успешно получен!'
                    WHEN uti.system_name = 'telegram_subscribe' THEN 'Спасибо за подписку! Бонус начислен'
                    WHEN uti.system_name = 'referral' THEN 'Друг добавлен! Бонус начислен'
                    ELSE 'Задание выполнено! Бонус начислен'
                END,
            'points_awarded', uti.points_awarded,
            'new_balance', ub.card_balance
        )
        FROM update_task ut
        CROSS JOIN user_task_info uti
        LEFT JOIN update_balance ub ON true),
        jsonb_build_object(
            'status', false,
            'message', 'Задание не найдено или уже выполнено',
            'points_awarded', NULL,
            'new_balance', NULL
        )
    ) as result;

