import { useEffect } from 'react';

/**
 * Базовый компонент модального окна
 */
const Modal = ({ isOpen, onClose, children, size = 'md' }) => {
    // Закрытие по Escape
    useEffect(() => {
        const handleEscape = (e) => {
            if (e.key === 'Escape' && isOpen) {
                onClose();
            }
        };

        document.addEventListener('keydown', handleEscape);
        return () => document.removeEventListener('keydown', handleEscape);
    }, [isOpen, onClose]);

    if (!isOpen) return null;

    const sizeClasses = {
        sm: 'max-w-md',
        md: 'max-w-lg',
        lg: 'max-w-2xl',
        xl: 'max-w-4xl'
    };

    return (
        <div 
            className="fixed inset-0 backdrop-blur-sm flex items-center justify-center z-50 p-4 transition-opacity duration-300"
            onClick={(e) => {
                if (e.target === e.currentTarget) {
                    onClose();
                }
            }}
        >
            <div className={`bg-white rounded-xl p-6 w-full ${sizeClasses[size]} relative transform transition-transform duration-300 scale-100 max-h-[90vh] flex flex-col shadow-2xl`}>
                <button 
                    onClick={onClose}
                    className="absolute right-4 top-4 text-2xl hover:text-gray-500 w-8 h-8 flex items-center justify-center bg-gray-100 rounded-lg hover:bg-gray-200 transition-all"
                >
                    ×
                </button>
                {children}
            </div>
        </div>
    );
};

export default Modal;
