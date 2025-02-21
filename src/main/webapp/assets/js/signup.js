function togglePassword() {
    const passwordInput = document.getElementById("password");
    const showPassText = document.querySelector(".showpass.password");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        showPassText.textContent = "Hide";
    }
    else {
        passwordInput.type = "password";
        showPassText.textContent = "Show";
    }
}

function toggleConfirmPassword() {
    const confirmPasswordInput = document.getElementById("confirmPassword");
    const showPassText = document.querySelector(".showpass.confirmPassword");

    if (confirmPasswordInput.type === "password") {
        confirmPasswordInput.type = "text";
        showPassText.textContent = "Hide";
    }
    else {
        confirmPasswordInput.type = "password";
        showPassText.textContent = "Show";
    }
}

document.getElementById("signupForm").addEventListener("submit", function(event) {
    let isValid = true;
    const verificationStatus = '<%= request.getAttribute("release") %>';

    const firstNameError = document.getElementById("firstNameError");
    const lastNameError = document.getElementById("lastNameError");
    const nicNumberError = document.getElementById("nicNumberError");
    const phonenumberError = document.getElementById("phonenumberError");
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById("confirmPasswordError");

    firstNameError.textContent = "";
    lastNameError.textContent = "";
    nicNumberError.textContent = "";
    phonenumberError.textContent = "";
    passwordError.textContent = "";
    confirmPasswordError.textContent = "";

    const firstName = document.getElementById("firstName").value.trim();
    const lastName = document.getElementById("lastName").value.trim();
    const nicNumber = document.getElementById("nicNumber").value.trim();
    const phonenumber = document.getElementById("phonenumber").value.trim();
    const gender = document.querySelector('input[name="gender"]:checked');
    const password = document.getElementById("password").value.trim();
    const confirmPassword = document.getElementById("confirmPassword").value.trim();

    if (firstName === "") {
        firstNameError.textContent = "First name is required.";
        isValid = false;
    }

    if (lastName === "") {
        lastNameError.textContent = "Last name is required.";
        isValid = false;
    }

    if (nicNumber === "") {
        nicNumberError.textContent = "NIC number is required.";
        isValid = false;
    }
    else if (nicNumber.toLowerCase().endsWith('v') && nicNumber.length !== 10) {
        nicNumberError.textContent = "NIC number should be 10 characters including 'v'.";
        isValid = false;
    }
    else if (!nicNumber.toLowerCase().startsWith('v') && nicNumber.length !== 12) {
        nicNumberError.textContent = "NIC number should be exactly 12 digits.";
        isValid = false;
    }
    else if (!/^\d{11}$/.test(nicNumber.substring(1)) && !/^\d{12}$/.test(nicNumber)) {
        nicNumberError.textContent = "NIC number should contain only numeric characters.";
        isValid = false;
    }

    if (phonenumber === "") {
        phonenumberError.textContent = "Phone number is required.";
        isValid = false;
    }
    else if (phonenumber.length !== 10 || !/^\d{10}$/.test(phonenumber)) {
        phonenumberError.textContent = "Phone number should be exactly 10 digits.";
        isValid = false;
    }

    if (!gender) {
        document.getElementById("genderError").textContent = "Gender selection is required.";
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

    if (confirmPassword !== password) {
        confirmPasswordError.textContent = "Passwords do not match.";
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
    }
});