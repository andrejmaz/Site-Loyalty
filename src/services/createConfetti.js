function createConfetti() {
    const colors = ['#5E72E4', '#11CDEF', '#2DCE89', '#FB6340', '#F5365C', '#8965E0', '#FFBF00'];
    
    for (let i = 0; i < 100; i++) {
        const confetti = document.createElement('div');
        confetti.className = 'confetti';
        confetti.style.left = Math.random() * 100 + 'vw';
        confetti.style.animationDelay = Math.random() * 3 + 's';
        confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
        
        // Разные формы конфетти
        if (Math.random() > 0.6) {
            confetti.style.borderRadius = '50%';
        } else if (Math.random() > 0.5) {
            confetti.style.width = '7px';
            confetti.style.height = '7px';
            confetti.style.transform = 'rotate(45deg)';
        }
        
        document.body.appendChild(confetti);
        
        // Удаляем конфетти после окончания анимации
        setTimeout(() => {
            confetti.remove();
        }, 6000);
    }
}

export default createConfetti;