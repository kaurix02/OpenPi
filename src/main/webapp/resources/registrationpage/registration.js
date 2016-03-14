var alerts = document.getElementsByClassName("regalert");
for (i = 0; i < alerts.length; i++) {
    alerts[i].style.visibility = "hidden";
}
var element = document.getElementById("registrationButton");
element.addEventListener("click", function(event) {
    var inputFirstName = document.getElementById("inputFirstName");
    var inputLastName = document.getElementById("inputLastName");
    var inputEmail = document.getElementById("inputEmail");
    var inputPassword = document.getElementById("inputPassword");
    var inputConfirmPassword = document.getElementById("inputConfirmPassword");

    var temp = true;

    if (inputFirstName.value.length < 2 || inputFirstName.value.length > 100){
        document.getElementById("invalidFirstName").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("invalidFirstName").style.visibility = "hidden";
    }

    if (inputLastName.value.length < 2 || inputLastName.value.length > 100){
        document.getElementById("invalidLastName").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("invalidLastName").style.visibility = "hidden";
    }

    if (inputPassword.value.length < 8) {
        document.getElementById("invalidPassword").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("invalidPassword").style.visibility = "hidden";
    }

    if (inputPassword.value == inputConfirmPassword.value) {
        document.getElementById("invalidConfirmPassword").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("invalidConfirmPassword").style.visibility = "hidden";
    }

    if (temp) {
        inputPassword.value = calcMD5(inputPassword.value);
        document.getElementById("registrationForm").submit();
    }
});