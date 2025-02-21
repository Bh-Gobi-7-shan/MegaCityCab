// Handle form submission
document.getElementById("contactForm").addEventListener("submit", function(event) {
    let isValid = true;

    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const subject = document.getElementById("subject").value.trim();
    const message = document.getElementById("message").value.trim();

    const nameError = document.getElementById("nameError");
    const emailError = document.getElementById("emailError");
    const subjectError = document.getElementById("subjectError");
    const messageError = document.getElementById("messageError");


    nameError.textContent = "";
    emailError.textContent = "";
    subjectError.textContent = "";
    messageError.textContent = "";

    // Name validation (Required, minimum 3 characters)
    if (name === "") {
        nameError.textContent = "Name is required.";
        isValid = false;
    }
    else if (name.length < 3) {
        nameError.textContent = "Name must be at least 3 characters long.";
        isValid = false;
    }


    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        emailError.textContent = "Email is required.";
        isValid = false;
    }
    else if (!emailRegex.test(email)) {
        emailError.textContent = "Invalid email format.";
        isValid = false;
    }


    if (subject === "") {
        subjectError.textContent = "Subject is required.";
        isValid = false;
    }
    else if (subject.length < 5) {
        subjectError.textContent = "Subject must be at least 5 characters long.";
        isValid = false;
    }


    if (message === "") {
        messageError.textContent = "Message is required.";
        isValid = false;
    }
    else if (message.length < 10) {
        messageError.textContent = "Message must be at least 10 characters long.";
        isValid = false;
    }
     if (!isValid) {
        event.preventDefault();
     }

    // Send data and receive response
    if (isValid) {
        event.preventDefault();
        const formData = {
            name: name,
            email: email,
            subject: subject,
            message: message
        };

        fetch('/MegaCityCab/index', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => {
            if (!response.ok) {
                console.error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data.status === "success") {
                showToast("Question Submission Successfully", "success");
                document.getElementById("contactForm").reset();
            }
            else {
                showToast("Question Submission failed!", "error");
            }
        })
        .catch(error => {
            console.error('Error submitting form:', error);
        });
    }
});


// Mobile menu functionality
const menuToggle = document.querySelector('.menu-toggle');
const mobileNav = document.querySelector('.mobile-nav');

menuToggle.addEventListener('click', () => {
    menuToggle.classList.toggle('active');
    mobileNav.classList.toggle('active');
    document.body.style.overflow = mobileNav.classList.contains('active') ? 'hidden' : 'auto';
});

// Close mobile menu when clicking a link
document.querySelectorAll('.mobile-nav a').forEach(link => {
    link.addEventListener('click', () => {
        menuToggle.classList.remove('active');
        mobileNav.classList.remove('active');
        document.body.style.overflow = 'auto';
    });
});

// Close mobile menu when clicking outside
document.addEventListener('click', (e) => {
    if (mobileNav.classList.contains('active') &&
        !mobileNav.contains(e.target) &&
        !menuToggle.contains(e.target)) {
        menuToggle.classList.remove('active');
        mobileNav.classList.remove('active');
        document.body.style.overflow = 'auto';
    }
});

// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const navHeight = document.querySelector('nav').offsetHeight;
            const targetPosition = target.getBoundingClientRect().top + window.pageYOffset - navHeight;
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Slideshow functionality
let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.getElementsByClassName("slideshow-slide");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}
    slides[slideIndex-1].style.display = "block";
    setTimeout(showSlides, 8000); // Change image every 8 seconds
}

function changeSlide(n) {
    slideIndex += n - 1;
    showSlides();
}