<%@ page contentType = "text/html; charset = UTF-8"  language = "java" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCityCab</title>
    <link rel="icon" type="image/png" href="icon.png">
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/toast.css">

</head>
<body>
    <nav>
        <div class="container nav-content">
            <a href="#" class="logo">
                Mega City Cab
            </a>
            <div class="nav-links">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#contact">Contact</a>
            </div>

            <button class="menu-toggle" aria-label="Toggle navigation">
                <span></span>
                <span></span>
                <span></span>
            </button>

            <div class="mobile-nav">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#contact">Contact</a>
            </div>
        </div>
    </nav>

    <section id="home" class="hero">
        <div class="container hero-content">
            <div class="hero-text">
                <div class="trust-badge">
                    👍 100% Trusted Cab Booking Platform in your Area
                </div>
                <h1>Find Your Best <br>Local Cab Service <br>For Your Ride</h1>
                <p class = "title">
                    Discover top-rated cab services near you. Whether you need a quick ride or a long-distance trip,
                    browse reviews and book a reliable cab to reach your destination safely. From city commutes to airport
                    transfers, we've got you covered
                </p>
                <a href="login.jsp" class="cta-button">
                    For Booking →
                </a>
            </div>
            <div class="hero-image">
                <img src="assets/objects/car-removebg-preview.png" alt="Modern BMW" />
            </div>
        </div>
    </section>

    <section class="slideshow-section">
        <div class="container">
            <div class="slideshow-container">
                <div class="slideshow-slide">
                    <img src="assets/objects/car1.jpg" alt="Car1">
                </div>
                <div class="slideshow-slide">
                    <img src="assets/objects/car2.jpg" alt="Car2">
                </div>
                <div class="slideshow-slide">
                    <img src="assets/objects/car3.jpg" alt="Car3">
                </div>
                <button class="slideshow-prev" onclick="changeSlide(-1)">&#10094;</button>
                <button class="slideshow-next" onclick="changeSlide(1)">&#10095;</button>
            </div>
        </div>
    </section>

    <section id="about">
        <div class="container about-content">
            <div class="about-text">
                <h2>About Mega City Cab</h2>
                <p>At Mega City Cab, we're transforming the way people book reliable and affordable rides. Our platform ensures a seamless and hassle-free cab booking experience, connecting you with trusted drivers for every journey.</p>
                <p>Founded in 2024, we've helped thousands of passengers reach their destinations safely and on time.</p>

                <div class="about-features">
                    <div class="feature-card">
                        <h3>🚖 Verified Drivers</h3>
                        <p>All drivers undergo thorough background checks to ensure safety and reliability.</p>
                    </div>
                    <div class="feature-card">
                        <h3>⭐ Real Reviews</h3>
                        <p>Authentic reviews from verified passengers help you choose the best ride.</p>
                    </div>
                    <div class="feature-card">
                        <h3>📅 Easy Booking</h3>
                        <p>Book a cab in just a few clicks - anytime, anywhere.</p>
                    </div>
                    <div class="feature-card">
                        <h3>💰 Transparent Pricing</h3>
                        <p>No hidden fees or surprise know your fare upfront.</p>
                    </div>
                </div>
            </div>
            <div class="about-image">
                <img src="assets/objects/taxi.jpg" alt="taxi logo" style="width: 100%; border-radius: 8px;" />
            </div>
        </div>
    </section>

    <section id="contact">
        <div class="container contact-content">
            <div class="contact-info">
                <h2>Get in Touch</h2>
                <p>Have questions about our service? Need help booking a cab? Our team is here to assist you with anything you need.</p>
                <div class="contact-details">
                    <div class="contact-item">
                        📌 <span>No 123, Main Street, Colombo 11. Sri Lanka.</span>
                    </div>
                    <div class="contact-item">
                        📧 <span>support@megacitycab.com</span>
                    </div>
                    <div class="contact-item">
                        📞 <span>(+94) 021-222-1234</span>
                    </div>
                </div>
                <p>Business Hours For Enquiry:<br>
                    ○ Monday - Friday: 9:00 AM - 6:00 PM<br>
                    ○ Saturday: 10:00 AM - 4:00 PM<br>
                    ○ Sunday: Closed</p>
                <b>Note: Cab Service available 24/7</b>
            </div>
            <div class="contact-form">
                <form id="contactForm">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name">
                        <div id="nameError" class="error"></div>

                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email">
                        <div id="emailError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject">
                        <div id="subjectError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message"></textarea>
                        <div id="messageError" class="error"></div>
                    </div>
                    <button type="submit" class="submit-button">Send Message</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Toast message -->
    <div class="toast-container" id="toastContainer"></div>
    <!-- End Toast message -->

    <script src="assets/js/index.js"></script>
    <script src="assets/js/toast.js"></script>
</body>
</html>