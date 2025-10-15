import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import webAppManager from '../services/webAppManager';
import NotificationModal from '../components/NotificationModal';
import { useModal } from '../hooks/useModal';
import { useLazyLoad } from '../hooks/useLazyLoad';
import { useScrollRestoration } from '../hooks/useScrollRestoration';
import ProductCard from '../components/ProductCard';

/**
 * Экран каталога с кешбеком и товарами
 */
const CatalogScreen = ({ user, items, loading, onLoadItems, onRefresh, cacheValid }) => {
    const navigate = useNavigate();
    const notificationModal = useModal();
    
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });
    const [isRefreshing, setIsRefreshing] = useState(false);
    
    // Восстановление позиции скролла
    const { scrollRef, isRestoring } = useScrollRestoration('catalog-scroll', [items.length]);
    
    // Ленивая загрузка карточек товаров с сохранением состояния
    const { displayedItems, hasMore, loadMoreRef, totalCount } = useLazyLoad(items, 6, 6, 'catalog-lazy-load');

    // Загружаем товары при монтировании
    useEffect(() => {
        // Всегда вызываем onLoadItems - внутри она сама проверит кеш
        onLoadItems();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []); // Запускаем только при монтировании

    // Ручное обновление товаров
    const handleRefresh = async () => {
        setIsRefreshing(true);
        webAppManager.hapticImpact();
        try {
            await onRefresh();
            showNotification('✅', 'Обновлено', 'Каталог товаров успешно обновлен');
        } catch (error) {
            showNotification('❌', 'Ошибка', 'Не удалось обновить каталог');
        } finally {
            setIsRefreshing(false);
        }
    };

    const handleCashbackClick = () => {
        webAppManager.hapticImpact();
        const userBalance = user?.user?.card_balance || 0;
        
        if (userBalance < 1000) {
            showNotification('❌', 'Недостаточно баллов', 'Для получения кешбека необходимо иметь минимум 1000 баллов');
        } else {
            navigate('/tasks/cashback');
        }
    };

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    const handleBuyItem = (item) => {
        webAppManager.hapticImpact();
        // TODO: Реализовать покупку товара
        const userBalance = user?.user?.card_balance || 0;
        const itemPrice = parseInt(item.price.replace(/\s/g, ''));

        if (userBalance < itemPrice) {
            showNotification('❌', 'Недостаточно баллов', 'У вас недостаточно баллов для покупки этого товара');
        } else {
            // Показываем подтверждение покупки
            showNotification('🛍️', 'Покупка товара', `Вы хотите купить "${item.title}" за ${item.price} ₽?`);
        }
    };

    return (
        <>
            <div 
                ref={scrollRef} 
                className="h-full overflow-y-scroll px-4 pb-8"
                style={{ 
                    opacity: isRestoring ? 0 : 1,
                    transition: isRestoring ? 'none' : 'opacity 0.15s ease-in'
                }}
            >
                <h1 className="text-3xl font-semibold mt-4 mb-4 font-unbounded uppercase">Получить<br/>кешбек<br/>за покупку</h1>
                <p className="text-base font-light text-gray-600 mb-4">
                    Вы можете заказать товар в нашем магазине или магазине-партнере и обменять баллы на кешбек
                </p>
                <button 
                    onClick={handleCashbackClick}
                    className="cashback-btn bg-black text-white px-8 py-4 rounded-lg w-full mb-8 hover:bg-gray-800 transition-colors"
                >
                    Получить кешбек
                </button>

                <div className="flex items-center justify-between mb-4">
                    <h2 className="text-3xl font-semibold font-unbounded uppercase">Каталог</h2>
                    {/* <button
                        onClick={handleRefresh}
                        disabled={isRefreshing || loading}
                        className="flex items-center gap-2 px-4 py-2 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                        title="Обновить каталог"
                    >
                        <svg 
                            className={`w-5 h-5 ${isRefreshing ? 'animate-spin' : ''}`} 
                            fill="none" 
                            stroke="currentColor" 
                            viewBox="0 0 24 24"
                        >
                            <path 
                                strokeLinecap="round" 
                                strokeLinejoin="round" 
                                strokeWidth="2" 
                                d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"
                            />
                        </svg>
                        <span className="text-sm font-medium hidden sm:inline">
                            {isRefreshing ? 'Обновление...' : 'Обновить'}
                        </span>
                    </button> */}
                </div>
                <p className="text-gray-600 mb-4">Так же вы можете использовать свои баллы, чтобы полностью оплатить покупку</p>
                
                {/* Индикатор состояния кеша */}
                {/* {!loading && cacheValid && items.length > 0 && (
                    <div className="mb-4 text-xs text-gray-500 flex items-center gap-2">
                        <svg className="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                        </svg>
                        <span>Актуальные данные (обновляется каждые 5 минут)</span>
                    </div>
                )} */}

                {loading ? (
                    <div className="flex items-center justify-center p-8">
                        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
                        <span className="ml-3 text-gray-600">Загружаем товары...</span>
                    </div>
                ) : items.length === 0 ? (
                    <div className="p-8 text-center">
                        <div className="text-gray-500 mb-2">
                            <svg className="w-12 h-12 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M9 21h6"></path>
                            </svg>
                        </div>
                        <p className="text-gray-600 font-medium">Товары не найдены</p>
                        <p className="text-sm text-gray-400 mt-2">Попробуйте позже</p>
                    </div>
                ) : (
                    <>
                        <div className="grid gap-6">
                            {displayedItems.map((item) => (
                                <ProductCard 
                                    key={item.id} 
                                    item={item}
                                    onBuy={handleBuyItem}
                                />
                            ))}
                        </div>
                        
                        {/* Элемент-триггер для ленивой загрузки */}
                        {hasMore && (
                            <div 
                                ref={loadMoreRef}
                                className="flex items-center justify-center p-8"
                            >
                                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
                                <span className="ml-3 text-gray-600">Загружаем ещё...</span>
                            </div>
                        )}

                        {/* Индикатор конца списка */}
                        {!hasMore && totalCount > 6 && (
                            <div className="text-center py-8 text-gray-500 text-sm">
                                <div className="inline-flex items-center gap-2 px-4 py-2 bg-gray-100 rounded-full">
                                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <span>Все товары загружены ({totalCount})</span>
                                </div>
                            </div>
                        )}
                    </>
                )}
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

export default CatalogScreen;
