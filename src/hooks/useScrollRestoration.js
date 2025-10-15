import { useEffect, useLayoutEffect, useRef, useState, useMemo } from 'react';
import { useLocation } from 'react-router-dom';

/**
 * Хук для сохранения и восстановления позиции скролла
 * @param {string} storageKey - Уникальный ключ для хранения позиции скролла
 * @param {Array} dependencies - Зависимости, при изменении которых сохраняется скролл
 * @returns {Object} - Ref для скролл-контейнера и функции управления
 */
export const useScrollRestoration = (storageKey = 'scroll-position', dependencies = []) => {
    const scrollRef = useRef(null);
    const location = useLocation();
    const isRestoringRef = useRef(false);
    const savedScrollRef = useRef(null);
    
    // Синхронно проверяем наличие сохраненной позиции ДО первого рендера
    const hasSavedPosition = useMemo(() => {
        try {
            const savedData = sessionStorage.getItem(storageKey);
            if (savedData) {
                const { pathname, timestamp } = JSON.parse(savedData);
                const isExpired = Date.now() - timestamp > 30 * 60 * 1000;
                return !isExpired && pathname === location.pathname;
            }
        } catch (error) {
            console.error('Error checking scroll position:', error);
        }
        return false;
    }, [storageKey, location.pathname]);
    
    const [isRestoring, setIsRestoring] = useState(hasSavedPosition);

    // Сохранение позиции скролла
    const saveScrollPosition = () => {
        if (scrollRef.current && !isRestoringRef.current) {
            const scrollData = {
                scrollTop: scrollRef.current.scrollTop,
                pathname: location.pathname,
                timestamp: Date.now()
            };
            sessionStorage.setItem(storageKey, JSON.stringify(scrollData));
            savedScrollRef.current = scrollData.scrollTop;
        }
    };

    // Восстановление позиции скролла (без изменения isRestoring)
    const restoreScrollPosition = () => {
        try {
            const savedData = sessionStorage.getItem(storageKey);
            if (!savedData) {
                return false;
            }

            const { scrollTop, pathname, timestamp } = JSON.parse(savedData);
            
            // Проверяем, что данные не устарели (максимум 30 минут)
            const isExpired = Date.now() - timestamp > 30 * 60 * 1000;
            if (isExpired) {
                sessionStorage.removeItem(storageKey);
                return false;
            }

            // Проверяем, что мы на той же странице
            if (pathname === location.pathname && scrollRef.current) {
                isRestoringRef.current = true;
                
                // Восстанавливаем позицию синхронно
                scrollRef.current.scrollTop = scrollTop;
                savedScrollRef.current = scrollTop;
                
                return true;
            }
            return false;
        } catch (error) {
            console.error('Error restoring scroll position:', error);
            return false;
        }
    };

    // Очистка сохраненной позиции
    const clearScrollPosition = () => {
        sessionStorage.removeItem(storageKey);
        savedScrollRef.current = null;
    };

    // Единая логика восстановления
    useLayoutEffect(() => {
        if (!scrollRef.current) return;
        
        // Если нет сохраненной позиции, сразу показываем контент
        if (!hasSavedPosition) {
            setIsRestoring(false);
            return;
        }
        
        // Если есть зависимости, проверяем что они загружены
        if (dependencies.length > 0) {
            const allDepsLoaded = dependencies.every(dep => {
                // Если зависимость - число (длина массива), проверяем что оно > 0
                if (typeof dep === 'number') return dep > 0;
                // Иначе просто проверяем на truthy
                return Boolean(dep);
            });
            
            // Если данные еще не загружены, ждем
            if (!allDepsLoaded) {
                return;
            }
        }
        
        // Восстанавливаем позицию
        const restored = restoreScrollPosition();
        
        // Показываем контент сразу после восстановления
        if (restored) {
            // Используем setTimeout(0) чтобы дать браузеру отрисовать скролл
            setTimeout(() => {
                isRestoringRef.current = false;
                setIsRestoring(false);
            }, 0);
        } else {
            setIsRestoring(false);
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [hasSavedPosition, ...dependencies]);

    // Сохранение позиции при скролле
    useEffect(() => {
        const scrollElement = scrollRef.current;
        if (!scrollElement) return;

        let scrollTimeout;
        const handleScroll = () => {
            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(() => {
                saveScrollPosition();
            }, 150); // Дебаунс для оптимизации
        };

        scrollElement.addEventListener('scroll', handleScroll, { passive: true });

        return () => {
            clearTimeout(scrollTimeout);
            scrollElement.removeEventListener('scroll', handleScroll);
            // Сохраняем позицию при размонтировании
            saveScrollPosition();
        };
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [storageKey, location.pathname]);

    // Сохранение при уходе со страницы
    useEffect(() => {
        const handleBeforeUnload = () => {
            saveScrollPosition();
        };

        window.addEventListener('beforeunload', handleBeforeUnload);
        
        return () => {
            window.removeEventListener('beforeunload', handleBeforeUnload);
        };
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    return {
        scrollRef,
        isRestoring,
        saveScrollPosition,
        restoreScrollPosition,
        clearScrollPosition,
        getCurrentScrollTop: () => scrollRef.current?.scrollTop || 0
    };
};

