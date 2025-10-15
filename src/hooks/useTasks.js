import { useState, useCallback, useRef } from 'react';
import { apiService } from '../services/apiService';

/**
 * Хук для управления заданиями с кешированием и оптимизацией рендеринга
 */
export const useTasks = () => {
    const [tasks, setTasks] = useState([]);
    const [tasksLoading, setTasksLoading] = useState(false);
    const [isInitialLoad, setIsInitialLoad] = useState(true);
    
    // Используем ref для отслеживания состояния загрузки
    const isLoadingRef = useRef(false);

    // Загрузка заданий
    const loadTasks = useCallback(async () => {
        // Не загружаем, если уже идет загрузка
        if (isLoadingRef.current) {
            return;
        }
        
        isLoadingRef.current = true;
        setTasksLoading(true);
        
        try {
            const tasksData = await apiService.getTasks();
            if (tasksData && tasksData.status && tasksData.tasks) {
                // Обновляем только если данные действительно изменились
                setTasks(prevTasks => {
                    const hasChanged = JSON.stringify(prevTasks) !== JSON.stringify(tasksData.tasks);
                    if (hasChanged) {
                    }
                    return hasChanged ? tasksData.tasks : prevTasks;
                });
            } else {
                setTasks([]);
            }
        } catch (error) {
            console.error('Error loading tasks:', error);
            // При ошибке не сбрасываем текущие задания
        } finally {
            isLoadingRef.current = false;
            setTasksLoading(false);
            // Убираем флаг первой загрузки после первого запроса
            setIsInitialLoad(prev => prev ? false : prev);
        }
    }, []); // Пустой массив зависимостей!

    // Функция для принудительного обновления заданий
    const refreshTasks = useCallback(async () => {
        await loadTasks();
    }, [loadTasks]);

    return {
        tasks,
        tasksLoading,
        isInitialLoad,
        loadTasks,
        refreshTasks
    };
};
