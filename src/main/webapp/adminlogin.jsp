<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | MegaCityCab</title>
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
    <div class="login-container">
        <h2>Welcome Admin</h2>
        <form id="loginForm">
            <div class="input-group">
                <label for="username">NIC Number</label>
                <input type="text" id="username" name="username" placeholder="Enter your NIC Number" maxlength="12">
                <div id="usernameError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" placeholder="Enter your password" maxlength="20">
                    <button type="button" class="showpass" onclick="togglePassword()">Show</button>
                </div>
                <div id="passwordError" class="error"></div>
            </div>

            <div class="remember-me">
                <input type="checkbox" id="rememberMe" name="remember">
                <label for="rememberMe">Remember Me</label>
            </div>

            <button type="submit">Login</button>
        </form>
    </div>

    <script src="assets/js/login.js"></script>
</body>
</html>