<%@ page contentType = "text/html; charset = UTF-8"  language = "java" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Dashboard</title>
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <header class="header">
        <h1 class="company-name">Mega City Cab</h1>
        <button class="logout-btn" onclick="handleLogout()">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </button>
    </header>


    <main class="main-content">
        <h2 class="welcome-message">Welcome, <span id="userName">Sankeeth</span>!</h2>

        <div class="services-grid">

            <div class="card" onclick="handleCardClick('booking')">
                <div class="icon-circle">
                    <i class="fas fa-taxi"></i>
                </div>
                <h2>Book a Cab</h2>
                <p>Quick and easy cab booking service. Get a ride in minutes.</p>
                <button class="card-button">Book Now</button>
            </div>


            <div class="card" onclick="handleCardClick('profile')">
                <div class="icon-circle">
                    <i class="fas fa-user-edit"></i>
                </div>
                <h2>Edit Profile</h2>
                <p>Update your personal information and preferences.</p>
                <button class="card-button">Edit Profile</button>
            </div>


            <div class="card" onclick="handleCardClick('complaint')">
                <div class="icon-circle">
                    <i class="fas fa-comment-alt"></i>
                </div>
                <h2>Lodge Complaint</h2>
                <p>Report issues or submit feedback about our services.</p>
                <button class="card-button">Submit Complaint</button>
            </div>
        </div>
    </main>

    <script src="assets/js/home.js"></script>

</body>
</html>