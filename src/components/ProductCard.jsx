import { useState, memo, useRef, useEffect } from 'react';
import webAppManager from '../services/webAppManager';

/**
 * Карточка товара с каруселью изображений
 * Современный дизайн для витрины обмена баллов на товары
 * Мемоизирована для оптимизации производительности
 */
const ProductCard = memo(({ item, onBuy }) => {
    const [currentImageIndex, setCurrentImageIndex] = useState(0);
    const sliderRef = useRef(null);

    // Собираем все фотографии
    const photos = [item.main_photo, item.photo_2, item.photo_3, item.photo_4]
        .filter(photo => photo && photo.trim() !== '');

    // Вычисляем скидку
    const oldPrice = parseInt(item.old_price.replace(/\s/g, ''));
    const newPrice = parseInt(item.price.replace(/\s/g, ''));
    const discountPercent = oldPrice > newPrice ? Math.round(((oldPrice - newPrice) / oldPrice) * 100) : 0;

    // Размеры для отображения
    const sizes = item.sizes.split(', ').map(size => size.trim());

    // Проверяем, является ли товар хитом (рейтинг >= 4.5)
    const isHit = item.rating >= 4.5;

    // Минимальная дистанция свайпа для переключения (в пикселях)
    const minSwipeDistance = 50;

    const handlePrevImage = (e) => {
        e?.stopPropagation();
        webAppManager.hapticSelection();
        setCurrentImageIndex((prev) => (prev === 0 ? photos.length - 1 : prev - 1));
    };

    const handleNextImage = (e) => {
        e?.stopPropagation();
        webAppManager.hapticSelection();
        setCurrentImageIndex((prev) => (prev === photos.length - 1 ? 0 : prev + 1));
    };

    const handleDotClick = (index, e) => {
        e.stopPropagation();
        webAppManager.hapticSelection();
        setCurrentImageIndex(index);
    };

    const handleBuyClick = () => {
        webAppManager.hapticImpact('medium');
        onBuy(item);
    };

    // Обработчики свайпа с блокировкой скролла родителя
    useEffect(() => {
        const slider = sliderRef.current;
        if (!slider) return;

        let startX = 0;
        let startY = 0;
        let isHorizontal = null;

        const handleTouchStartCapture = (e) => {
            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
            isHorizontal = null;
        };

        const handleTouchMoveCapture = (e) => {
            const currentX = e.touches[0].clientX;
            const currentY = e.touches[0].clientY;
            
            const deltaX = Math.abs(currentX - startX);
            const deltaY = Math.abs(currentY - startY);

            // Определяем направление свайпа один раз
            if (isHorizontal === null && (deltaX > 3 || deltaY > 3)) {
                isHorizontal = deltaX > deltaY;
            }

            // Если горизонтальный свайп - блокируем скролл
            if (isHorizontal) {
                e.preventDefault();
            }
        };

        const handleTouchEndCapture = (e) => {
            const touchEndXCoord = e.changedTouches[0].clientX;
            const touchEndYCoord = e.changedTouches[0].clientY;
            
            const deltaX = startX - touchEndXCoord;
            const deltaY = Math.abs(startY - touchEndYCoord);
            
            // Проверяем, что это в основном горизонтальный свайп
            if (Math.abs(deltaX) < deltaY * 2) {
                return;
            }

            // Проверяем минимальную дистанцию
            if (Math.abs(deltaX) > minSwipeDistance) {
                if (deltaX > 0) {
                    handleNextImage();
                } else {
                    handlePrevImage();
                }
            }

            isHorizontal = null;
        };

        // Добавляем обработчики с passive: false для работы preventDefault
        slider.addEventListener('touchstart', handleTouchStartCapture, { passive: true });
        slider.addEventListener('touchmove', handleTouchMoveCapture, { passive: false });
        slider.addEventListener('touchend', handleTouchEndCapture, { passive: true });

        return () => {
            slider.removeEventListener('touchstart', handleTouchStartCapture);
            slider.removeEventListener('touchmove', handleTouchMoveCapture);
            slider.removeEventListener('touchend', handleTouchEndCapture);
        };
    }, [minSwipeDistance]); // eslint-disable-line react-hooks/exhaustive-deps

    return (
        <div className="product-card group bg-white rounded-3xl overflow-hidden shadow-md hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-1">
            {/* Верхняя часть с изображением */}
            <div className="relative">
                {/* Бейджи */}
                <div className="absolute top-4 left-4 flex flex-col gap-2 z-30">
                    {isHit && (
                        <div className="bg-gradient-to-br from-green-500 to-emerald-600 text-white px-3 py-2 rounded-xl text-sm font-extrabold shadow-lg backdrop-blur-sm flex items-center gap-1.5 transform hover:scale-105 transition-transform duration-200">
                            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                            </svg>
                            Хит
                        </div>
                    )}
                </div>

                {/* Рейтинг */}
                <div className="absolute top-4 right-4 z-30">
                    <div className="bg-black/50 bg-opacity-90 backdrop-blur-md text-white rounded-xl px-3 py-2 flex items-center gap-2 text-sm shadow-xl">
                        <svg className="w-4 h-4 fill-current text-yellow-400" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                        </svg>
                        <span className="font-bold">{item.rating}</span>
                    </div>
                </div>

                {/* Слайдер с изображениями */}
                <div 
                    ref={sliderRef}
                    className="aspect-square bg-gradient-to-br from-gray-50 to-gray-100 overflow-hidden relative select-none"
                >
                    {photos.map((photo, index) => (
                        <img
                            key={index}
                            src={photo}
                            alt={item.title}
                            loading="lazy"
                            decoding="async"
                            draggable="false"
                            className={`slider-image w-full h-full object-cover absolute inset-0 transition-all duration-700 ease-out ${
                                index === currentImageIndex 
                                    ? 'opacity-100 scale-100' 
                                    : 'opacity-0 scale-110'
                            }`}
                        />
                    ))}

                    {/* Градиентный оверлей для лучшей читаемости счётчика */}
                    {photos.length > 1 && (
                        <div className="absolute top-0 left-0 right-0 h-20 bg-gradient-to-b from-black/20 to-transparent pointer-events-none z-10" />
                    )}

                    {photos.length > 1 && (
                        <>
                            {/* Счетчик фото */}
                            <div className="absolute top-4 left-1/2 transform -translate-x-1/2 bg-black/20 backdrop-blur-md text-white px-4 py-1 rounded-full text-xs font-semibold z-20 border border-white/20">
                                {currentImageIndex + 1} / {photos.length}
                            </div>

                            {/* Стрелки навигации */}
                            <button
                                onClick={handlePrevImage}
                                className="prev-btn absolute left-4 top-1/2 transform -translate-y-1/2 bg-white/95 backdrop-blur-sm text-gray-800 rounded-full w-11 h-11 flex items-center justify-center hover:bg-white hover:scale-110 transition-all duration-300 opacity-0 group-hover:opacity-100 z-20 shadow-xl"
                                aria-label="Предыдущее фото"
                            >
                                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M15 19l-7-7 7-7"></path>
                                </svg>
                            </button>
                            <button
                                onClick={handleNextImage}
                                className="next-btn absolute right-4 top-1/2 transform -translate-y-1/2 bg-white/95 backdrop-blur-sm text-gray-800 rounded-full w-11 h-11 flex items-center justify-center hover:bg-white hover:scale-110 transition-all duration-300 opacity-0 group-hover:opacity-100 z-20 shadow-xl"
                                aria-label="Следующее фото"
                            >
                                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M9 5l7 7-7 7"></path>
                                </svg>
                            </button>

                            {/* Индикаторы */}
                            <div className="absolute bottom-5 left-1/2 transform -translate-x-1/2 flex gap-2 z-20">
                                {photos.map((_, index) => (
                                    <button
                                        key={index}
                                        onClick={(e) => handleDotClick(index, e)}
                                        className={`slider-dot h-2 rounded-full transition-all duration-300 ${
                                            index === currentImageIndex 
                                                ? 'bg-white w-8 shadow-lg' 
                                                : 'bg-white/60 w-2 hover:bg-white/80 hover:w-4'
                                        }`}
                                        aria-label={`Фото ${index + 1}`}
                                    />
                                ))}
                            </div>
                        </>
                    )}
                </div>
            </div>

            {/* Информация о товаре */}
            <div className="p-5 space-y-4">
                {/* Название */}
                <div>
                    <h3 className="font-bold text-xl text-gray-900 line-clamp-2 leading-snug mb-1">
                        {item.title}
                    </h3>
                </div>

                {/* Размеры - только для отображения */}
                <div className="space-y-2">
                    <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide">
                        Доступные размеры
                    </p>
                    <div className="flex flex-wrap gap-2">
                        {sizes.map((size, index) => (
                            <span
                                key={index}
                                className="px-3 py-1.5 rounded-xl text-sm font-semibold bg-gradient-to-br from-gray-100 to-gray-50 text-gray-700 border border-gray-200"
                            >
                                {size}
                            </span>
                        ))}
                    </div>
                </div>

                {/* Цены */}
                <div className="pt-2">
                    <div className="flex items-baseline gap-3 mb-1">
                        <span className="text-3xl font-black bg-gradient-to-r from-gray-900 to-gray-700 bg-clip-text text-transparent">
                            {item.price}
                        </span>
                        <span className="text-xl font-bold text-gray-400">баллов</span>
                    </div>
                    {discountPercent > 0 && (
                        <div className="flex items-center gap-2">
                            <span className="text-base text-gray-400 line-through font-medium">
                                {item.old_price}
                            </span>
                            <span className="text-sm text-green-600 font-bold bg-green-50 px-2 py-0.5 rounded-lg">
                                Выгода {(oldPrice - newPrice).toLocaleString()}
                            </span>
                        </div>
                    )}
                </div>

                {/* Кнопка обмена */}
                <div className="pt-2">
                    <button
                        onClick={handleBuyClick}
                        className="w-full bg-black text-white px-6 py-4 rounded-2xl font-bold text-base shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-[1.02] active:scale-[0.98] relative overflow-hidden group"
                    >
                        
                        <div className="relative flex items-center justify-center gap-2.5">
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"></path>
                            </svg>
                            <span>Обменять баллы</span>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    );
});

ProductCard.displayName = 'ProductCard';

export default ProductCard;
