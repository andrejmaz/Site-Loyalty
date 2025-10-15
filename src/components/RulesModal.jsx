import Modal from './Modal';

/**
 * Модальное окно с правилами программы лояльности
 */
const RulesModal = ({ isOpen, onClose }) => {
    return (
        <Modal isOpen={isOpen} onClose={onClose} size="lg">
            <div className="flex-1 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent">
                <div className="space-y-6">
                    <div className="text-center mb-6">
                        <div className="text-4xl mb-2">🎁</div>
                        <h3 className="text-xl font-bold font-unbounded">Программа лояльности</h3>
                        <p className="text-gray-600 mt-2">Зарабатывай бонусы за выполнение заданий и трать их на покупки!</p>
                    </div>

                    <div className="border-t pt-4">
                        <h4 className="font-bold text-lg mb-3 font-unbounded">Как заработать бонусы:</h4>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start">
                                <span className="text-black-500 mr-2 mt-1">•</span>
                                <span>Выполняй задания: ежедневные, одноразовые, с лимитом в месяц</span>
                            </li>
                            <li className="flex items-start">
                                <span className="text-black-500 mr-2 mt-1">•</span>
                                <span>Получай кэшбэк за покупки (1% от суммы)</span>
                            </li>
                            <li className="flex items-start">
                                <span className="text-black-500 mr-2 mt-1">•</span>
                                <span>Делись отзывами, зови друзей, выкладывай stories и другое</span>
                            </li>
                        </ul>
                        <p className="text-sm text-gray-500 mt-3 italic">Список заданий — во вкладке Задания</p>
                    </div>

                    <div className="border-t pt-4">
                        <div className="text-center text-gray-400 text-xl mb-4">⸻</div>
                    </div>

                    <div>
                        <h4 className="font-bold text-lg mb-3 font-unbounded">Как потратить бонусы:</h4>
                        <ol className="space-y-3 text-gray-700">
                            <li className="flex items-start">
                                <span className="bg-black text-white rounded-full w-6 h-6 flex items-center justify-center text-sm font-bold mr-3 mt-0.5 flex-shrink-0">1</span>
                                <div>
                                    <strong>Полностью оплатить покупку</strong> — выбери товар и закажи его за бонусы. Мы доставим бесплатно.
                                </div>
                            </li>
                            <li className="flex items-start">
                                <span className="bg-black text-white rounded-full w-6 h-6 flex items-center justify-center text-sm font-bold mr-3 mt-0.5 flex-shrink-0">2</span>
                                <div>
                                    <strong>Получить кэшбэк</strong> — покупай товар за свои деньги, пришли нам чек — и мы вернём сумму бонусами на карту (в пределах твоего баланса).
                                </div>
                            </li>
                        </ol>
                        <div className="mt-4 text-sm text-gray-500 space-y-1">
                            <p>• Весь твой баланс и история — во вкладке Баланс</p>
                            <p>• Каталог товаров — во вкладке Каталог</p>
                        </div>
                    </div>

                    <div className="border-t pt-4">
                        <div className="text-center text-gray-400 text-xl mb-4">⸻</div>
                    </div>

                    <div className="text-center bg-gray-50 rounded-lg p-4">
                        <p className="text-gray-700 font-medium">Хочешь — заработай, хочешь — потрать. Всё просто :)</p>
                    </div>
                </div>
            </div>
        </Modal>
    );
};

export default RulesModal;
