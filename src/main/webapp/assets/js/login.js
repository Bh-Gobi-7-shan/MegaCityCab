function togglePassword() {
    const passwordInput = document.getElementById("password");
    const showPassText = document.querySelector(".showpass");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        showPassText.textContent = "Hide";
    }
    else {
        passwordInput.type = "password";
        showPassText.textContent = "Show";
    }
}

document.getElementById("loginForm").addEventListener("submit", function(event) {
    let isValid = true;
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const usernameError = document.getElementById("usernameError");
    const passwordError = document.getElementById("passwordError");

    usernameError.textContent = "";
    passwordError.textContent = "";

    const nicRegex = /^\d{9}[vV]$|^\d{12}$/;
    if (username === "") {
        usernameError.textContent = "NIC Number is required.";
        isValid = false;
    }
    else if (!nicRegex.test(username)) {
        usernameError.textContent = "Invalid NIC format.";
        isValid = false;
    }

    if (password === "") {
        passwordError.textContent = "Password is required.";
        isValid = false;
    }
    else if (password.length < 8) {
        passwordError.textContent = "Password must be at least 8 characters long.";
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
    }
});

