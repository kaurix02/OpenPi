var element = document.getElementById("loginButton");
element.addEventListener("click", function(event) {
    var temp = document.getElementById("loginPassword").value
    document.getElementById("loginPassword").value = calcMD5(temp);
    document.getElementById("loginForm").submit();
});


$('[data-toggle="tooltip"]').tooltip();