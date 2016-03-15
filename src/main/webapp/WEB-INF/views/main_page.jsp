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
</head>
<body>
    <div class="container">
        <h3 id="logo">OpenPi</h3>
        <nav>
            <ul class="nav nav-justified">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="<c:url value="/pizzas" />">Pizzas</a></li>
                <c:if test="${isAuthorized}">
                    <li id="registeredUser"><a href="<c:url value="/user"/>">${userFirstName}</a></li>
                </c:if>
                <c:if test="${!isAuthorized}">
                    <li id="unRegisteredUser"><a href="<c:url value="/login"/>">Log In</a></li>
                </c:if>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <div class="jumbotron">
            <h1 class="offer">Offers</h1>
            <p class="lead">Try the TOP Estonian pizza at our place!</p>
            <c:if test="${!isAuthorized}">
                <p><a class="btn btn-lg btn-success" id="linkRegisterButton" href="<c:url value="/registration"/>" role="button">Registration</a></p>
            </c:if>

        </div>
    </div>
</body>
</html>
