import { useEffect } from 'react';
import RulesModal from '../components/RulesModal';
import { formatDate } from '../utils/helpers';
import { useModal } from '../hooks/useModal';
import { setRulesViewed } from '../services/auth';

/**
 * Экран баланса с картой пользователя и историей транзакций
 */
const BalanceScreen = ({ 
    user, 
    transactions = [], 
    loading = false,
    isInitialLoad = true,
    onLoadTransactions,
    onRefresh,
    onRefreshBalance 
}) => {
    const rulesModal = useModal();
    
    // Загрузка транзакций и обновление баланса при монтировании (только один раз)
    useEffect(() => {
        onLoadTransactions();
        // Обновляем баланс при открытии экрана
        if (onRefreshBalance) {
            onRefreshBalance();
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []); // Специально пустой массив - загружаем только при монтировании

    const handleRulesClose = () => {
        setRulesViewed();
        rulesModal.close();
    };

    if (!user || !user.user) {
        return (
            <div className="flex items-center justify-center p-8">
                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
                <span className="ml-3 text-gray-600">Загрузка...</span>
            </div>
        );
    }

    const userData = user.user;
    const cardNumber = userData.id?.toString().padStart(5, '0') || '00000';

    return (
        <>
            <div className="h-full overflow-y-scroll px-4 pb-8">
                {/* Карта пользователя */}
                <div className="loyalty-card bg-gradient-to-br from-[#FFB03D] to-[#FFE66B] text-white px-8 py-6 rounded-xl my-4 relative overflow-hidden [filter:drop-shadow(2px_4px_5px_rgba(0,98,255,0.3))] [box-shadow:inset_0px_0px_15px_3px_rgba(0,0,0,0.05)]">
                    <div className="absolute inset-0">
                        <img src="/images/card-bg.webp" className="w-full h-full object-cover" alt="" />
                    </div>
                    <div className="relative z-10">
                        <div className="flex justify-between mb-8">
                            <span className="text-base opacity-80 font-normal">
                                Бонусная карта <br />участника
                            </span>
                            <span className="text-base font-light">• {cardNumber}</span>
                        </div>
                        <div className="text-5xl font-semibold mb-2 font-unbounded">
                            {userData.card_balance || 0}
                            <span className="text-3xl font-unbounded font-medium"> ₽</span>
                        </div>
                        <div className="text-lg font-medium uppercase">
                            {userData.first_name || ''} {userData.last_name || ''}
                        </div>
                    </div>
                </div>

                {/* Ссылка на правила */}
                <div 
                    onClick={() => rulesModal.open()}
                    className="rules-link text-right text-gray-500 text-m cursor-pointer font-medium hover:text-gray-700 mr-2 transition-colors"
                >
                    ⟶ Правила
                </div>

                {/* История транзакций */}
                <h2 className="text-3xl font-semibold mt-8 mb-4 font-unbounded">История</h2>
                <div className="transactions rounded-xl overflow-hidden bg-transparent">
                    {transactions.length === 0 ? (
                        <div className="bg-white rounded-xl p-8 text-center">
                            {isInitialLoad ? (
                                <>
                                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900 mx-auto mb-4"></div>
                                    <p className="text-gray-600 font-medium">Загрузка транзакций...</p>
                                </>
                            ) : (
                                <>
                                    <div className="text-gray-500 mb-2">
                                        <svg className="w-12 h-12 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                        </svg>
                                    </div>
                                    <p className="text-gray-600 font-medium">У вас пока нет транзакций</p>
                                    <p className="text-sm text-gray-400 mt-2">Переходите на страницу заданий и получите свои первые баллы</p>
                                </>
                            )}
                        </div>
                    ) : (
                        transactions.map((transaction, index) => {
                            const title = transaction.task?.title || (transaction.is_positive ? 'Другое' : 'Вывод средств');
                            const icon = transaction.task?.icon || '/images/icons/other.svg';

                            return (
                                <div key={index} className="flex items-center p-4 bg-white rounded-lg mb-2">
                                    <div className={`w-10 h-10 rounded-xl mr-4 flex items-center justify-center bg-secondary-3`}>
                                        <img src={icon} alt={title} className="w-7 h-7 object-contain" />
                                    </div>
                                    <div className="flex-grow">
                                        <div className="font-medium text-secondary">{title}</div>
                                    </div>
                                    <div className="flex flex-col items-end">
                                        <div className={`font-medium ${transaction.is_positive ? 'text-green-500' : 'text-secondary'}`}>
                                            {transaction.is_positive ? '+' : '-'}{Math.abs(transaction.amount)}₽
                                        </div>
                                        <div className="text-[8px] text-gray-400">{formatDate(transaction.created_at)}</div>
                                    </div>
                                </div>
                            );
                        })
                    )}
                </div>
            </div>

            <RulesModal isOpen={rulesModal.isOpen} onClose={handleRulesClose} />
        </>
    );
};

export default BalanceScreen;
