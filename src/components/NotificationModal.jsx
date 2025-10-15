import Modal from './Modal';

/**
 * Универсальное модальное окно для уведомлений
 */
const NotificationModal = ({ isOpen, onClose, icon = '✅', title = 'Успешно!', message = 'Операция выполнена успешно' }) => {
    return (
        <Modal isOpen={isOpen} onClose={onClose} size="sm">
            <div className="text-center">
                <div className="text-6xl mb-4">{icon}</div>
                <h3 className="text-xl font-bold font-unbounded mb-2">{title}</h3>
                <p className="text-gray-600 mb-6">{message}</p>
                <button 
                    onClick={onClose}
                    className="bg-black text-white px-8 py-3 rounded-lg font-bold w-full hover:bg-gray-800 transition-all duration-300"
                >
                    Закрыть
                </button>
            </div>
        </Modal>
    );
};

export default NotificationModal;
