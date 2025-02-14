<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | MegaCityCab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .login-container {
            background: rgb(208, 215, 198);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }
        .login-container h2 {
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
        #passwordError {
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
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #218838;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Welcome Again...</h2>
        <form id="loginForm" action="login" method="POST">
            <div class="input-group">
                <label for="username">NIC Number</label>
                <input type="text" id="username" name="username" placeholder="Enter your NIC Number" maxlength="12">
                <div id="usernameError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" maxlength="20">
                <div class="showpass" onclick="togglePassword()">Show</div>
                <div id="passwordError" class="error"></div>
            </div>

            <div class="remember-me">
                <input type="checkbox" id="rememberMe" name="remember">
                <label for="rememberMe">Remember Me</label>
            </div>

            <button type="submit">Login</button>
            <a href="signup"><h5>If you already haven't Account Click!</h5></a>
        </form>
    </div>

    <script>
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
    </script>

</body>
</html>