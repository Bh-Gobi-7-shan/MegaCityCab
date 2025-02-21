<%@ page contentType = "text/html; charset = UTF-8"  language = "java" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification | MegaCityCab</title>

    <link rel="stylesheet" href="assets/css/verification.css">
    <link rel="stylesheet" href="assets/css/toast.css">

</head>

<body>
    <div id="otpModal" class="modal">
        <div class="modal-content">
            <div class="logo-container">
                <div class="logo">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>
                <h2>OTP Verification</h2>
                <p class="subtitle">Please enter the verification code sent to your device</p>
            </div>

            <form action="verification" method="post" id="otpForm" onsubmit="return validateOtpForm()">
                <div class="input-group">
                    <label for="otp">Verification Code</label>
                    <input
                        type="text"
                        id="otp"
                        name="otp"
                        maxlength="6"
                        placeholder="Enter 6-digit code"
                        autocomplete="one-time-code"
                    />
                    <div class="error" id="otpError"></div>
                </div>
                <button type="submit">Verify Code</button>
            </form>

            <div class="resend-link">
                Didn't receive the code? <a href="resend">Resend Code</a>
            </div>
        </div>
    </div>

    <!-- Toast message -->
            <div class="toast-container" id="toastContainer"></div>
    <!-- End Toast message -->

    <script src="assets/js/verification.js"></script>
    <script src="assets/js/toast.js"></script>

    <!-- Error Toast message handled by jsp -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
            <script>
                showToast("<%= error %>", "error");
            </script>

        <% }
    %>

    <!-- OTP resend handled by jsp -->
        <%
            String message = (String) request.getAttribute("message");
            String type = (String) request.getAttribute("type");
            if (message != null && type != null) {
        %>
                <script>
                    showToast("<%= message %>", "<%= type %>");
                </script>

            <% }
        %>
</body>
</html>