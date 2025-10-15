import { useState } from 'react';
import { apiService } from '../services/apiService';

/**
 * Хук для управления товарами каталога с кешированием
 */
export const useStoreItems = () => {
    const [storeItems, setStoreItems] = useState([]);
    const [storeItemsLoading, setStoreItemsLoading] = useState(false);
    const [storeItemsLastFetch, setStoreItemsLastFetch] = useState(null);
    
    // Константа TTL кеша (5 минут в миллисекундах)
    const CACHE_TTL = 5 * 60 * 1000;

    // Проверка валидности кеша
    const isCacheValid = () => {
        if (!storeItemsLastFetch) return false;
        const now = Date.now();
        return (now - storeItemsLastFetch) < CACHE_TTL;
    };

    // Загрузка товаров каталога
    const loadStoreItems = async (forceRefresh = false) => {
        // Проверяем кеш, если не принудительное обновление
        if (!forceRefresh && isCacheValid()) {
            return;
        }
        
        // Не загружаем, если уже идет загрузка
        if (storeItemsLoading) return;
        
        setStoreItemsLoading(true);
        try {
            const storeData = await apiService.getStoreItems();
            if (storeData && storeData.status && storeData.items) {
                setStoreItems(storeData.items);
                setStoreItemsLastFetch(Date.now());
            } else {
                setStoreItems([]);
            }
        } catch (error) {
            console.error('Error loading store items:', error);
            setStoreItems([]);
        } finally {
            setStoreItemsLoading(false);
        }
    };

    // Функция для принудительного обновления товаров
    const refreshStoreItems = async () => {
        await loadStoreItems(true);
    };

    return {
        storeItems,
        storeItemsLoading,
        isCacheValid: isCacheValid(),
        loadStoreItems,
        refreshStoreItems
    };
};
