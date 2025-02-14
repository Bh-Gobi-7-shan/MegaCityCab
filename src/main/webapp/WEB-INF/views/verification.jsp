<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification | MegaCityCab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .modal {
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 30px;
            border: 1px solid #888;
            width: 100%;
            max-width: 450px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
            width: 100%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
        }

        .error {
            color: red;
            font-size: 15px;
            text-align: left;
            margin-top: 5px;
        }


        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border-radius: 15px;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }


        @media (max-width: 768px) {
            .modal-content {
                width: 80%;
                max-width: 350px;
            }

            .input-group input {
                font-size: 14px;
                padding: 8px;
            }

            button {
                font-size: 14px;
                padding: 12px;
            }

            .error {
                font-size: 10px;
            }
        }

        @media (max-width: 480px) {
            .modal-content {
                width: 90%;
                max-width: 280px;
            }

            .input-group input {
                font-size: 14px;
                padding: 6px;
            }

            button {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div id="otpModal" class="modal">
        <div class="modal-content">
            <h2>OTP Verification</h2>
            <form action="verification" method="post" id="otpForm" onsubmit="return validateOtpForm()">
                <div class="input-group">
                    <label for="otp">Enter OTP</label>
                    <input type="text" id="otp" name="otp" required maxlength="6" placeholder="Enter the 6-digit OTP" />
                    <div class="error" id="otpError"></div>
                </div>
                <button type="submit">Verify OTP</button>
            </form>
            <p style="text-align: center;">Didn't receive the OTP? <a href="resendOtp.jsp">Resend OTP</a></p>
        </div>
    </div>

    <script>
        function validateOtpForm() {
            const otp = document.getElementById('otp').value.trim();
            const otpRegex = /^\d{6}$/;
            const otpError = document.getElementById('otpError');
            otpError.innerHTML = '';
            if (!otpRegex.test(otp)) {
                otpError.innerHTML = "Please enter a valid 6-digit OTP.";
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
