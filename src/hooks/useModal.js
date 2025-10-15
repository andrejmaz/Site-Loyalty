import { useState } from 'react';

/**
 * Хук для управления состоянием модальных окон
 */
export const useModal = () => {
    const [isOpen, setIsOpen] = useState(false);
    const [modalData, setModalData] = useState(null);

    const open = (data = null) => {
        setModalData(data);
        setIsOpen(true);
        // Блокируем скролл body
        document.body.style.overflow = 'hidden';
    };

    const close = () => {
        setIsOpen(false);
        setModalData(null);
        // Разблокируем скролл body
        document.body.style.overflow = '';
    };

    const toggle = () => {
        if (isOpen) {
            close();
        } else {
            open();
        }
    };

    return {
        isOpen,
        modalData,
        open,
        close,
        toggle
    };
};
