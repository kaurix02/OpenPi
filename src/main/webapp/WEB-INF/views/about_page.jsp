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
    <title>About us</title>
    <link href="<c:url value="/" />resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/" />resources/openpi.css" rel="stylesheet">
    <script async src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script async src="<c:url value="/" />resources/js/bootstrap.min.js"></script>
    <script async src="<c:url value="/" />resources/registrationpage/md5.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script async src="<c:url value="/" />resources/js/fb_pizza.js"></script>
</head>
<body>
<div class="container">
    <h3 id="logo">OpenPi</h3>
    <nav>
        <ul class="nav nav-justified">
            <li><a href="<c:url value="/" />"><c:if test="${isEstonian}">Kodu</c:if> <c:if test="${!isEstonian}">Home</c:if></a></li>
            <li><a href="<c:url value="/pizzas" />"><c:if test="${isEstonian}">Pitsad</c:if> <c:if test="${!isEstonian}">Pizzas</c:if></a></li>
            <c:if test="${isAuthorized}">
                <li id="registeredUser" class="dropdown">
                    <a href="#" class="disabled">
                            ${userFirstName} <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value="/user"/>"><c:if test="${isEstonian}">Kasutaja</c:if> <c:if test="${!isEstonian}">User</c:if></a></li>
                        <li><a href="<c:url value="/logout"/>"><c:if test="${isEstonian}">Logi välja</c:if> <c:if test="${!isEstonian}">Logout</c:if></a></li>
                    </ul>
                    <!--<a href="<c:url value="/user"/>">
                        ${userFirstName}
                    </a>-->
                </li>
            </c:if>
            <c:if test="${!isAuthorized}">
                <li id="unRegisteredUser"><a href="<c:url value="/login"/>"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            </c:if>
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
                    <h1 id="history" class="page-header">Veebilehest</h1>
                    <p class="lead">
                        Kursuse 'Veebirakenduste loomine' raames tehtud projekt. Autorid: Alan Durnev, Kaur Karus, Anna Laaneväli.
                    </p>
                </c:if>
                <c:if test="${!isEstonian}">
                    <h1 id="history" class="page-header">About Website</h1>
                    <p class="lead">
                        A webpage created for the course 'Web Application Development'. Authors: Alan Durnev, Anna Laaneväli, Kaur Karus.
                    </p>
                </c:if>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
<script async src="<c:url value="/" />resources/registrationpage/registration.js"></script>
</body>
</html>