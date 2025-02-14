<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup | MegaCityCab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100hv;
            background-color: #f4f4f4;
            margin: 0;
        }
        .signup-container {
            background: rgb(208, 215, 198);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 10px;
            margin-right: 10px;
            max-width: 500px;
            text-align: center;
        }
        .signup-container h2 {
            margin-bottom: 20px;
        }
        .input-group {
            width: 100%;
            text-align: left;
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group input {
            width: calc(100% - 20px);
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 10px;
        }
        .error {
            color: red;
            font-size: 12px;
            text-align: left;
            margin-top: 5px;
        }
        #genderError{
            color: red;
            font-size: 12px;
            text-align: left;
            margin-bottom: 10px;
        }
        #passwordError{
            color: red;
            font-size: 12px;
            text-align: left;
            margin-top: 18px;
        }
        #confirmPasswordError{
            color: red;
            font-size: 12px;
            text-align: left;
            margin-top: 18px;
        }
        .remember-me {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            font-size: 14px;
            margin-bottom: 15px;
        }
        .remember-me input {
            margin-right: 8px;
        }
        .showpass {
            margin-top: -29px;
            margin-right: 5px;
            margin-left: 8px;
            text-align: right;
            font-size: 14px;
            cursor: pointer;
            color: #ff002b;
        }
        .signup-container button {
            margin-top: 10px;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .signup-container button:hover {
            background-color: #218838;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .signup-container {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <h2>Fill the Details...</h2>
        <form id="signupForm" action="signup" method="POST">
            <div class="input-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" maxlength="50">
                <div id="firstNameError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" maxlength="50">
                <div id="lastNameError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="nicNumber">NIC Number</label>
                <input type="text" id="nicNumber" name="nicNumber" placeholder="Enter your NIC number" maxlength="12">
                <div id="nicNumberError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="phonenumber">Phone number</label>
                <input type="text" id="phonenumber" name="phonenumber" placeholder="Enter your mobile number" maxlength="10">
                <div id="phonenumberError" class="error"></div>
            </div>

            <div class="remember-me">
                <label for="gender" style="margin: 3px; font-size: 14px;"><strong>Gender:</strong></label><br>
                <input type="radio" id="male" name="gender" value="male">
                <label for="male">Male</label><br>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Female</label><br>
            </div>
            <div id="genderError" class="error"></div>


            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" maxlength="20">
                <div class="showpass password" onclick="togglePassword()"> Show </div>
                <div id="passwordError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" maxlength="20">
                <div class="showpass confirmPassword" onclick="toggleConfirmPassword()"> Show </div>
                <div id="confirmPasswordError" class="error"></div>
            </div>

            <button id ="Signup" type="submit">Sign Up</button>
        </form>
    </div>

    <script>
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
    </script>

</body>
</html>