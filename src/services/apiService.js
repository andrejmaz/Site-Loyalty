import { getToken } from './auth';

class ApiService {
    constructor() {
        this.baseURL = 'https://api.bmulti.store/webhook';
        this.authToken = null;
        this.pendingRequests = new Map(); // Для предотвращения дублирующих запросов
    }

    /**
     * Устанавливает токен авторизации
     */
    setAuthToken(token) {
        this.authToken = token;
    }

    /**
     * Получает заголовки для запросов
     */
    getHeaders() {
        const headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        };

        // Получаем токен из auth сервиса (приоритет) или из локального свойства
        const token = getToken() || this.authToken;
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }

        return headers;
    }

    /**
     * Выполняет HTTP запрос
     */
    async request(endpoint, options = {}) {
        const url = `${this.baseURL}${endpoint}`;
        const requestKey = `${options.method || 'GET'}_${url}_${JSON.stringify(options.body || {})}`;
        
        // Проверяем, есть ли уже аналогичный запрос в процессе
        if (this.pendingRequests.has(requestKey)) {
            if (import.meta.env?.MODE === 'development') {
                console.log('Request already pending, waiting...', requestKey);
            }
            return this.pendingRequests.get(requestKey);
        }
        
        const config = {
            headers: this.getHeaders(),
            ...options
        };

        const requestPromise = this.executeRequest(url, config);
        
        // Сохраняем promise запроса
        this.pendingRequests.set(requestKey, requestPromise);
        
        try {
            const result = await requestPromise;
            return result;
        } finally {
            // Удаляем запрос из pending после завершения
            this.pendingRequests.delete(requestKey);
        }
    }

    /**
     * Выполняет сам HTTP запрос
     */
    async executeRequest(url, config) {
        const isDev = import.meta.env?.MODE === 'development';
        
        if (isDev) {
            console.log('API Request:', { 
                url, 
                method: config.method || 'GET',
                hasAuth: !!this.authToken
            });
        }
        
        try {
            const response = await fetch(url, config);
            
            if (isDev) {
                console.log('API Response:', {
                    url,
                    status: response.status,
                    ok: response.ok
                });
            }
            
            if (!response.ok) {
                // Создаем более информативные ошибки
                const errorMessage = response.status === 401 
                    ? 'Необходима авторизация, зайдите через Telegram-бота' 
                    : response.status === 403 
                    ? 'Нет доступа к ресурсу'
                    : response.status === 404 
                    ? 'Ресурс не найден'
                    : response.status >= 500 
                    ? 'Ошибка сервера'
                    : `HTTP error! status: ${response.status}`;
                    
                throw new Error(errorMessage);
            }

            const data = await response.json();
            
            if (isDev && data) {
                console.log('API Data:', data);
            }
            
            return data;
        } catch (error) {
            // Логируем только в dev режиме
            if (isDev) {
                console.error('API Error:', { url, error: error.message });
            }
            
            // Проверяем тип ошибки для более понятных сообщений
            if (error.name === 'TypeError' && error.message.includes('fetch')) {
                throw new Error('Ошибка сети. Проверьте подключение к интернету');
            }
            
            throw error;
        }
    }

    /**
     * GET запрос
     */
    async get(endpoint) {
        return this.request(endpoint, {
            method: 'GET'
        });
    }

    /**
     * POST запрос
     */
    async post(endpoint, data) {
        return this.request(endpoint, {
            method: 'POST',
            body: JSON.stringify(data)
        });
    }

    /**
     * POST запрос с FormData (для загрузки файлов)
     */
    async postFormData(endpoint, data) {
        const url = `${this.baseURL}${endpoint}`;
        const requestKey = `POST_${url}_FormData_${Date.now()}`;
        
        // Проверяем, есть ли уже аналогичный запрос в процессе
        if (this.pendingRequests.has(requestKey)) {
            if (import.meta.env?.MODE === 'development') {
                console.log('Request already pending, waiting...', requestKey);
            }
            return this.pendingRequests.get(requestKey);
        }
        
        const token = getToken() || this.authToken;
        const headers = {
            'Accept': 'application/json'
        };
        
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }
        
        const config = {
            method: 'POST',
            headers: headers,
            body: data
        };
        
        const requestPromise = this.executeRequest(url, config);
        
        // Сохраняем promise запроса
        this.pendingRequests.set(requestKey, requestPromise);
        
        try {
            const result = await requestPromise;
            return result;
        } finally {
            // Удаляем запрос из pending после завершения
            this.pendingRequests.delete(requestKey);
        }
    }

    /**
     * PUT запрос
     */
    async put(endpoint, data) {
        return this.request(endpoint, {
            method: 'PUT',
            body: JSON.stringify(data)
        });
    }

    /**
     * DELETE запрос
     */
    async delete(endpoint) {
        return this.request(endpoint, {
            method: 'DELETE'
        });
    }

    // === АВТОРИЗАЦИЯ ===

    async authenticateUser(initData, startParam = null) {
        const response = await this.post('/user/auth', {
            initData: initData || null,
            startApp: startParam || null
        });
        
        if (response.status && response.JWT_token) {
            this.setAuthToken(response.JWT_token);
        }
        
        return response;
    }

    // === USER ===
    
    /**
     * Получить список заданий пользователя
     */
    async getTasks() {
        return this.get('/user/tasks');
    }

    /**
     * Получить историю транзакций пользователя
     */
    async getTransactions() {
        return this.get('/user/transactions');
    }

    /**
     * Получить текущий баланс пользователя
     */
    async getUserBalance() {
        return this.get('/user/balance');
    }

    /**
     * Получить статистику реферальной программы
     */
    getReferralStats() {
        return this.get('/user/referrals');
    }

    // === КАТАЛОГ ===

    /**
     * Получить товары из каталога
     */
    async getStoreItems() {
        return this.get('/store/items');
    }

    
    // === ЗАДАНИЯ ===

    /**
     * Получить ежедневный бонус
     */
    async claimDailyBonus() {
        return this.post('/tasks/daily-bonus');
    }

    /**
     * Получить бонус за подписку на Telegram канал
     */
    async claimTelegramSubscription() {
        return this.post('/tasks/telegram-subscription-bonus');
    }

    /**
     * Получить бонус за отзыв
     */
    async submitTaskRequest(formData) {
        return this.postFormData('/tasks/submit-task', formData);
    }

    /**
     * Проверить подписку на Telegram канал
     */
    async checkTelegramSubscription() {
        return this.get('/tasks/check-telegram-subscription');
    }

    // === УТИЛИТЫ ===

    /**
     * Проверить статус API
     */
    async getStatus() {
        return this.get('/status');
    }

    /**
     * Очистить кэш pending запросов
     */
    clearPendingRequests() {
        this.pendingRequests.clear();
    }

    /**
     * Получить количество pending запросов (для отладки)
     */
    getPendingRequestsCount() {
        return this.pendingRequests.size;
    }
}

// Создаем единственный экземпляр сервиса
export const apiService = new ApiService();

// Экспортируем класс для возможного создания дополнительных экземпляров
export default ApiService;
