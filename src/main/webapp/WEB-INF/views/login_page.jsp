<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
    <title>Login page</title>
    <link href="resources/css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="resources/openpi.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/registrationpage/md5.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h3 id="logo">OpenPi</h3>
    <nav>
        <ul class="nav nav-justified">
            <li><a href="<c:url value="/" />"><c:if test="${isEstonian}">Kodu</c:if> <c:if test="${!isEstonian}">Home</c:if></a></li>
            <li><a href="<c:url value="/pizzas" />"><c:if test="${isEstonian}">Pitsad</c:if> <c:if test="${!isEstonian}">Pizzas</c:if></a></li>
            <li class="active"><a href="<c:url value="/login" />"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            <li><a href="#"><c:if test="${isEstonian}">Meist</c:if> <c:if test="${!isEstonian}">About Us</c:if></a></li>
            <li><a href="#"><c:if test="${isEstonian}">Kontakt</c:if> <c:if test="${!isEstonian}">Contact</c:if></a></li>
        </ul>
    </nav>
    <!-- Container -->
    <div class="container">
        <c:url var="loginUrl" value="/login" />
        <form action="${loginUrl}" method="post" id="loginForm">
            <c:if test="${isEstonian}">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger" role="alert">Vale email või parool!</div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success" role="alert">Te logisite välja!</div>
                </c:if>
                <label for="loginEmail" class="sr-only">Email address</label>
                <input type="text" name="email" class="form-control" id="loginEmail" placeholder="Email" required/>
                <label for="loginPassword" class="sr-only">Password</label>
                <input type="password" name="password" class="form-control" id="loginPassword" placeholder="Parool" required/>
                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                <button type="button" class="btn btn-lg btn-primary btn-block" id="loginButton">Logi Sisse</button>
            </c:if>
            <c:if test="${!isEstonian}">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger" role="alert">Invalid email and password</div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success" role="alert">You have been logged out successfully.</div>
                </c:if>
                <label for="loginEmail" class="sr-only">Email address</label>
                <input type="text" name="email" class="form-control" id="loginEmail" placeholder="Email address" required/>
                <label for="loginPassword" class="sr-only">Password</label>
                <input type="password" name="password" class="form-control" id="loginPassword" placeholder="Password" required/>
                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                <button type="button" class="btn btn-lg btn-primary btn-block" id="loginButton">Log In</button>

            </c:if>


        </form>
    </div>
</div>
<!-- Site footer -->
<!--<footer class="footer">
    <p>&copy; 2016 OpenPi, Tartu</p>
</footer>-->
<!-- /container -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
<script src="resources/loginpage/login.js"></script>
</body>
</html>