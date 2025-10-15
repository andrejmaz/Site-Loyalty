import { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import ImageUpload from '../../components/ImageUpload';
import NotificationModal from '../../components/NotificationModal';
import { useModal } from '../../hooks/useModal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Экран для отправки заявки на Stories в Instagram
 */
const InstagramStoriesScreen = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const notificationModal = useModal();
    
    // Получаем task_id из navigation state
    const taskId = location.state?.id;

    const [loading, setLoading] = useState(false);
    const [instagramLink, setInstagramLink] = useState('');
    const [screenshotImage, setScreenshotImage] = useState(null);
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!instagramLink) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Введите ссылку на Instagram аккаунт');
            return;
        }

        if (!screenshotImage) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Загрузите скриншот сторис');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('task_id', taskId);
            formData.append('fields', JSON.stringify({ instagram_link: instagramLink }));
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

            // Сброс формы
            setInstagramLink('');
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
                    <div className="text-6xl mb-4 mt-4">📸</div>
                    <h2 className="text-3xl font-semibold font-unbounded uppercase mb-2">Stories в Instagram</h2>
                    <p className="text-gray-600 text-sm">
                        Загрузите скриншот сторис с нашим продуктом (сторис должны висеть более 24 часов)
                    </p>
                </div>

                {/* Форма */}
                <form onSubmit={handleSubmit} className="space-y-6 bg-white rounded-xl p-6">
                    <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">
                            Ссылка на Instagram аккаунт <span className="text-red-500">*</span>
                        </label>
                        <input
                            type="url"
                            value={instagramLink}
                            onChange={(e) => setInstagramLink(e.target.value)}
                            placeholder="https://instagram.com/your_account"
                            className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-transparent"
                        />
                    </div>

                    <ImageUpload 
                        label="Скриншот сторис"
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

export default InstagramStoriesScreen;

