/**
 * Профессиональный менеджер для работы с Telegram Web App
 * Основан на лучших практиках и шаблоне template_tg.md
 */

class WebAppManager {
    constructor() {
        this.tg = window.Telegram?.WebApp;
        this.isInitialized = false;
    }

    /**
     * Инициализация Web App с настройками для CRM
     */
    init() {
        if (this.isInitialized) {
            return true;
        }

        // Если нет Telegram WebApp - помечаем как инициализированный для браузерной версии
        if (!this.tg?.initDataUnsafe?.user) {
            console.warn('Telegram Web App не доступен - работаем в режиме браузера');
            this.isInitialized = true;
            return true;
        }

        try {
            // Настроить цвета для темной темы CRM
            this.setHeaderColor('#EBEAEA');
            this.setBackgroundColor('#EBEAEA');

            // Развернуть на весь экран
            this.expandToFullscreen();

            // Готово к работе
            this.tg.ready();

            // Отключить вертикальные свайпы
            this.disableVerticalSwipes();
            
            // Настроить обработчик закрытия
            this.setupCloseHandler();
            
            this.isInitialized = true;
            console.log('Telegram Web App успешно инициализирован для CRM');
            
            return true;
            
        } catch (error) {
            console.error('Ошибка инициализации Telegram Web App:', error);
            return false;
        }
    }

    /**
     * Развернуть приложение на весь экран
     */
    expandToFullscreen() {
        if (this.tg?.expand) {
            this.tg.expand();
        }
    }

    /**
     * Отключить вертикальные свайпы
     */
    disableVerticalSwipes() {
        if (this.tg?.isVersionAtLeast && this.tg.isVersionAtLeast('7.7')) {
            this.tg.disableVerticalSwipes?.();
        }
    }

    /**
     * Установить цвет шапки Telegram
     * @param {string} color - Цвет в формате HEX
     */
    setHeaderColor(color = '#121212') {
        if (this.tg?.setHeaderColor) {
            this.tg.setHeaderColor(color);
        }
    }

    /**
     * Установить цвет фона приложения
     * @param {string} color - Цвет в формате HEX
     */
    setBackgroundColor(color = '#121212') {
        if (this.tg?.setBackgroundColor) {
            this.tg.setBackgroundColor(color);
        }
    }

    /**
     * Настроить обработчик закрытия приложения
     */
    setupCloseHandler() {
        if (this.tg?.onEvent) {
            // Включить подтверждение закрытия
            this.tg.enableClosingConfirmation();
        }
    }

    /**
     * Закрыть приложение
     */
    close() {
        if (this.tg?.close) {
            this.tg.close();
        }
    }

    // === УТИЛИТЫ ДЛЯ РАБОТЫ С ВИБРАЦИЕЙ ===

    /**
     * Легкая вибрация (для обратной связи при нажатиях)
     */
    hapticImpact() {
        if (this.tg?.HapticFeedback?.impactOccurred) {
            this.tg.HapticFeedback.impactOccurred('light');
        }
    }

    /**
     * Средняя вибрация
     */
    hapticMedium() {
        if (this.tg?.HapticFeedback?.impactOccurred) {
            this.tg.HapticFeedback.impactOccurred('medium');
        }
    }

    /**
     * Сильная вибрация
     */
    hapticHeavy() {
        if (this.tg?.HapticFeedback?.impactOccurred) {
            this.tg.HapticFeedback.impactOccurred('heavy');
        }
    }

    /**
     * Вибрация успеха
     */
    hapticSuccess() {
        if (this.tg?.HapticFeedback?.notificationOccurred) {
            this.tg.HapticFeedback.notificationOccurred('success');
        }
    }

    /**
     * Вибрация ошибки
     */
    hapticError() {
        if (this.tg?.HapticFeedback?.notificationOccurred) {
            this.tg.HapticFeedback.notificationOccurred('error');
        }
    }

    /**
     * Вибрация предупреждения
     */
    hapticWarning() {
        if (this.tg?.HapticFeedback?.notificationOccurred) {
            this.tg.HapticFeedback.notificationOccurred('warning');
        }
    }

    /**
     * Вибрация выбора (для переключателей)
     */
    hapticSelection() {
        if (this.tg?.HapticFeedback?.selectionChanged) {
            this.tg.HapticFeedback.selectionChanged();
        }
    }

    // === УТИЛИТЫ ДЛЯ РАБОТЫ С ИНТЕРФЕЙСОМ ===

    /**
     * Показать всплывающее сообщение
     * @param {string} message - Текст сообщения
     */
    showAlert(message) {
        if (this.tg?.showAlert) {
            this.tg.showAlert(message);
        } else {
            alert(message);
        }
    }

    /**
     * Показать подтверждение
     * @param {string} message - Текст вопроса
     * @param {function} callback - Функция обратного вызова с результатом (true/false)
     */
    showConfirm(message, callback) {
        if (this.tg?.showConfirm) {
            this.tg.showConfirm(message, callback);
        } else {
            const result = confirm(message);
            callback(result);
        }
    }

    /**
     * Показать попап для ввода текста
     * @param {string} title - Заголовок
     * @param {function} callback - Функция обратного вызова с введенным текстом
     */
    showPopup(title, callback) {
        if (this.tg?.showPopup) {
            this.tg.showPopup({
                title: title,
                message: '',
                buttons: [
                    { id: 'cancel', type: 'cancel' },
                    { id: 'ok', type: 'ok' }
                ]
            }, callback);
        }
    }

    // === УТИЛИТЫ ДЛЯ РАБОТЫ С КНОПКАМИ ===

    /**
     * Показать главную кнопку
     * @param {string} text - Текст кнопки
     * @param {function} callback - Функция обратного вызова при нажатии
     */
    showMainButton(text, callback) {
        if (this.tg?.MainButton) {
            this.tg.MainButton.text = text;
            this.tg.MainButton.show();
            this.tg.MainButton.onClick(callback);
        }
    }

    /**
     * Скрыть главную кнопку
     */
    hideMainButton() {
        if (this.tg?.MainButton) {
            this.tg.MainButton.hide();
        }
    }

    /**
     * Показать кнопку "Назад"
     * @param {function} callback - Функция обратного вызова при нажатии
     */
    showBackButton(callback) {
        if (this.tg?.BackButton) {
            // Сначала очищаем предыдущие обработчики
            this.tg.BackButton.offClick();
            // Устанавливаем новый обработчик
            this.tg.BackButton.onClick(callback);
            // Показываем кнопку
            this.tg.BackButton.show();
        }
    }

    /**
     * Скрыть кнопку "Назад"
     */
    hideBackButton() {
        if (this.tg?.BackButton) {
            this.tg.BackButton.hide();
            // Очищаем обработчики при скрытии
            this.tg.BackButton.offClick();
        }
    }

    // === ИНФОРМАЦИОННЫЕ МЕТОДЫ ===

    /**
     * Проверить, запущено ли приложение в Telegram WebApp
     * @returns {boolean}
     */
    isWebApp() {
        return !!(this.tg?.initDataUnsafe?.user);
    }

    /**
     * Получить информацию о пользователе
     */
    getUserInfo() {
        if (this.tg?.initDataUnsafe?.user) {
            return this.tg.initDataUnsafe.user;
        }
        return null;
    }

    /**
     * Получить тему приложения
     */
    getTheme() {
        return this.tg?.colorScheme || 'dark'; // По умолчанию темная тема для CRM
    }

    /**
     * Проверить, поддерживается ли функция
     * @param {string} version - Минимальная версия
     */
    isSupported(version = '6.0') {
        return this.tg?.isVersionAtLeast && this.tg.isVersionAtLeast(version);
    }

    // === УТИЛИТЫ ДЛЯ ДАННЫХ ===

    /**
     * Отправить данные в бот
     * @param {object} data - Данные для отправки
     */
    sendData(data) {
        if (this.tg?.sendData) {
            this.tg.sendData(JSON.stringify(data));
        }
    }

    /**
     * Получить параметры запуска
     */
    getStartParam() {
        return this.tg?.initDataUnsafe?.start_param || null;
    }

    /**
     * Получить initData для авторизации
     */
    getInitData() {
        return this.tg?.initData || '';
    }
}

// Создаем единственный экземпляр
const webAppManager = new WebAppManager();

// Экспортируем для использования в приложении
export default webAppManager;

// Также экспортируем отдельные утилиты для удобства
export const {
    hapticImpact,
    hapticMedium,
    hapticHeavy,
    hapticSuccess,
    hapticError,
    hapticWarning,
    hapticSelection,
    showAlert,
    showConfirm,
    showMainButton,
    hideMainButton,
    showBackButton,
    hideBackButton,
    isWebApp,
    getUserInfo,
    getTheme,
    sendData,
    close
} = webAppManager;
