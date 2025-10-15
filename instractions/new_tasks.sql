-- Оптимизированный запрос для получения списка заданий с минимальным набором полей
-- Параметр: $1 - user_id

WITH user_task_stats AS (
    -- Собираем статистику по задачам пользователя
    SELECT 
        task_id,
        -- Проверка выполнения сегодня (для daily_bonus)
        BOOL_OR(DATE(completed_at) = CURRENT_DATE AND status = 'approved') as completed_today,
        -- Проверка наличия задачи в работе (для cashback, instagram_subscribe, review, instagram_story)
        BOOL_OR(status = 'pending') as has_pending,
        -- Количество выполненных задач за текущий месяц (для monthly_limit)
        COUNT(*) FILTER (
            WHERE status = 'approved' 
            AND DATE_TRUNC('month', completed_at) = DATE_TRUNC('month', CURRENT_DATE)
        ) as monthly_completed_count,
        -- Проверка на выполнение одноразовых задач
        BOOL_OR(status = 'approved') as ever_completed
    FROM user_tasks 
    WHERE user_id = $1
    GROUP BY task_id
)

SELECT 
    t.id,
    t.title,
    t.points,
    t.system_name,
    t.icon_url,
    
    -- Определяем доступность задания
    CASE 
        -- Ежедневный бонус - недоступен если уже получен сегодня
        WHEN t.system_name = 'daily_bonus' AND COALESCE(uts.completed_today, false) = true THEN 
            false
        
        -- Одноразовые задания - недоступны если уже выполнены
        WHEN t.is_one_time = true AND COALESCE(uts.ever_completed, false) = true THEN 
            false
        
        -- Задания с месячным лимитом - недоступны если лимит исчерпан
        WHEN t.monthly_limit IS NOT NULL 
             AND COALESCE(uts.monthly_completed_count, 0) >= t.monthly_limit THEN 
            false
        
        -- Задания с ручной проверкой - недоступны если есть заявка в работе
        WHEN t.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
             AND COALESCE(uts.has_pending, false) = true THEN 
            false
        
        -- Во всех остальных случаях - доступно
        ELSE true
    END as is_available,
    
    -- Определяем текст статуса
    CASE 
        -- Ежедневный бонус - если выполнен сегодня
        WHEN t.system_name = 'daily_bonus' AND COALESCE(uts.completed_today, false) = true THEN 
            'Возвращайся завтра'
        
        -- Одноразовые задания - если выполнены
        WHEN t.is_one_time = true AND COALESCE(uts.ever_completed, false) = true THEN 
            'Выполнено'
        
        -- Месячный лимит исчерпан
        WHEN t.monthly_limit IS NOT NULL 
             AND COALESCE(uts.monthly_completed_count, 0) >= t.monthly_limit THEN 
            'Месячный лимит исчерпан'
        
        -- Задания с ручной проверкой - если есть заявка в работе
        WHEN t.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
             AND COALESCE(uts.has_pending, false) = true THEN 
            'В работе'
        
        -- Доступно для выполнения
        ELSE 'Доступно'
    END as available_text

FROM tasks t
LEFT JOIN user_task_stats uts ON t.id = uts.task_id

WHERE 
    t.is_active = true  -- Показываем только активные задания
    -- Не скрываем одноразовые задания, чтобы показать статус "Выполнено"
    
ORDER BY 
    -- Основная сортировка по приоритету
    CASE 
        -- 1. daily_bonus всегда первый (независимо от статуса)
        WHEN t.system_name = 'daily_bonus' THEN 1
        
        -- 2. Доступные задания
        WHEN (
            -- Не daily_bonus И не выполненные одноразовые И не исчерпан лимит И нет pending
            t.system_name != 'daily_bonus'
            AND NOT (t.is_one_time = true AND COALESCE(uts.ever_completed, false) = true)
            AND NOT (t.monthly_limit IS NOT NULL AND COALESCE(uts.monthly_completed_count, 0) >= t.monthly_limit)
            AND NOT (t.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
                     AND COALESCE(uts.has_pending, false) = true)
        ) THEN 2
        
        -- 3. На проверке (pending)
        WHEN t.system_name IN ('cashback', 'instagram_subscribe', 'review', 'instagram_story') 
             AND COALESCE(uts.has_pending, false) = true THEN 3
        
        -- 4. Месячный лимит исчерпан
        WHEN t.monthly_limit IS NOT NULL 
             AND COALESCE(uts.monthly_completed_count, 0) >= t.monthly_limit THEN 4
        
        -- 5. Одноразовые выполненные
        WHEN t.is_one_time = true AND COALESCE(uts.ever_completed, false) = true THEN 5
        
        ELSE 6
    END,
    -- Внутри каждой группы сортируем по index
    t.index ASC NULLS LAST;


