import { BrowserRouter as Router, Routes, Route, Navigate, useLocation } from 'react-router-dom';
import { useUser } from './hooks/useUser';
import { useStoreItems } from './hooks/useStoreItems';
import { useTasks } from './hooks/useTasks';
import { useTransactions } from './hooks/useTransactions';
import { useAppInitialization } from './hooks/useAppInitialization';
import { useBackButton } from './hooks/useBackButton';

// Screens
import BalanceScreen from './screens/BalanceScreen';
import TasksScreen from './screens/TasksScreen';
import CatalogScreen from './screens/CatalogScreen';
import ReferralScreen from './screens/tasks/ReferralScreen';

import CashbackPurchaseScreen from './screens/tasks/CashbackPurchaseScreen';
import InstagramSubscribeScreen from './screens/tasks/InstagramSubscribeScreen';
import ReviewScreen from './screens/tasks/ReviewScreen';
import InstagramStoriesScreen from './screens/tasks/InstagramStoriesScreen';

// Components
import Navbar from './components/Navbar';

/**
 * Компонент для отслеживания текущей страницы
 */
const AppContent = () => {
    const { user, error, initializeUser, refreshBalance } = useUser();
    useAppInitialization(initializeUser);
    useBackButton();
    
    // Управление товарами каталога
    const { 
        storeItems, 
        storeItemsLoading, 
        isCacheValid, 
        loadStoreItems, 
        refreshStoreItems 
    } = useStoreItems();
    
    // Управление заданиями
    const {
        tasks,
        tasksLoading,
        isInitialLoad,
        loadTasks,
        refreshTasks
    } = useTasks();
    
    // Управление транзакциями
    const {
        transactions,
        transactionsLoading,
        isInitialLoad: isTransactionsInitialLoad,
        loadTransactions,
        refreshTransactions,
        addTransaction
    } = useTransactions();

    if (error) {
        return (
            <div className="flex items-center justify-center min-h-screen p-4">
                <div className="text-center bg-white p-8 rounded-xl shadow-lg max-w-md">
                    <div className="text-6xl mb-4">❌</div>
                    <h1 className="text-2xl font-bold mb-2">Ошибка авторизации</h1>
                    <p className="text-gray-600">{error}</p>
                </div>
            </div>
        );
    }

    return (
        <div>
            <div className="overflow-y-hidden max-w-lg mx-auto" style={{ height: 'calc(100dvh - 90px)' }}>
                <Routes>
                    <Route path="/balance" element={
                        <BalanceScreen 
                            user={user}
                            transactions={transactions}
                            loading={transactionsLoading}
                            isInitialLoad={isTransactionsInitialLoad}
                            onLoadTransactions={loadTransactions}
                            onRefresh={refreshTransactions}
                            onRefreshBalance={refreshBalance}
                        />
                    } />
                    <Route path="/tasks" element={
                        <TasksScreen 
                            user={user}
                            tasks={tasks}
                            loading={tasksLoading}
                            isInitialLoad={isInitialLoad}
                            onLoadTasks={loadTasks}
                            onRefresh={refreshTasks}
                        />
                    } />
                    <Route path="/catalog" element={
                        <CatalogScreen 
                            user={user} 
                            items={storeItems}
                            loading={storeItemsLoading}
                            onLoadItems={loadStoreItems}
                            onRefresh={refreshStoreItems}
                            cacheValid={isCacheValid}
                        />
                    } />
                    <Route path="/tasks/referral" element={<ReferralScreen user={user} />} />
                    <Route path="/tasks/cashback" element={<CashbackPurchaseScreen />} />
                    <Route path="/tasks/instagram-subscribe" element={<InstagramSubscribeScreen />} />
                    <Route path="/tasks/review" element={<ReviewScreen />} />
                    <Route path="/tasks/instagram-stories" element={<InstagramStoriesScreen />} />
                    <Route path="/" element={<Navigate to="/balance" replace />} />
                </Routes>
            </div>
            
            <Navbar/>
        </div>
    );
};

function App() {
    return (
        <Router>
            <AppContent />
        </Router>
    );
}

export default App;