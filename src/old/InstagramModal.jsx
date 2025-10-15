import { useState } from 'react';
import Modal from '../Modal';
import ImageUpload from '../ImageUpload';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Модальное окно для подписки на Instagram
 */
const InstagramModal = ({ isOpen, onClose, onSuccess }) => {
    const [loading, setLoading] = useState(false);
    const [screenshotImage, setScreenshotImage] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!screenshotImage) {
            webAppManager.hapticError();
            onSuccess?.('⚠️', 'Ошибка', 'Загрузите скриншот подписки');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('screenshot_image', screenshotImage);
            formData.append('task_type', 'instagram_subscription');

            const result = await apiService.submitTaskRequest(formData);

            if (result && result.success) {
                webAppManager.hapticSuccess();
                onSuccess?.('✅', 'Заявка отправлена', 'Ваша заявка принята и будет рассмотрена в ближайшее время');
            } else {
                webAppManager.hapticWarning();
                onSuccess?.('⏳', 'Заявка в обработке', result?.message || 'У вас уже есть заявка в обработке');
            }

            onClose();
            setScreenshotImage(null);
        } catch (error) {
            webAppManager.hapticError();
            onSuccess?.('❌', 'Ошибка', 'Не удалось отправить заявку');
        } finally {
            setLoading(false);
        }
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="lg">
            <div className="space-y-6">
                <div className="text-center mb-6">
                    <div className="text-4xl mb-2">📷</div>
                    <h3 className="text-xl font-bold font-unbounded">Подписка на Instagram</h3>
                    <p className="text-gray-600 mt-2">Загрузите скриншот подписки</p>
                </div>

                <form onSubmit={handleSubmit} className="space-y-4">
                    <ImageUpload 
                        label="Скриншот подписки"
                        onChange={setScreenshotImage}
                        required
                    />

                    <button 
                        type="submit" 
                        disabled={loading}
                        className="bg-black text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300 disabled:opacity-50"
                    >
                        {loading ? 'Отправляем...' : 'Отправить заявку'}
                    </button>
                </form>
            </div>
        </Modal>
    );
};

export default InstagramModal;
