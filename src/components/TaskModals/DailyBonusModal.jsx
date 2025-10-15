import { useState } from 'react';
import Modal from '../Modal';
import { apiService } from '../../services/apiService';
import webAppManager from '../../services/webAppManager';
import createConfetti from '../../services/createConfetti';

/**
 * Модальное окно для ежедневного бонуса
 */
const DailyBonusModal = ({ isOpen, onClose, onSuccess }) => {
    const [loading, setLoading] = useState(false);

    const handleClaim = async () => {
        setLoading(true);
        webAppManager.hapticMedium();

        try {
            const result = await apiService.claimDailyBonus();

            if (result) {
                if (result.status === true) {
                    webAppManager.hapticSuccess();
                    onSuccess?.('🎉', 'Поздравляем!', result.message || 'Ежедневный бонус получен!');
                    createConfetti();
                } else if (result.status === false) {
                    webAppManager.hapticWarning();
                    onSuccess?.('⏰', 'Уже получен', result.message || 'Бонус уже получен сегодня. Приходите завтра!');
                } else {
                    webAppManager.hapticError();
                    onSuccess?.('❌', 'Ошибка', result.message || 'Произошла ошибка при получении бонуса');
                }
            }
            onClose();
        } catch (error) {
            webAppManager.hapticError();
            onSuccess?.('❌', 'Ошибка', 'Произошла ошибка при получении бонуса');
            onClose();
        } finally {
            setLoading(false);
        }
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} size="sm">
            <div className="text-center">
                <div className="text-6xl mb-4">🎁</div>
                <h3 className="text-xl font-bold font-unbounded mb-2">Ежедневный бонус</h3>
                <p className="text-gray-600 mb-6">Получите свой ежедневный бонус!</p>
                <button 
                    onClick={handleClaim}
                    disabled={loading}
                    className="bg-black text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300 disabled:opacity-50"
                >
                    {loading ? 'Получаем...' : 'Получить бонус'}
                </button>
            </div>
        </Modal>
    );
};

export default DailyBonusModal;
