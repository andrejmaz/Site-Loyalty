import { useState, useEffect } from 'react';
import webAppManager from '../services/webAppManager';
import { hasViewedRules, setRulesViewed } from '../services/auth';
import { useModal } from './useModal';

/**
 * Хук для управления инициализацией приложения
 */
export const useAppInitialization = (initializeUser) => {
    const rulesModal = useModal();
    const [initializing, setInitializing] = useState(true);

    useEffect(() => {
        const init = async () => {
            // Инициализируем Telegram WebApp
            webAppManager.init();

            // Инициализируем пользователя
            await initializeUser();

            setInitializing(false);

            // Проверяем, нужно ли показать правила
            if (!hasViewedRules()) {
                setTimeout(() => {
                    rulesModal.open();
                }, 500);
            }
        };

        init();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    // Обработчик закрытия модального окна правил
    const handleRulesClose = () => {
        setRulesViewed();
        rulesModal.close();
    };

    return { 
        initializing,
        handleRulesClose
    };
};
