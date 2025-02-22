// Set user name in welcome message
function handleChangeName(name){
    document.getElementById('userName').textContent = name;
}


// Handle card clicks
function handleCardClick(type) {
    switch(type) {
        case 'booking':
            alert('Redirecting to cab booking service...');
            // Add your booking page redirect logic here
            break;
        case 'profile':
            alert('Redirecting to profile editing page...');
            // Add your profile page redirect logic here
            break;
        case 'complaint':
            alert('Redirecting to complaint form...');
            // Add your complaint page redirect logic here
            break;
    }
}


// Handle logout
function handleLogout() {
    if(confirm('Are you sure you want to logout?')) {
        alert('Logging out...');
        // Add your logout logic here
        // Example: window.location.href = 'login.html';
    }
}
