import { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import ImageUpload from '../../components/ImageUpload';
import NotificationModal from '../../components/NotificationModal';
import { useModal } from '../../hooks/useModal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Экран для отправки заявки на подписку в Instagram
 */
const InstagramSubscribeScreen = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const notificationModal = useModal();
    
    // Получаем task_id из navigation state
    const taskId = location.state?.id;

    const [loading, setLoading] = useState(false);
    const [screenshotImage, setScreenshotImage] = useState(null);
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!screenshotImage) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Загрузите скриншот подписки');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('task_id', taskId);
            formData.append('screenshot_image', screenshotImage);

            const result = await apiService.submitTaskRequest(formData);

            if (result && result.success) {
                webAppManager.hapticSuccess();
                showNotification('⏳', 'Заявка в обработке', 'Ваша заявка принята и будет рассмотрена в ближайшее время');
                
                setTimeout(() => {
                    navigate('/tasks');
                }, 2000);
            } else {
                webAppManager.hapticWarning();
                showNotification('⏳', 'Заявка в обработке', result?.message || 'У вас уже есть заявка в обработке');
                
                setTimeout(() => {
                    navigate('/tasks');
                }, 2000);
            }

            setScreenshotImage(null);
        } catch (error) {
            webAppManager.hapticError();
            showNotification('❌', 'Ошибка', 'Не удалось отправить заявку');
        } finally {
            setLoading(false);
        }
    };

    const handleBack = () => {
        webAppManager.hapticLight();
        navigate('/tasks');
    };

    return (
        <>
            <div className="h-full overflow-y-scroll px-4 pb-8">

                {/* Заголовок и описание */}
                <div className="text-center mb-6">
                    <div className="text-6xl mb-4 mt-4">📷</div>
                    <h2 className="text-3xl font-semibold font-unbounded uppercase mb-2">Подписка на Instagram</h2>
                    <p className="text-gray-600 text-sm">
                        Подпишитесь на наш Instagram и загрузите скриншот подписки
                    </p>
                </div>

                {/* Кнопка перехода в Instagram */}
                <div className="mb-4">
                    <a
                        href="https://www.instagram.com/brnks_store"
                        target="_blank"
                        rel="noopener noreferrer"
                        onClick={() => webAppManager.hapticLight()}
                        className="block bg-gradient-to-r from-purple-600 via-pink-600 to-orange-500 text-white px-4 py-3 rounded-xl font-bold w-full text-center hover:shadow-lg transition-all duration-300 hover:scale-[1.02] active:scale-[0.98]"
                    >
                        <span className="flex items-center justify-center gap-3">
                            <svg fill="#ffffff" width="24px" height="24px" viewBox="0 0 32 32"><path d="M20.445 5h-8.891A6.559 6.559 0 0 0 5 11.554v8.891A6.559 6.559 0 0 0 11.554 27h8.891a6.56 6.56 0 0 0 6.554-6.555v-8.891A6.557 6.557 0 0 0 20.445 5zm4.342 15.445a4.343 4.343 0 0 1-4.342 4.342h-8.891a4.341 4.341 0 0 1-4.341-4.342v-8.891a4.34 4.34 0 0 1 4.341-4.341h8.891a4.342 4.342 0 0 1 4.341 4.341l.001 8.891z"/><path d="M16 10.312c-3.138 0-5.688 2.551-5.688 5.688s2.551 5.688 5.688 5.688 5.688-2.551 5.688-5.688-2.55-5.688-5.688-5.688zm0 9.163a3.475 3.475 0 1 1-.001-6.95 3.475 3.475 0 0 1 .001 6.95zM21.7 8.991a1.363 1.363 0 1 1-1.364 1.364c0-.752.51-1.364 1.364-1.364z"/></svg>
                            <span>Перейти в Instagram</span>
                            <span className="text-xl">→</span>
                        </span>
                    </a>
                </div>

                {/* Форма */}
                <form onSubmit={handleSubmit} className="space-y-6 bg-white rounded-xl p-6">
                    <ImageUpload 
                        label="Скриншот подписки"
                        onChange={setScreenshotImage}
                        required
                    />

                    <button 
                        type="submit" 
                        disabled={loading}
                        className="bg-black text-white px-8 py-4 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        {loading ? 'Отправляем...' : 'Отправить заявку'}
                    </button>
                </form>
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

export default InstagramSubscribeScreen;

