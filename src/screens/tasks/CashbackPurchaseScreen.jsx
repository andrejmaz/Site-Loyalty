import { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import ImageUpload from '../../components/ImageUpload';
import NotificationModal from '../../components/NotificationModal';
import { useModal } from '../../hooks/useModal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Экран для отправки заявки на кешбек за покупку
 */
const CashbackPurchaseScreen = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const notificationModal = useModal();
    
    // Получаем task_id из navigation state
    const taskId = location.state?.id;

    const [loading, setLoading] = useState(false);
    const [marketplace, setMarketplace] = useState('');
    const [receiptImage, setReceiptImage] = useState(null);
    const [tagImage, setTagImage] = useState(null);
    const [purchaseAmount, setPurchaseAmount] = useState('');
    
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

        if (!receiptImage) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Загрузите фото чека');
            return;
        }

        if (!tagImage) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Загрузите фото разрезанной бирки');
            return;
        }

        if (!purchaseAmount) {
            webAppManager.hapticError();
            showNotification('⚠️', 'Ошибка', 'Введите сумму покупки');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('task_id', taskId);
            formData.append('fields', JSON.stringify({ marketplace: marketplace, purchase_amount: purchaseAmount }));
            formData.append('receipt_image', receiptImage);
            formData.append('tag_image', tagImage);

            const result = await apiService.submitTaskRequest(formData);

            if (result && result.success) {
                webAppManager.hapticSuccess();
                showNotification('⏳', 'Заявка в обработке', 'Ваша заявка принята и будет рассмотрена в ближайшее время');
                
                // Возврат на список заданий после закрытия уведомления
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
            setReceiptImage(null);
            setTagImage(null);
            setPurchaseAmount('');
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
                    <div className="text-6xl mb-4 mt-4">💳</div>
                    <h2 className="text-3xl font-semibold font-unbounded uppercase mb-2">Кешбек за покупку</h2>
                    <p className="text-gray-600 text-sm">
                        Загрузите чек и фото разрезанной бирки, чтобы получить кешбек за покупку
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
                            className="w-full p-3 border border-gray-300 rounded-lg focus:ring-1 focus:ring-black focus:border-transparent"
                        >
                            <option value="">Выберите маркетплейс</option>
                            <option value="wildberries">Wildberries</option>
                            <option value="ozon">Ozon</option>
                            <option value="yandex_market">Яндекс.Маркет</option>
                            <option value="other">Другой</option>
                        </select>
                    </div>

                    <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">
                            Сумма покупки <span className="text-red-500">*</span>
                        </label>
                        <div className="flex items-center">
                            <input
                                type="number"
                                placeholder="Введите сумму покупки"
                                inputMode="numeric"
                                value={purchaseAmount}
                                onChange={(e) => setPurchaseAmount(e.target.value)}
                                className="w-full p-3 border border-gray-300 rounded-lg rounded-r-none"
                            />
                            <span className="text-gray-800 bg-gray-100 rounded-lg rounded-l-none p-3 border-r border-t border-b border-gray-300">₽</span>
                        </div>
                    </div>

                    <ImageUpload 
                        label="Фото чека"
                        onChange={setReceiptImage}
                        required
                    />

                    <ImageUpload 
                        label="Фото разрезанной бирки"
                        onChange={setTagImage}
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

export default CashbackPurchaseScreen;

