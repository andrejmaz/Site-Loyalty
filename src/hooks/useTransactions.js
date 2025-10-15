import { useState, useCallback, useRef } from 'react';
import { apiService } from '../services/apiService';

/**
 * Хук для управления транзакциями с кешированием и оптимизацией рендеринга
 */
export const useTransactions = () => {
    const [transactions, setTransactions] = useState([]);
    const [transactionsLoading, setTransactionsLoading] = useState(false);
    const [isInitialLoad, setIsInitialLoad] = useState(true);
    
    // Используем ref для отслеживания состояния загрузки
    const isLoadingRef = useRef(false);

    // Загрузка транзакций
    const loadTransactions = useCallback(async () => {
        // Не загружаем, если уже идет загрузка
        if (isLoadingRef.current) {
            return;
        }
        
        isLoadingRef.current = true;
        setTransactionsLoading(true);
        
        try {
            const transactionsData = await apiService.getTransactions();
            if (transactionsData && transactionsData.status && transactionsData.transactions) {
                // Обновляем только если данные действительно изменились
                setTransactions(prevTransactions => {
                    const hasChanged = JSON.stringify(prevTransactions) !== JSON.stringify(transactionsData.transactions);
                    if (hasChanged) {
                    }
                    return hasChanged ? transactionsData.transactions : prevTransactions;
                });
            } else {
                setTransactions([]);
            }
        } catch (error) {
            console.error('Error loading transactions:', error);
            // При ошибке не сбрасываем текущие транзакции
        } finally {
            isLoadingRef.current = false;
            setTransactionsLoading(false);
            // Убираем флаг первой загрузки после первого запроса
            setIsInitialLoad(prev => prev ? false : prev);
        }
    }, []); // Пустой массив зависимостей!

    // Функция для принудительного обновления транзакций
    const refreshTransactions = useCallback(async () => {
        await loadTransactions();
    }, [loadTransactions]);

    // Добавить новую транзакцию в начало списка
    const addTransaction = useCallback((transaction) => {
        setTransactions(prevTransactions => [transaction, ...prevTransactions]);
    }, []);

    return {
        transactions,
        transactionsLoading,
        isInitialLoad,
        loadTransactions,
        refreshTransactions,
        addTransaction
    };
};

