function validateOtpForm() {
    const otp = document.getElementById('otp').value.trim();
    const otpRegex = /^\d{6}$/;
    const otpError = document.getElementById('otpError');
    otpError.innerHTML = '';

    if (!otpRegex.test(otp)) {
        otpError.innerHTML = "Please enter a valid 6-digit verification code";
        return false;
    }
    return true;
}

// Auto format OTP input
document.getElementById('otp').addEventListener('input', function(e) {
    this.value = this.value.replace(/[^0-9]/g, '');
});