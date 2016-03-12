var element = document.getElementById("registrationButton");
element.addEventListener("click", function(event) {
    var inputPassword = document.getElementById("inputPassword");
    if (inputPassword.value.length != 0 && (inputPassword.value == document.getElementById("inputConfirmPassword").value)) {
        inputPassword.value = calcMD5(inputPassword.value);
        document.getElementById("registrationForm").submit();
    }
});
/*var nodeList = document.getElementsByClassName("align-right");
for (i = 0; i < nodeList.length; i++) {
    nodeList[i].style.visibility = "hidden";
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
        document.getElementById("alertFirstName").innerHTML = "Between 2 and 100 characters long";
        document.getElementById("alertFirstName").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("alertFirstName").style.visibility = "hidden";
    }

    if (inputLastName.value.length < 2 || inputLastName.value.length > 100){
        document.getElementById("alertLastName").innerHTML = "Between 2 and 100 characters long";
        document.getElementById("alertLastName").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("alertLastName").style.visibility = "hidden";
    }

    if (inputEmail.value.length < 5 || inputEmail.value.length > 100) {
        document.getElementById("alertEmail").innerHTML = "Wrong Email!";
        document.getElementById("alertEmail").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("alertEmail").style.visibility = "hidden";
    }

    if (inputPassword.value.length < 8 || inputPassword.value.length > 30) {
        document.getElementById("alertPassword").innerHTML = "Between 8 and 30 characters long";
        document.getElementById("alertPassword").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("alertPassword").style.visibility = "hidden";
    }

    if((inputPassword.value != inputConfirmPassword.value)&&inputPassword.value.length != 0) {
        document.getElementById("alertConfirmPassword").innerHTML = "Passwords must match!";
        document.getElementById("alertConfirmPassword").style.visibility = "visible";
        temp &= false;
    } else {
        document.getElementById("alertConfirmPassword").style.visibility = "hidden";
    }

    if(temp) {
        inputPassword.value = calcMD5(inputPassword.value);
        document.getElementById("formRegistration").submit();
    }

});*/


