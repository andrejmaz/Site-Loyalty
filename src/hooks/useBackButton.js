import { useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import webAppManager from '../services/webAppManager';

/**
 * Хук для управления кнопкой "Назад" в Telegram WebApp
 * 
 * Логика работы:
 * - На главных страницах (/, /tasks, /balance, /catalog) - показывает кнопку "Закрыть"
 * - На вложенных страницах (/tasks/cashback, /tasks/instagram-subscribe, /tasks/review, /tasks/instagram-stories) - показывает кнопку "Назад"
 */
export const useBackButton = () => {
    const navigate = useNavigate();
    const location = useLocation();

    // Главные страницы, где должна быть кнопка "Закрыть"
    const mainPages = ['/', '/tasks', '/balance', '/catalog'];

    useEffect(() => {
        // Работаем только в Telegram WebApp
        if (!webAppManager.isWebApp()) {
            return;
        }

        const currentPath = location.pathname;
        const isMainPage = mainPages.includes(currentPath);

        if (isMainPage) {
            // На главных страницах скрываем кнопку назад
            webAppManager.hideBackButton();
        } else {
            // На вложенных страницах показываем кнопку "Назад"
            const handleBack = () => handleBackNavigation(currentPath);
            webAppManager.showBackButton(handleBack);
            
            // Возвращаем функцию очистки для этого конкретного обработчика
            return () => {
                webAppManager.hideBackButton();
            };
        }

        // Cleanup при размонтировании компонента
        return () => {
            if (webAppManager.isWebApp()) {
                webAppManager.hideBackButton();
            }
        };
    }, [location.pathname, navigate]);

    /**
     * Обрабатывает навигацию назад в зависимости от текущего пути
     */
    const handleBackNavigation = (currentPath) => {
        // Разбиваем путь на сегменты, убирая пустые элементы
        const pathSegments = currentPath.split('/').filter(segment => segment.length > 0);
        
        // Если путь состоит из одного сегмента или пустой - это главная страница
        if (pathSegments.length <= 1) {
            // Для главных страниц используем стандартную навигацию или идем на главную
            if (window.history.length > 1) {
                navigate(-1);
            } else {
                navigate('/');
            }
            return;
        }
        
        // Для вложенных страниц строим родительский путь
        // Убираем последний сегмент, чтобы получить родительский путь
        const parentSegments = pathSegments.slice(0, -1);
        const parentPath = '/' + parentSegments.join('/');
        
        // Проверяем, является ли родительский путь главной страницей
        if (mainPages.includes(parentPath)) {
            navigate(parentPath);
        } else {
            // Если родительский путь не главная страница, используем стандартную навигацию
            if (window.history.length > 1) {
                navigate(-1);
            } else {
                navigate('/');
            }
        }
    };

    return {
        // Возвращаем функцию для ручного управления, если нужно
        goBack: () => handleBackNavigation(location.pathname),
        isMainPage: mainPages.includes(location.pathname)
    };
};
