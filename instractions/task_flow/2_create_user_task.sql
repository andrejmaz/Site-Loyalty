-- ШАГ 2: Создание записи в user_tasks со статусом pending
-- Параметры: 
--   $1 - user_id
--   $2 - task_id
--   $3 - points

WITH task_info AS (
    SELECT points, title, verification_type
    FROM tasks
    WHERE id = $2 AND is_active = true
),
insert_task AS (
    INSERT INTO user_tasks (
        user_id,
        task_id,
        status,
        points_awarded,
        completed_at,
        verified_at
    )
    SELECT 
        $1,
        $2,
        'pending',
        COALESCE($3,ti.points),
        NULL,  -- completed_at будет установлен при завершении
        NULL  -- verified_at будет установлен при завершении
    FROM task_info ti
    RETURNING id, user_id, task_id, status, points_awarded, created_at
)
SELECT 
    jsonb_build_object(
        'status', true,
        'message', 'Заявка создана',
        'user_task', jsonb_build_object(
            'id', it.id,
            'user_id', it.user_id,
            'task_id', it.task_id,
            'status', it.status,
            'points_awarded', it.points_awarded,
            'created_at', it.created_at
        ),
        'verification_type', ti.verification_type
    ) as result
FROM insert_task it
CROSS JOIN task_info ti;

