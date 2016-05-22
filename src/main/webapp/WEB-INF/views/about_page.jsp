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
                    <h1 id="history" class="page-header">History</h1>
                    <p class="lead">
                        Originally created by a designer and a developer at Twitter,
                        Bootstrap has become one of the most popular front-end frameworks
                        and open source projects in the world.
                    </p>
                    <p class="lead">Bootstrap was created at Twitter in mid-2010 by.
                        Prior to being an open-sourced framework, Bootstrap was known as
                        <em>Twitter Blueprint</em>. A few months into development, Twitter held its
                        and the project exploded as developers of all skill levels jumped in without any external guidance.
                        It served as the style guide for internal tools development at the company for over a year before
                        its public release, and continues to do so today.
                    </p>
                    <p class="lead">Originallytwenty releases
                        including two major rewrites with v2 and v3. With Bootstrap 2,
                        we added responsive functionality to the entire framework as an optional stylesheet.
                        Building on that with Bootstrap 3, we rewrote the library once more to make it responsive
                        by default with a mobile first approach.
                    </p>
                </c:if>
                <c:if test="${!isEstonian}">
                    <h1 id="history" class="page-header">History</h1>
                    <p class="lead">
                        Originally created by a designer and a developer at Twitter,
                        Bootstrap has become one of the most popular front-end frameworks
                        and open source projects in the world.
                    </p>
                    <p>Bootstrap was created at Twitter in mid-2010 by.
                        Prior to being an open-sourced framework, Bootstrap was known as
                        <em>Twitter Blueprint</em>. A few months into development, Twitter held its
                        and the project exploded as developers of all skill levels jumped in without any external guidance.
                        It served as the style guide for internal tools development at the company for over a year before
                        its public release, and continues to do so today.
                    </p>
                    <p>Originallytwenty releases
                        including two major rewrites with v2 and v3. With Bootstrap 2,
                        we added responsive functionality to the entire framework as an optional stylesheet.
                        Building on that with Bootstrap 3, we rewrote the library once more to make it responsive
                        by default with a mobile first approach.
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