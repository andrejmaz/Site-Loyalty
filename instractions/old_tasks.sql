WITH user_task_stats AS (
    -- Получаем статистику по выполненным задачам пользователя
    SELECT 
        task_id,
        COUNT(*) as completion_count,
        MAX(CASE WHEN DATE(completed_at) = CURRENT_DATE THEN 1 ELSE 0 END) as completed_today,
        MAX(CASE WHEN status = 'pending' THEN 1 ELSE 0 END) as has_in_work,
        -- Считаем выполненные задачи за текущий месяц со статусом "approved"
        COUNT(CASE WHEN status = 'approved' AND DATE_TRUNC('month', completed_at) = DATE_TRUNC('month', CURRENT_DATE) THEN 1 END) as monthly_approved_count
    FROM user_tasks 
    WHERE user_id = $1
    GROUP BY task_id
),
task_availability AS (
    SELECT 
        t.*,
        COALESCE(uts.completion_count, 0) as completion_count,
        COALESCE(uts.completed_today, 0) as completed_today,
        COALESCE(uts.has_in_work, 0) as has_in_work,
        COALESCE(uts.monthly_approved_count, 0) as monthly_approved_count,
        
        -- Определяем доступность и причину недоступности
        CASE 
            -- Неактивные задачи - не выводим вообще
            WHEN t.is_active = false THEN 
                'hidden'
                
            -- Ежедневный бонус
            WHEN t.system_name = 'daily_bonus' AND uts.completed_today = 1 THEN 
                'unavailable'
            
            -- Разовые задачи - скрываем если уже выполнены
            WHEN t.is_one_time = true AND uts.completion_count > 0 THEN 
                'hidden'
            
            -- Проверяем месячный лимит
            WHEN t.monthly_limit IS NOT NULL AND uts.monthly_approved_count >= t.monthly_limit THEN 
                'unavailable'
            
            -- Задачи с проверкой - недоступны если есть задача в работе
            WHEN t.system_name IN ('cashback', 'review', 'instagram_subscribe', 'instagram_story') 
                 AND uts.has_in_work = 1 THEN 
                'unavailable'
                
            ELSE 'available'
        END as availability_status,
        
        -- Сообщение о причине недоступности
        CASE 
            WHEN t.system_name = 'daily_bonus' AND uts.completed_today = 1 THEN 
                'Возвращайся завтра'
                
            WHEN t.monthly_limit IS NOT NULL AND uts.monthly_approved_count >= t.monthly_limit THEN 
                'Лимит исчерпан'
            
            WHEN t.system_name IN ('cashback', 'review', 'instagram_subscribe', 'instagram_story') 
                 AND uts.has_in_work = 1 THEN 
                'В работе'
                
            ELSE NULL
        END as unavailable_reason
    FROM tasks t
    LEFT JOIN user_task_stats uts ON t.id = uts.task_id
)

SELECT 
    id,
    title,
    description,
    points,
    system_name,
    is_one_time,
    is_active,
    monthly_limit,
    verification_type,
    icon_url,
    index,
    completion_count,
    availability_status,
    unavailable_reason,
    
    -- Дополнительная информация для фронтенда
    CASE 
        WHEN availability_status = 'available' THEN true
        ELSE false
    END as is_available,
    
    CASE 
        WHEN system_name = 'daily_bonus' AND completed_today = 0 THEN true
        WHEN system_name != 'daily_bonus' AND availability_status = 'available' THEN true
        ELSE false
    END as can_start
    
FROM task_availability
WHERE availability_status != 'hidden'  -- Не показываем скрытые разовые задачи
ORDER BY 
    index ASC,
    CASE availability_status 
        WHEN 'available' THEN 1 
        WHEN 'unavailable' THEN 2 
        ELSE 3 
    END;