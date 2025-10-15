import { useNavigate, useLocation } from 'react-router-dom';
import webAppManager from '../services/webAppManager';
import { getCurrentPage } from '../utils/helpers';

const Navbar = () => {
    const navigate = useNavigate();
    const currentPage = getCurrentPage(useLocation().pathname);

    const navItems = [
        {
            id: 'tasks',
            path: '/tasks',
            label: 'Задания',
            icon: (isActive) => (
            <svg width="24" height="24" viewBox="0 0 71 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="29.7427" cy="30.2622" r="25.4751" stroke={isActive ? "#000000" : "#757575"} strokeWidth="8"/>
                <mask id="path-2-inside-1_25_382" fill="white">
            <path fillRule="evenodd" clipRule="evenodd" d="M59.9243 42.0074C57.106 49.2117 51.7797 55.1588 45.0192 58.7749C59.4945 56.8838 70.6717 44.5033 70.6717 29.5122C70.6717 13.2797 57.5667 0.108013 41.3596 0C48.5812 2.76865 54.5579 8.05107 58.2186 14.7762C61.6349 18.7278 63.7014 23.8787 63.7014 29.5122C63.7014 34.1341 62.3104 38.4311 59.9243 42.0074Z"/>
                </mask>
                <path d="M59.9243 42.0074L53.2695 37.5674L52.7893 38.2872L52.4741 39.0929L59.9243 42.0074ZM45.0192 58.7749L41.246 51.7206L46.0555 66.7075L45.0192 58.7749ZM41.3596 0L41.4129 -7.99982L38.4958 7.46984L41.3596 0ZM58.2186 14.7762L51.1921 18.601L51.6037 19.3571L52.1667 20.0084L58.2186 14.7762ZM52.4741 39.0929C50.3554 44.509 46.341 48.9953 41.246 51.7206L48.7924 65.8292C57.2184 61.3222 63.8567 53.9144 67.3745 44.9219L52.4741 39.0929ZM46.0555 66.7075C64.4627 64.3027 78.6717 48.5732 78.6717 29.5122H62.6717C62.6717 40.4334 54.5264 49.4649 43.9829 50.8423L46.0555 66.7075ZM78.6717 29.5122C78.6717 8.87928 62.0144 -7.86252 41.4129 -7.99982L41.3063 7.99982C53.119 8.07855 62.6717 17.6801 62.6717 29.5122H78.6717ZM38.4958 7.46984C43.9241 9.55098 48.4328 13.5319 51.1921 18.601L65.245 10.9515C60.6829 2.57029 53.2383 -4.01369 44.2234 -7.46984L38.4958 7.46984ZM71.7014 29.5122C71.7014 21.8854 68.8955 14.8939 64.2704 9.54412L52.1667 20.0084C54.3742 22.5617 55.7014 25.8719 55.7014 29.5122H71.7014ZM66.5791 46.4474C69.8151 41.5973 71.7014 35.7629 71.7014 29.5122H55.7014C55.7014 32.5052 54.8058 35.2648 53.2695 37.5674L66.5791 46.4474Z"
                 fill={isActive ? "#000000" : "#757575"} mask="url(#path-2-inside-1_25_382)"/>
                <path d="M38.8508 25.8197L29.33 33.387L24.5926 29.8049" stroke={isActive ? "#000000" : "#757575"} strokeWidth="8" strokeLinecap="square"/>
            </svg>
            )
        },
        {
            id: 'balance',
            path: '/balance',
            label: 'Баланс',
            icon: (isActive) => (
                <svg width="24" height="24" viewBox="0 0 70 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M65.4577 18.7212H35.1966H18.8761C11.177 18.7212 4.93555 24.9626 4.93555 32.6618V47.2247C4.93555 54.9239 11.177 61.1653 18.8761 61.1653H51.5171C59.2163 61.1653 65.4577 54.9239 65.4577 47.2247V37.9783V24.6162" stroke={isActive ? "#000000" : "#757575"} strokeWidth="8"/>
                    <path d="M8.07959 12.04V11.6903C8.07959 7.23103 12.2089 3.9186 16.562 4.88595L64.6718 15.577V18.721" stroke={isActive ? "#000000" : "#757575"} strokeWidth="8" strokeLinecap="square"/>
                    <path d="M18.2976 45.4453L25.3716 45.4453" stroke={isActive ? "#000000" : "#757575"} strokeWidth="8" strokeLinecap="square"/>
                </svg>
            )
        },
        {
            id: 'catalog',
            path: '/catalog',
            label: 'Каталог',
            icon: (isActive) => (
                <svg width="24" height="24" viewBox="0 0 78 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M43.1773 14.592C32.8986 14.592 33.7111 9.93886 30.8163 4.73572L24.9231 4.60171C22.1636 4.53896 19.5376 5.78748 17.8443 7.96727L4.53986 25.0941C3.76767 26.0882 4.27182 27.5479 5.49288 27.8536L20.5362 31.619V21.0216V58.7361H39.5971H56.8947C57.8652 58.7361 58.6486 57.9433 58.6372 56.9729L58.2119 21.0216L58.658 31.619L72.6659 27.8837C73.8729 27.5619 74.3592 26.1119 73.5903 25.1274L60.8282 8.78689C59.177 6.67273 56.644 5.43702 53.9614 5.43702H43.1773" 
                    stroke={isActive ? "#000000" : "#757575"} strokeWidth="8"/>
                </svg>

            )
        }
    ];

    const handleNavigate = (item) => {
        webAppManager.hapticImpact();
        navigate(item.path);
    };

    return (
        <div className="flex max-w-lg mx-auto h-[90px] w-full items-start bg-white rounded-t-2xl border-t border-gray-200 shadow-black shadow-2xl">
            {navItems.map((item) => {
                const isActive = currentPage === item.id;
                
                return (
                    <div 
                        key={item.id}
                        className="navbar-item relative flex flex-1 cursor-pointer flex-col items-center justify-center py-1"
                        onClick={() => handleNavigate(item)}
                    >
                        <div className={`flex items-center justify-center w-10 h-10 rounded-full transition-all duration-300`}>
                            {item.icon(isActive)}
                        </div>
                        <div className={`nav-text text-[12px] font-medium transition-all duration-300 ${
                            isActive ? 'text-primary' : 'text-secondary-2'
                        }`}>
                            {item.label}
                        </div>
                    </div>
                );
            })}
        </div>
    );
};

export default Navbar;
