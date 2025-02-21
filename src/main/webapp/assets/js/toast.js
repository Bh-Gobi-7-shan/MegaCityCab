function showToast(message, type, duration) {
    if (duration === undefined) {
        duration = 3000;
    }

    const toastContainer = document.getElementById('toastContainer');

    const toast = document.createElement('div');
    toast.className = 'toast';

    if (type) {
        toast.classList.add('toast-' + type);
    }

    toast.textContent = message;

    toastContainer.appendChild(toast);

    setTimeout(function() {
        toast.classList.add('show');
    }, 10);

    setTimeout(function(){
        toast.classList.remove('show');
        setTimeout(function() {
            toastContainer.removeChild(toast);
        }, 500);
    }, duration);
}