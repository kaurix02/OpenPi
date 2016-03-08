var element = document.getElementById("buttonLogIn");
element.addEventListener("click", function(event) {
    document.getElementById("inputPassword").value = calcMD5(document.getElementById("inputPassword").value);
    document.getElementById("formLogIn").submit();
});
