-- ШАГ 4: Обработка успешного webhook (для verification_type = 'manual')
-- Завершение задачи после проверки менеджером
-- Параметры: 
--   $1 - user_task_id или salebot_order_id (в зависимости от логики)
--   $2 - поиск по 'id' или 'salebot_order_id'
--   $3 - custom_points (необязательно, NULL = использовать points_awarded из задания)

WITH user_task_info AS (
    SELECT 
        ut.id,
        ut.user_id,
        ut.task_id,
        ut.points_awarded,
        t.title,
        t.system_name,
        -- Используем custom_points если передан, иначе points_awarded из задания
        COALESCE($3, ut.points_awarded) as final_points
    FROM user_tasks ut
    JOIN tasks t ON t.id = ut.task_id
    WHERE 
        CASE 
            WHEN $2 = 'id' THEN ut.id = $1
            WHEN $2 = 'salebot_order_id' THEN ut.salebot_order_id = $1
        END
        AND ut.status = 'pending'
),
update_task AS (
    UPDATE user_tasks 
    SET 
        status = 'approved',
        completed_at = NOW(),
        verified_at = NOW(),
        -- Обновляем points_awarded если передан custom_points
        points_awarded = COALESCE($3, points_awarded)
    WHERE 
        CASE 
            WHEN $2 = 'id' THEN id = $1
            WHEN $2 = 'salebot_order_id' THEN salebot_order_id = $1
        END
        AND status = 'pending'
    RETURNING id, user_id
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
        uti.final_points,
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
    SET card_balance = card_balance + (SELECT final_points FROM user_task_info)
    WHERE id = (SELECT user_id FROM user_task_info)
      AND EXISTS (SELECT 1 FROM update_task)
    RETURNING id, card_balance, first_name
)
-- Используем COALESCE для гарантированного возврата результата
SELECT 
    COALESCE(
        (SELECT jsonb_build_object(
            'status', true,
            'message', 'Задание проверено и одобрено! Бонус начислен',
            'user_id', ut.user_id,
            'user_name', ub.first_name,
            'points_awarded', uti.final_points,
            'new_balance', ub.card_balance,
            'task_title', uti.title
        )
        FROM update_task ut
        LEFT JOIN user_task_info uti ON true
        LEFT JOIN update_balance ub ON true),
        jsonb_build_object(
            'status', false,
            'message', 'Задание не найдено или уже обработано',
            'user_id', NULL,
            'user_name', NULL,
            'points_awarded', NULL,
            'new_balance', NULL,
            'task_title', NULL
        )
    ) as result;

