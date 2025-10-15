import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { normalizeTaskType } from '../utils/helpers';
import webAppManager from '../services/webAppManager';
import { useModal } from '../hooks/useModal';
import DailyBonusModal from '../components/TaskModals/DailyBonusModal';
import TelegramModal from '../components/TaskModals/TelegramModal';
import NotificationModal from '../components/NotificationModal';

/**
 * Экран заданий
 * @param {Object} props - Пропсы компонента
 * @param {Array} props.tasks - Список заданий
 * @param {boolean} props.loading - Флаг загрузки
 * @param {boolean} props.isInitialLoad - Флаг первой загрузки
 * @param {Function} props.onLoadTasks - Функция загрузки заданий
 * @param {Function} props.onRefresh - Функция обновления заданий
 */
const TasksScreen = ({ tasks, loading, isInitialLoad, onLoadTasks, onRefresh }) => {
    const navigate = useNavigate();

    // Модальные окна
    const dailyBonusModal = useModal();
    const telegramModal = useModal();
    const notificationModal = useModal();

    // Состояние для уведомлений
    const [notification, setNotification] = useState({ icon: '✅', title: '', message: '' });

    // Загрузка заданий при монтировании (только один раз)
    useEffect(() => {
        onLoadTasks();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    const handleTaskClick = (task) => {
        webAppManager.hapticImpact();

        const taskType = normalizeTaskType(task);

        switch (taskType) {
            case 'daily_bonus':
                dailyBonusModal.open();
                break;
            case 'cashback':
                navigate('/tasks/cashback', { state: task });
                break;
            case 'instagram_subscribe':
                navigate('/tasks/instagram-subscribe', { state: task });
                break;
            case 'telegram_subscribe':
                telegramModal.open();
                break;
            case 'review':
                navigate('/tasks/review', { state: task });
                break;
            case 'referral':
                navigate('/tasks/referral', { state: task });
                break;
            case 'instagram_story':
                navigate('/tasks/instagram-stories', { state: task });
                break;
            default:
                showNotification('🚫', 'Ошибка', `Неизвестный тип задания: ${task.title}`);
        }
    };

    const showNotification = (icon, title, message) => {
        setNotification({ icon, title, message });
        notificationModal.open();
    };

    const handleTaskSuccess = async (icon, title, message) => {
        showNotification(icon, title, message);
        // Перезагружаем задания в фоне
        await onRefresh();
    };

    return (
        <>
            <div className="h-full overflow-y-scroll px-4 pb-8">
                <h2 className="text-3xl font-semibold mt-4 mb-4 font-unbounded uppercase">Задания</h2>
                <div className="tasks-list bg-white rounded-xl overflow-hidden">
                    {tasks.length === 0 ? (
                        <div className="p-8 text-center">
                            {isInitialLoad ? (
                                <>
                                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900 mx-auto mb-4"></div>
                                    <p className="text-gray-600 font-medium">Загрузка заданий...</p>
                                </>
                            ) : (
                                <>
                                    <div className="text-gray-500 mb-2">
                                        <svg className="w-12 h-12 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                        </svg>
                                    </div>
                                    <p className="text-gray-600 font-medium">Заданий пока нет</p>
                                    <p className="text-sm text-gray-400 mt-2">Новые задания появятся здесь</p>
                                </>
                            )}
                        </div>
                    ) : (
                        tasks.map((task) => {
                            return (
                                console.log(task),
                                <div
                                    key={task.id}
                                    className={`flex items-center p-4 border-b border-gray-100 last:border-0 ${
                                        task.is_available ? 'cursor-pointer hover:bg-gray-50 transition-colors' : (task.available_text === 'Выполнено' ? 'cursor-default opacity-60' : 'cursor-pointer hover:bg-gray-50 transition-colors')
                                    }`}
                                    onClick={() => task.is_available && handleTaskClick(task)}
                                >
                                    <div className="w-10 h-10 bg-secondary-3 rounded-xl mr-4 flex items-center justify-center">
                                        <img 
                                            src={task.icon_url || '/images/icons/other.svg'} 
                                            alt={task.title} 
                                            className="w-5 h-5 object-contain" 
                                        />
                                    </div>
                                    <div className="flex-grow">
                                        <div className="font-medium text-secondary">{task.title}</div>
                                        <div className={`text-sm ${task.is_available ? 'text-green-600' : 'text-gray-500'}`}>{task.available_text}</div>
                                    </div>
                                    <div className={`font-medium ${task.is_available ? 'text-green-600' : 'text-gray-500'}`}>{task.points} {task.system_name === 'cashback' ? '%' : '₽'}</div>
                                    {task.is_available && <div className="ml-2 text-gray-400">›</div>}
                                </div>
                            );
                        })
                    )}
                </div>
            </div>

            {/* Модальные окна для заданий */}
            <DailyBonusModal 
                isOpen={dailyBonusModal.isOpen} 
                onClose={dailyBonusModal.close}
                onSuccess={handleTaskSuccess}
            />
            <TelegramModal 
                isOpen={telegramModal.isOpen} 
                onClose={telegramModal.close}
                onSuccess={handleTaskSuccess}
            />
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

export default TasksScreen;
