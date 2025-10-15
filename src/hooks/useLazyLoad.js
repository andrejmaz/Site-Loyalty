import { useState, useEffect, useRef, useCallback } from 'react';
import { useLocation } from 'react-router-dom';

/**
 * Кастомный хук для ленивой загрузки списков
 * @param {Array} items - Полный список элементов
 * @param {number} initialCount - Начальное количество элементов
 * @param {number} loadCount - Количество элементов для подгрузки
 * @param {string} storageKey - Ключ для сохранения состояния в sessionStorage
 * @returns {Object} - Объект с данными и методами для ленивой загрузки
 */
export const useLazyLoad = (items = [], initialCount = 10, loadCount = 10, storageKey = null) => {
    const location = useLocation();
    
    // Восстанавливаем состояние из sessionStorage если доступно
    const getInitialCount = () => {
        if (!storageKey) return initialCount;
        
        try {
            const saved = sessionStorage.getItem(storageKey);
            if (saved) {
                const { count, pathname, timestamp } = JSON.parse(saved);
                // Проверяем актуальность (30 минут) и что мы на той же странице
                const isValid = Date.now() - timestamp < 30 * 60 * 1000 && pathname === location.pathname;
                if (isValid && count > initialCount) {
                    return count;
                }
            }
        } catch (error) {
            console.error('Error restoring lazy load state:', error);
        }
        return initialCount;
    };

    const [displayedCount, setDisplayedCount] = useState(getInitialCount);
    const observerRef = useRef(null);
    const loadMoreRef = useRef(null);

    // Функция для загрузки следующей порции
    const loadMore = useCallback(() => {
        setDisplayedCount(prev => {
            const newCount = prev + loadCount;
            return newCount > items.length ? items.length : newCount;
        });
    }, [items.length, loadCount]);

    // Сохранение состояния в sessionStorage
    useEffect(() => {
        if (!storageKey || displayedCount === initialCount) return;

        const stateData = {
            count: displayedCount,
            pathname: location.pathname,
            timestamp: Date.now()
        };
        sessionStorage.setItem(storageKey, JSON.stringify(stateData));
    }, [displayedCount, storageKey, location.pathname, initialCount]);

    // Сброс при изменении списка
    useEffect(() => {
        if (items.length > 0 && displayedCount > items.length) {
            setDisplayedCount(Math.min(initialCount, items.length));
        }
    }, [items.length, displayedCount, initialCount]);

    // Intersection Observer
    useEffect(() => {
        if (displayedCount >= items.length || items.length === 0) {
            return;
        }

        const options = {
            root: null,
            rootMargin: '100px',
            threshold: 0.1
        };

        observerRef.current = new IntersectionObserver((entries) => {
            if (entries[0].isIntersecting) {
                loadMore();
            }
        }, options);

        const currentRef = loadMoreRef.current;
        if (currentRef) {
            observerRef.current.observe(currentRef);
        }

        return () => {
            if (observerRef.current && currentRef) {
                observerRef.current.unobserve(currentRef);
            }
        };
    }, [displayedCount, items.length, loadMore]);

    return {
        displayedItems: items.slice(0, displayedCount),
        hasMore: displayedCount < items.length,
        loadMoreRef,
        displayedCount,
        totalCount: items.length,
        reset: () => setDisplayedCount(initialCount)
    };
};
