import { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import ImageUpload from '../../components/ImageUpload';
import NotificationModal from '../../components/NotificationModal';
import { useModal } from '../../hooks/useModal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Экран для отправки заявки на бонус за отзыв
 */
const ReviewScreen = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const notificationModal = useModal();

    // Получаем task_id из navigation state
    const taskId = location.state?.id;

    const [loading, setLoading] = useState(false);
    const [marketplace, setMarketplace] = useState('');
    const [reviewImage, setReviewImage] = useState(null);
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!marketplace) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Выберите маркетплейс');
            return;
        }

        if (!reviewImage) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Загрузите фото отзыва');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('task_id', taskId);
            formData.append('review_image', reviewImage);
            formData.append('fields', JSON.stringify({ marketplace: marketplace }));

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
            setMarketplace('');
            setReviewImage(null);
        } catch (error) {
            webAppManager.hapticError();
            showNotification('❌', 'Ошибка', 'Не удалось отправить заявку');
        } finally {
            setLoading(false);
        }
    };

    return (
        <>
            <div className="h-full overflow-y-scroll px-4 pb-8">

                {/* Заголовок и описание */}
                <div className="text-center mb-6">
                    <div className="text-6xl mb-4 mt-4">⭐</div>
                    <h2 className="text-3xl font-semibold font-unbounded uppercase mb-2">Бонус за отзыв</h2>
                    <p className="text-gray-600 text-sm">
                        Оставьте отзыв на маркетплейсе и получите бонусы
                    </p>
                </div>

                {/* Форма */}
                <form onSubmit={handleSubmit} className="space-y-6 bg-white rounded-xl p-6">
                    <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">
                            Выберите маркетплейс <span className="text-red-500">*</span>
                        </label>
                        <select
                            value={marketplace}
                            onChange={(e) => setMarketplace(e.target.value)}
                            className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-transparent"
                        >
                            <option value="">Выберите маркетплейс</option>
                            <option value="wildberries">Wildberries</option>
                            <option value="ozon">OZON</option>
                            <option value="yandex_market">Яндекс Маркет</option>
                        </select>
                    </div>

                    <ImageUpload
                        label="Фото отзыва на маркетплейсе"
                        onChange={setReviewImage}
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

export default ReviewScreen;

