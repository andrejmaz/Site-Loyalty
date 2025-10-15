-- Выполнение задания "Ежедневный бонус"
-- Параметры: 
--   $1 - user_id
--   $2 - task_id (ID задания daily_bonus)

DO $$
DECLARE
    v_task_points INTEGER;
    v_task_title VARCHAR(255);
    v_completed_today BOOLEAN;
    v_user_task_id INTEGER;
BEGIN
    -- Проверяем, выполнялось ли задание сегодня
    SELECT EXISTS (
        SELECT 1 
        FROM user_tasks 
        WHERE user_id = $1 
          AND task_id = $2 
          AND DATE(completed_at) = CURRENT_DATE
          AND status = 'approved'
    ) INTO v_completed_today;
    
    -- Если уже выполнено сегодня - возвращаем ошибку
    IF v_completed_today THEN
        RAISE EXCEPTION 'Ежедневный бонус уже получен сегодня. Возвращайся завтра!';
    END IF;
    
    -- Получаем информацию о задании
    SELECT points, title 
    INTO v_task_points, v_task_title
    FROM tasks 
    WHERE id = $2 AND system_name = 'daily_bonus' AND is_active = true;
    
    -- Если задание не найдено или неактивно
    IF v_task_points IS NULL THEN
        RAISE EXCEPTION 'Задание не найдено или неактивно';
    END IF;
    
    -- Создаем запись в user_tasks
    INSERT INTO user_tasks (
        user_id,
        task_id,
        status,
        points_awarded,
        completed_at,
        verified_at,
        salebot_order_id,
        created_at
    ) VALUES (
        $1,
        $2,
        'approved',
        v_task_points,
        NOW(),
        NOW(),
        0,  -- для daily_bonus не нужен salebot_order_id
        NOW()
    ) RETURNING id INTO v_user_task_id;
    
    -- Добавляем транзакцию начисления баллов
    INSERT INTO point_transactions (
        user_id,
        amount,
        transaction_type,
        description,
        task_id,
        created_at
    ) VALUES (
        $1,
        v_task_points,
        'task_completion',
        v_task_title,
        $2,
        NOW()
    );
    
    -- Обновляем баланс пользователя
    UPDATE users 
    SET card_balance = card_balance + v_task_points 
    WHERE id = $1;
    
    -- Возвращаем успешный результат
    RAISE NOTICE 'Ежедневный бонус успешно получен! Начислено % баллов.', v_task_points;
    
END $$;

