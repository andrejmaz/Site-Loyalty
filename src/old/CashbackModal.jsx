import { useState } from 'react';
import Modal from '../Modal';
import ImageUpload from '../ImageUpload';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';

/**
 * Модальное окно для заявки на кешбек
 */
const CashbackModal = ({ isOpen, onClose, onSuccess }) => {
    const [loading, setLoading] = useState(false);
    const [marketplace, setMarketplace] = useState('');
    const [receiptImage, setReceiptImage] = useState(null);
    const [tagImage, setTagImage] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!marketplace) {
            webAppManager.hapticError();
            onSuccess?.('⚠️', 'Ошибка', 'Выберите маркетплейс');
            return;
        }

        if (!receiptImage) {
            webAppManager.hapticError();
            onSuccess?.('⚠️', 'Ошибка', 'Загрузите фото чека');
            return;
        }

        if (!tagImage) {
            webAppManager.hapticError();
            onSuccess?.('⚠️', 'Ошибка', 'Загрузите фото разрезанной бирки');
            return;
        }

        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const formData = new FormData();
            formData.append('marketplace', marketplace);
            formData.append('receipt_image', receiptImage);
            formData.append('tag_image', tagImage);
            formData.append('task_type', 'cashback');

            const result = await apiService.submitTaskRequest(formData);

            if (result && result.success) {
                webAppManager.hapticSuccess();
                onSuccess?.('✅', 'Заявка отправлена', 'Ваша заявка принята и будет рассмотрена в ближайшее время');
            } else {
                webAppManager.hapticWarning();
                onSuccess?.('⏳', 'Заявка в обработке', result?.message || 'У вас уже есть заявка в обработке');
            }

            onClose();
            // Сброс формы
            setMarketplace('');
            setReceiptImage(null);
            setTagImage(null);
        } catch (error) {
            webAppManager.hapticError();
            onSuccess?.('❌', 'Ошибка', 'Не удалось отправить заявку');
        } finally {
            setLoading(false);
        }
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="lg">
            <div className="flex-1 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent">
                <div className="space-y-6">
                    <div className="text-center mb-6">
                        <div className="text-4xl mb-2">💳</div>
                        <h3 className="text-xl font-bold font-unbounded">Кешбек за покупку</h3>
                        <p className="text-gray-600 mt-2">Загрузите чек и получите кешбек</p>
                    </div>

                    <form onSubmit={handleSubmit} className="space-y-4">
                        <div>
                            <label className="block text-sm font-medium text-gray-700 mb-2">Выберите маркетплейс: *</label>
                            <select 
                                value={marketplace}
                                onChange={(e) => setMarketplace(e.target.value)}
                                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-black focus:border-transparent"
                            >
                                <option value="">Выберите маркетплейс</option>
                                <option value="wildberries">Wildberries</option>
                                <option value="ozon">Ozon</option>
                                <option value="yandex_market">Яндекс.Маркет</option>
                                <option value="other">Другой</option>
                            </select>
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
                            className="bg-black text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300 disabled:opacity-50"
                        >
                            {loading ? 'Отправляем...' : 'Отправить заявку'}
                        </button>
                    </form>
                </div>
            </div>
        </Modal>
    );
};

export default CashbackModal;
