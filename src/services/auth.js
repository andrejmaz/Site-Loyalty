/**
 * Сервис для управления авторизацией
 */

const TOKEN_KEY = 'authToken';
const USER_KEY = 'userData';

/**
 * Сохранить токен в localStorage
 */
export const setToken = (token) => {
    localStorage.setItem(TOKEN_KEY, token);
};

/**
 * Получить токен из localStorage
 */
export const getToken = () => {
    return localStorage.getItem(TOKEN_KEY);
};

/**
 * Удалить токен из localStorage
 */
export const removeToken = () => {
    localStorage.removeItem(TOKEN_KEY);
};

/**
 * Сохранить данные пользователя в localStorage
 */
export const setUserData = (userData) => {
    localStorage.setItem(USER_KEY, JSON.stringify(userData));
};

/**
 * Получить данные пользователя из localStorage
 */
export const getUserData = () => {
    const data = localStorage.getItem(USER_KEY);
    return data ? JSON.parse(data) : null;
};

/**
 * Удалить данные пользователя из localStorage
 */
export const removeUserData = () => {
    localStorage.removeItem(USER_KEY);
};

/**
 * Проверить, авторизован ли пользователь
 */
export const isAuthenticated = () => {
    return !!getToken();
};

/**
 * Очистить все данные авторизации
 */
export const clearAuth = () => {
    removeToken();
    removeUserData();
};

/**
 * Проверка и сохранение флага просмотра правил
 */
export const hasViewedRules = () => {
    return localStorage.getItem('rulesViewed') === 'true';
};

export const setRulesViewed = () => {
    localStorage.setItem('rulesViewed', 'true');
};

export const resetRulesViewed = () => {
    localStorage.removeItem('rulesViewed');
};
