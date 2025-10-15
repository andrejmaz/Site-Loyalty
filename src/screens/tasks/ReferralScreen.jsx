import { useNavigate } from 'react-router-dom';
import { generateReferralLink, copyToClipboard } from '../../utils/helpers';
import webAppManager from '../../services/webAppManager';
import { useModal } from '../../hooks/useModal';
import NotificationModal from '../../components/NotificationModal';
import { useState, useEffect } from 'react';
import { apiService } from '../../services/apiService';

/**
 * Экран реферальной программы
 */
const ReferralScreen = ({ user }) => {
    const navigate = useNavigate();
    const notificationModal = useModal();
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });
    const [referralStats, setReferralStats] = useState(null);
    const [isLoading, setIsLoading] = useState(true);
    
    const referralLink = generateReferralLink(user?.user?.tg_id);

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    // Загрузка статистики рефералов
    useEffect(() => {
        const loadReferralStats = async () => {
            try {
                setIsLoading(true);
                const response = await apiService.getReferralStats();
                if (response.status) {
                    setReferralStats(response);
                }
            } catch (error) {
                console.error('Ошибка загрузки статистики рефералов:', error);
                setReferralStats({
                    status: false,
                    data: {
                        invited_count: '-',
                        total_earned: '-'
                    }
                });
            } finally {
                setIsLoading(false);
            }
        };

        loadReferralStats();
    }, []);

    const handleBackToTasks = () => {
        webAppManager.hapticImpact();
        navigate('/tasks');
    };

    const handleCopyLink = async () => {
        webAppManager.hapticImpact();
        const success = await copyToClipboard(referralLink);
        
        if (success) {
            webAppManager.hapticSuccess();
            showNotification('📋', 'Скопировано!', 'Реферальная ссылка скопирована в буфер обмена');
        } else {
            webAppManager.hapticError();
            showNotification('❌', 'Ошибка', 'Не удалось скопировать ссылку');
        }
    };

    const handleShareTelegram = () => {
        webAppManager.hapticImpact();
        const message = `🎁 Привет! Присоединяйся к системе лояльности и получай бонусы за покупки!\n\n${referralLink}`;
        if (webAppManager.isWebApp()) {
            window.Telegram.WebApp.openTelegramLink(`https://t.me/share/url?url=${encodeURIComponent(message)}`);
        } else {
            window.open(`https://t.me/share/url?url=${encodeURIComponent(message)}`, "_blank");
        }
    };

    return (
        <>
            <div className="max-w-lg mx-auto px-4">
                <div className="mb-4 mt-4">
                    <h1 className="text-3xl font-semibold font-unbounded">Приглашай<br/>друзей<br/>и зарабатывай</h1>
                </div>

                <div className="flex gap-4 mt-8 mb-12">
                    <button 
                        onClick={handleShareTelegram}
                        className="bg-black text-white px-8 py-4 rounded-lg flex-grow hover:bg-gray-800 transition-colors"
                    >
                        Пригласить друга
                    </button>
                    <button 
                        onClick={handleCopyLink}
                        className="bg-black p-4 rounded-lg hover:bg-gray-800 transition-colors"
                    >
                        <svg className="w-6 h-6" viewBox="0 0 48 57" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M45.1433 13.0929L36.0537 3.03409C35.6746 2.61446 35.1354 2.375 34.5698 2.375H13.1665C12.0619 2.375 11.1665 3.27043 11.1665 4.375V44.375C11.1665 45.4796 12.0619 46.375 13.1665 46.375H43.9998C45.1044 46.375 45.9998 45.4796 45.9998 44.375V22.5C45.9998 21.3954 45.1044 20.5 43.9998 20.5L34.2498 20.5C33.1453 20.5 32.2498 19.6046 32.2498 18.5V9.5" stroke="white" strokeWidth="4" strokeLinecap="round"/>
                            <path d="M5.5 11.5415C4.84823 11.5415 4.37607 11.5415 3.99984 11.5415C2.89528 11.5415 2 12.4369 2 13.5415V52.6248C2 53.7294 2.89543 54.6248 4 54.6248H33.1667" stroke="white" strokeWidth="4" strokeLinecap="round"/>
                        </svg>

                    </button>
                </div>

                <h2 className="font-medium text-2xl mb-4 font-unbounded">Статистика:</h2>
                <div className="flex justify-between py-4 bg-white rounded-lg px-4 text-lg mb-2 font-medium">
                    <span>Приглашенных друзей</span>
                    <span className="text-green-600">{referralStats?.data?.invited_count || 0}</span>
                </div>
                <div className="flex justify-between py-4 bg-white rounded-lg px-4 text-lg font-medium">
                    <span>Заработано</span>
                    <span className="text-green-600">{referralStats?.data?.total_earned || 0} ₽</span>
                </div>
            </div>

            <NotificationModal
                isOpen={notificationModal.isOpen}
                onClose={notificationModal.close}
                icon={notification.icon}
                title={notification.title}
                message={notification.message}
            />
        </>
    );
};

export default ReferralScreen;
