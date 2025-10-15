import { useState, useEffect } from 'react';
import Modal from '../Modal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';
import createConfetti from '../../services/createConfetti';

/**
 * Модальное окно для подписки на Telegram
 */
const TelegramModal = ({ isOpen, onClose, onSuccess }) => {
    const [loading, setLoading] = useState(false);
    const [isSubscribed, setIsSubscribed] = useState(false);
    const [message, setMessage] = useState('Проверяем вашу подписку...');

    // Проверка подписки при открытии модалки
    useEffect(() => {
        if (isOpen) {
            checkSubscription();
        }
    }, [isOpen]);

    const checkSubscription = async () => {
        setLoading(true);
        setMessage('Проверяем вашу подписку...');

        try {
            const result = await apiService.checkTelegramSubscription();

            if (result && result.subscription) {
                setIsSubscribed(true);
                setMessage('Отлично! Вы подписаны на наш канал.');
                webAppManager.hapticSuccess();
            } else {
                setIsSubscribed(false);
                setMessage('Пожалуйста, подпишитесь на наш Telegram-канал для получения бонуса.');
                webAppManager.hapticWarning();
            }
        } catch (error) {
            setMessage('Произошла ошибка при проверке подписки.');
            webAppManager.hapticError();
        } finally {
            setLoading(false);
        }
    };

    const handleClaimBonus = async () => {
        setLoading(true);
        try {
            const result = await apiService.claimTelegramSubscription();

            if (result && result.status === true) {
                webAppManager.hapticSuccess();
                onSuccess?.('🎉', 'Поздравляем!', 'Бонус за подписку на Telegram-канал начислен!');
                createConfetti();
                onClose();
            } else {
                webAppManager.hapticWarning();
                onSuccess?.('⏰', 'Уже получен', 'Бонус за подписку на Telegram-канал уже получен!');
            }
        } catch (error) {
            webAppManager.hapticError();
            onSuccess?.('❌', 'Ошибка', 'Произошла ошибка при получении бонуса за подписку на Telegram-канал');
            onClose();
        }
    };

    const handleSubscribe = () => {
        if (webAppManager.isWebApp()) {
            window.Telegram.WebApp.openTelegramLink('https://t.me/bronks_wear');
        } else {
            window.open('https://t.me/bronks_wear', '_blank');
        }
        webAppManager.hapticImpact();
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="sm">
            <div className="text-center space-y-4">
                <div className="text-6xl mb-4">📱</div>
                <h3 className="text-xl font-bold font-unbounded">Подписка на Telegram</h3>
                <p className="text-gray-600">{message}</p>
                <div className="space-y-3">
                    {loading ? (
                        <div className="flex items-center justify-center">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
                        </div>
                    ) : isSubscribed ? (
                        <button 
                            onClick={handleClaimBonus}
                            className="bg-black text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300"
                        >
                            Получить бонус
                        </button>
                    ) : (
                        <>
                            <button 
                                onClick={handleSubscribe}
                                className="bg-blue-500 text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-blue-600 transition-all duration-300 mb-3"
                            >
                                Подписаться на канал
                            </button>
                            <button 
                                onClick={checkSubscription}
                                className="bg-gray-200 text-gray-700 px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-300 transition-all duration-300"
                            >
                                Проверить подписку
                            </button>
                        </>
                    )}
                </div>
            </div>
        </Modal>
    );
};

export default TelegramModal;
