<%@ page contentType = "text/html; charset = UTF-8"  language = "java" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup | MegaCityCab</title>
    <link rel="stylesheet" href="assets/css/signup.css">
</head>
<body>
    <div class="signup-container">
        <h2>Create Account</h2>
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
                <label><strong>Gender:</strong></label>
                <div>
                    <input type="radio" id="male" name="gender" value="male">
                    <label for="male">Male</label>
                </div>
                <div>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female">Female</label>
                </div>
            </div>
            <div id="genderError" class="error"></div>

            <div class="input-group">
                <label for="password">Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password" name="password" placeholder="Enter your password" maxlength="20">
                    <div class="showpass password" onclick="togglePassword()">Show</div>
                </div>
                <div id="passwordError" class="error"></div>
            </div>

            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <div class="password-wrapper">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" maxlength="20">
                    <div class="showpass confirmPassword" onclick="toggleConfirmPassword()">Show</div>
                </div>
                <div id="confirmPasswordError" class="error"></div>
            </div>

            <button type="submit">Sign Up</button>
        </form>
        <div class="login-link">
            Already have an account? <a href="login.html">Login</a>
        </div>
    </div>

    <script src="assets/js/signup.js"></script>
</body>
</html>