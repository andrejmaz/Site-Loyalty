-- ШАГ 5: Обработка неуспешного webhook (отклонение заявки)
-- Изменение статуса задачи на 'rejected'
-- Параметры: 
--   $1 - user_task_id или salebot_order_id
--   $2 - поиск по 'id' или 'salebot_order_id'
--   $3 - причина отклонения (необязательно)

WITH user_task_info AS (
    SELECT 
        ut.id,
        ut.user_id,
        ut.task_id,
        t.title,
        t.system_name
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
        status = 'rejected',
        verified_at = NOW(),
        comment = COALESCE(
            CASE WHEN $3 IS NOT NULL AND $3 != '' THEN $3 ELSE comment END,
            'Заявка отклонена'
        )
    WHERE 
        CASE 
            WHEN $2 = 'id' THEN id = $1
            WHEN $2 = 'salebot_order_id' THEN salebot_order_id = $1
        END
        AND status = 'pending'
    RETURNING id, user_id, comment
),
get_user AS (
    SELECT first_name
    FROM users
    WHERE id = (SELECT user_id FROM user_task_info)
)
-- Используем COALESCE для гарантированного возврата результата
SELECT 
    COALESCE(
        (SELECT jsonb_build_object(
            'status', true,
            'message', 'Заявка отклонена',
            'user_id', ut.user_id,
            'user_name', gu.first_name,
            'task_title', uti.title,
            'rejection_reason', ut.comment
        )
        FROM update_task ut
        LEFT JOIN user_task_info uti ON true
        LEFT JOIN get_user gu ON true),
        jsonb_build_object(
            'status', false,
            'message', 'Задание не найдено или уже обработано',
            'user_id', NULL,
            'user_name', NULL,
            'task_title', NULL,
            'rejection_reason', NULL
        )
    ) as result;

