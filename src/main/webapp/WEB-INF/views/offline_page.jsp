<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OpenPi Offline</title>
    <link href="<c:url value="/" />resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/" />resources/openpi.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<c:url value="/" />resources/js/bootstrap.min.js"></script>
    <script src="<c:url value="/" />resources/registrationpage/md5.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/" />resources/js/fb_pizza.js"></script>
</head>
<body>
<div class="container">
    <h3 id="logo">OpenPi</h3>
    <nav>
        <ul class="nav nav-justified">
            <li><a href="<c:url value="/" />"><c:if test="${isEstonian}">Kodu</c:if> <c:if test="${!isEstonian}">Home</c:if></a></li>
            <li><a href="<c:url value="/pizzas" />"><c:if test="${isEstonian}">Pitsad</c:if> <c:if test="${!isEstonian}">Pizzas</c:if></a></li>
            <li><a href="<c:url value="/login" />"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            <li><a href="<c:url value="/about" />"><c:if test="${isEstonian}">Meist</c:if> <c:if test="${!isEstonian}">About Us</c:if></a></li>
            <li><a href="<c:url value="/contact" />"><c:if test="${isEstonian}">Kontakt</c:if> <c:if test="${!isEstonian}">Contact</c:if></a></li>
            <li><a href="<c:url value="/funpizzafacts" />"><c:if test="${isEstonian}">Pitsa Faktid</c:if> <c:if test="${!isEstonian}">Fun Pizza Facts</c:if></a></li>
        </ul>
    </nav>
    <!-- Container -->
    <div class="container">
        <div class="col-md-9" role="main">
            <div class="bs-docs-section">
                <c:if test="${isEstonian}">
                    <h1 id="history" class="page-header">Võrguühenduse probleem</h1>
                    <p class="lead">
                        Kahjuks kaotasime Teiega ühenduse. Kontrollige, kas Teil on ühendus
                        Internetiga ning proovige uuesti!
                    </p>
                </c:if>
                <c:if test="${!isEstonian}">
                    <h1 id="history" class="page-header">Network problem</h1>
                    <p class="lead">
                        Unfortunately we have lost a connection with you. Please make sure
                        that you are connected to the Internet and try again.
                    </p>
                </c:if>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
<script src="<c:url value="/" />resources/registrationpage/registration.js"></script>
</body>
</html>