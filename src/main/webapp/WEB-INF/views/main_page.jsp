<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>OpenPi Pizza Service!</title>
    <!-- Bootstrap Core -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/openpi.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId      : '1761793507390965',
                xfbml      : true,
                version    : 'v2.5'
            });

            // ADD ADDITIONAL FACEBOOK CODE HERE
        };

        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</head>
<body>
<div class="container">
    <h3 id="logo">OpenPi</h3>
    <nav>
        <ul class="nav nav-justified">
            <li class="active"><a href="#"><c:if test="${isEstonian}">Kodu</c:if> <c:if test="${!isEstonian}">Home</c:if></a></li>
            <li><a href="<c:url value="/pizzas" />"><c:if test="${isEstonian}">Pitsad</c:if> <c:if test="${!isEstonian}">Pizzas</c:if></a></li>
            <c:if test="${isAuthorized}">
                <li id="registeredUser"><a href="<c:url value="/user"/>">${userFirstName}</a></li>
            </c:if>
            <c:if test="${!isAuthorized}">
                <li id="unRegisteredUser"><a href="<c:url value="/login"/>"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            </c:if>
            <li><a href="#"><c:if test="${isEstonian}">Meist</c:if> <c:if test="${!isEstonian}">About Us</c:if></a></li>
            <li><a href="#"><c:if test="${isEstonian}">Kontakt</c:if> <c:if test="${!isEstonian}">Contact</c:if></a></li>
        </ul>
    </nav>
    <div class="jumbotron">
        <h1 class="offer">
            <c:if test="${isEstonian}">Pakkumised</c:if>
            <c:if test="${!isEstonian}">Offers</c:if>
        </h1>
        <p class="lead"><c:if test="${isEstonian}">Proovi Eesti parimat pitsat meiega!</c:if> <c:if test="${!isEstonian}">Try the TOP Estonian pizza at our place!</c:if></p>
        <c:if test="${!isAuthorized}">
            <p><a class="btn btn-lg btn-success" id="linkRegisterButton" href="<c:url value="/registration"/>" role="button">
                <c:if test="${isEstonian}">Registreerumine</c:if>
                <c:if test="${!isEstonian}">Registration</c:if>
            </a></p>
        </c:if>

    </div>
    <div class="language">
        <form method="post">
            <c:if test="${!isEstonian}"><button name="string" value="estonian" class="btn btn-lg btn-warning" type="submit">EE</button></c:if>
            <c:if test="${isEstonian}"><button name="string" value="english" class="btn btn-lg btn-warning" type="submit">EN</button></c:if>
        </form>
    </div>
</div>
</body>
</html>
