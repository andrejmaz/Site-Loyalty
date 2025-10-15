/**
 * Утилиты и вспомогательные функции
 */

/**
 * Форматирование даты в формат DD.MM.YYYY
 */
export const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('ru-RU', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
    });
};

/**
 * Форматирование числа с пробелами (1000 -> 1 000)
 */
export const formatNumber = (num) => {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ');
};

/**
 * Копирование текста в буфер обмена
 */
export const copyToClipboard = async (text) => {
    if (navigator.clipboard && window.isSecureContext) {
        try {
            await navigator.clipboard.writeText(text);
            return true;
        } catch (err) {
            console.error('Failed to copy:', err);
            return copyTextFallback(text);
        }
    } else {
        return copyTextFallback(text);
    }
};

/**
 * Fallback для копирования текста (для старых браузеров)
 */
const copyTextFallback = (text) => {
    const textArea = document.createElement('textarea');
    textArea.value = text;
    textArea.style.position = 'fixed';
    textArea.style.left = '-999999px';
    textArea.style.top = '-999999px';
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();

    try {
        document.execCommand('copy');
        textArea.remove();
        return true;
    } catch (err) {
        console.error('Fallback copy failed:', err);
        textArea.remove();
        return false;
    }
};

/**
 * Генерация реферальной ссылки
 */
export const generateReferralLink = (tg_id) => {
    if (tg_id) {
        return `https://t.me/bmultiBot?start=ref_${tg_id}`;
    }
    return 'https://t.me/bmultiBot?start=l_referral';
};

/**
 * Определение типа задания
 */
export const normalizeTaskType = (task) => {
    const system_name = task.system_name;
    
    if (system_name && system_name !== 'unknown') {
        return system_name;
    }
    return 'other';
};

/**
 * Сброс скролла на начало страницы
 */
export const resetScroll = () => {
    requestAnimationFrame(() => {
        window.scrollTo({ top: 0, behavior: 'instant' });
        window.scrollTo(0, 0);
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
        
        setTimeout(() => {
            window.scrollTo(0, 0);
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }, 50);
    });
};

/**
 * Определение текущей страницы по pathname
 */
export const getCurrentPage = (pathname) => {
    if (pathname.includes('/balance')) return 'balance';
    if (pathname.includes('/tasks')) return 'tasks';
    if (pathname.includes('/catalog')) return 'catalog';
    return 'balance';
};
