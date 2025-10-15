-- ШАГ 1: Проверка доступности задания
-- Параметры: 
--   $1 - user_id
--   $2 - task_id

WITH task_info AS (
    -- Получаем информацию о задании
    SELECT 
        t.id,
        t.title,
        t.points,
        t.system_name,
        t.is_active,
        t.is_one_time,
        t.monthly_limit,
        t.verification_type,
        t.icon_url
    FROM tasks t
    WHERE t.id = $2
),
user_stats AS (
    -- Собираем статистику пользователя по этому заданию
    SELECT 
        -- Проверка выполнения сегодня (для daily_bonus)
        BOOL_OR(
            DATE(completed_at) = CURRENT_DATE 
            AND status = 'approved'
        ) as completed_today,
        -- Проверка наличия задачи в работе (для manual заданий)
        BOOL_OR(status = 'pending') as has_pending,
        -- Количество выполнений за текущий месяц
        COUNT(*) FILTER (
            WHERE status = 'approved' 
            AND DATE_TRUNC('month', completed_at) = DATE_TRUNC('month', CURRENT_DATE)
        ) as monthly_completed_count,
        -- Проверка на выполнение одноразовых заданий
        BOOL_OR(status = 'approved') as ever_completed
    FROM user_tasks
    WHERE user_id = $1 AND task_id = $2
)
-- Возвращаем результат проверки
SELECT 
    jsonb_build_object(
        'status', 
        CASE 
            -- Задание не найдено
            WHEN ti.id IS NULL THEN false
            -- Задание неактивно
            WHEN ti.is_active = false THEN false
            -- Ежедневный бонус уже получен сегодня
            WHEN ti.system_name = 'daily_bonus' 
                 AND COALESCE(us.completed_today, false) = true THEN false
            -- Одноразовое задание уже выполнено
            WHEN ti.is_one_time = true 
                 AND COALESCE(us.ever_completed, false) = true THEN false
            -- Месячный лимит исчерпан
            WHEN ti.monthly_limit IS NOT NULL 
                 AND COALESCE(us.monthly_completed_count, 0) >= ti.monthly_limit THEN false
            -- Задание с ручной проверкой уже находится в работе
            WHEN ti.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
                 AND COALESCE(us.has_pending, false) = true THEN false
            -- Доступно
            ELSE true
        END,
        'message',
        CASE 
            WHEN ti.id IS NULL THEN 'Задание не найдено'
            WHEN ti.is_active = false THEN 'Задание неактивно'
            WHEN ti.system_name = 'daily_bonus' 
                 AND COALESCE(us.completed_today, false) = true THEN 'Ежедневный бонус уже получен сегодня. Возвращайся завтра!'
            WHEN ti.is_one_time = true 
                 AND COALESCE(us.ever_completed, false) = true THEN 'Вы уже выполнили это задание'
            WHEN ti.monthly_limit IS NOT NULL 
                 AND COALESCE(us.monthly_completed_count, 0) >= ti.monthly_limit THEN 'Месячный лимит исчерпан'
            WHEN ti.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
                 AND COALESCE(us.has_pending, false) = true THEN 'У вас уже есть заявка в работе'
            ELSE 'Задание доступно'
        END,
        'task_info',
        CASE 
            WHEN ti.id IS NOT NULL THEN
                jsonb_build_object(
                    'id', ti.id,
                    'title', ti.title,
                    'points', ti.points,
                    'system_name', ti.system_name,
                    'verification_type', ti.verification_type,
                    'icon_url', ti.icon_url
                )
            ELSE NULL
        END
    ) as result
FROM task_info ti
LEFT JOIN user_stats us ON true;

