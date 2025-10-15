import { useState, useEffect } from 'react';
import { apiService } from '../services/apiService';
import { setToken, setUserData, getUserData } from '../services/auth';
import webAppManager from '../services/webAppManager';

/**
 * Хук для управления данными пользователя
 */
export const useUser = () => {
    const [user, setUser] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    // Инициализация и авторизация пользователя
    const initializeUser = async () => {
        setLoading(true);
        setError(null);

        try {
            // Получаем initData из Telegram WebApp
            const initData = webAppManager.getInitData();
            const startParam = webAppManager.getStartParam();

            // Аутентифицируем пользователя
            const userData = await apiService.authenticateUser(initData, startParam);

            if (userData.status === true) {
                // Сохраняем токен и данные пользователя
                setToken(userData.JWT_token);
                setUserData(userData);
                setUser(userData);
                return userData;
            } else {
                setError(userData.message || 'Ошибка авторизации');
                return null;
            }
        } catch (err) {
            console.error('Error initializing user:', err);
            setError(err.message || 'Ошибка подключения к серверу');
            return null;
        } finally {
            setLoading(false);
        }
    };

    // Обновить баланс пользователя (локально)
    const updateBalance = (newBalance) => {
        if (user) {
            const updatedUser = {
                ...user,
                user: {
                    ...user.user,
                    card_balance: newBalance
                }
            };
            setUser(updatedUser);
            setUserData(updatedUser);
        }
    };

    // Обновить баланс пользователя с сервера
    const refreshBalance = async () => {
        try {
            const response = await apiService.getUserBalance();
            
            if (response.status === true && response.card_balance !== undefined) {
                updateBalance(response.card_balance);
                return response.card_balance;
            }
            return null;
        } catch (err) {
            console.error('Error refreshing balance:', err);
            return null;
        }
    };

    // Загрузить пользователя из кеша при монтировании
    useEffect(() => {
        const cachedUser = getUserData();
        if (cachedUser) {
            setUser(cachedUser);
            setLoading(false);
        }
    }, []);

    return {
        user,
        loading,
        error,
        initializeUser,
        updateBalance,
        refreshBalance
    };
};
