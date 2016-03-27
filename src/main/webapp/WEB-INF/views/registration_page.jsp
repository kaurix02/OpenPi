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
    <title>OpenPi Pizza Service!</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/openpi.css" rel="stylesheet">
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
            <li><a href="<c:url value="/login" />"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            <li><a href="#"><c:if test="${isEstonian}">Meist</c:if> <c:if test="${!isEstonian}">About Us</c:if></a></li>
            <li><a href="#"><c:if test="${isEstonian}">Kontakt</c:if> <c:if test="${!isEstonian}">Contact</c:if></a></li>
        </ul>
    </nav>
    <!-- Container -->
    <div class="container">
        <form:form method="post" modelAttribute="user" id="registrationForm">
            <c:if test="${isEstonian}">
                <h2 id="registration">Registreerumine</h2>
                <c:if test="${param.unique != null}">
                    <div class="alert alert-danger regalert1" role="alert">Email on juba kasutusel</div>
                </c:if>
                <c:if test="${param.success != null}">
                    <div class="alert alert-success regalert1" role="alert">Edukas Registreerumine!</div>
                </c:if>
                <label for="inputFirstName" class="form-control">First Name</label>
                <form:input type="text" class="form-control" id="inputFirstName" placeholder="Eesnimi" path="firstName"/>
                <div class="alert alert-danger regalert" id="invalidFirstName" role="alert">Vale Eesnimi!</div>
                <label for="inputLastName" class="form-control">Last Name</label>
                <form:input type="text" class="form-control" id="inputLastName" placeholder="Perenimi" path="lastName"/>
                <div class="alert alert-danger regalert" id="invalidLastName" role="alert">Vale Perenimi!</div>
                <label for="inputEmail" class="form-control">E-mail</label>
                <form:input type="text" class="form-control" id="inputEmail" placeholder="Email" path="email"/>
                <div class="alert alert-danger regalert" id="invalidEmail" role="alert">Vale Email!</div>
                <label for="inputPassword" class="form-control">Password</label>
                <form:input type="password" class="form-control" id="inputPassword" placeholder="Parool" path="password"/>
                <div class="alert alert-danger regalert" id="invalidPassword" role="alert">Vale Parool!</div>
                <label for="inputConfirmPassword" class="form-control">Confirm Password</label>
                <input type="password" class="form-control" id="inputConfirmPassword" placeholder="Nõustuv Parool"/>
                <div class="alert alert-danger regalert" id="invalidConfirmPassword" role="alert">Paroolid peavad olema samad!</div>
                <button type="button" class="btn btn-lg btn-primary btn-block" id="registrationButton">Registreeri</button>
            </c:if>
            <c:if test="${!isEstonian}">
                <h2 id="registration">Registration</h2>
                <c:if test="${param.unique != null}">
                    <div class="alert alert-danger regalert1" role="alert">This email is already in use</div>
                </c:if>
                <c:if test="${param.success != null}">
                    <div class="alert alert-success regalert1" role="alert">Success!</div>
                </c:if>
                <label for="inputFirstName" class="form-control">First Name</label>
                <form:input type="text" class="form-control" id="inputFirstName" placeholder="First Name" path="firstName"/>
                <div class="alert alert-danger regalert" id="invalidFirstName" role="alert">Invalid First Name!</div>
                <label for="inputLastName" class="form-control">Last Name</label>
                <form:input type="text" class="form-control" id="inputLastName" placeholder="Last Name" path="lastName"/>
                <div class="alert alert-danger regalert" id="invalidLastName" role="alert">Invalid Last Name!</div>
                <label for="inputEmail" class="form-control">E-mail</label>
                <form:input type="text" class="form-control" id="inputEmail" placeholder="Email address" path="email"/>
                <div class="alert alert-danger regalert" id="invalidEmail" role="alert">Invalid Email!</div>
                <label for="inputPassword" class="form-control">Password</label>
                <form:input type="password" class="form-control" id="inputPassword" placeholder="Password" path="password"/>
                <div class="alert alert-danger regalert" id="invalidPassword" role="alert">Invalid Password!</div>
                <label for="inputConfirmPassword" class="form-control">Confirm Password</label>
                <input type="password" class="form-control" id="inputConfirmPassword" placeholder="Confirm Password"/>
                <div class="alert alert-danger regalert" id="invalidConfirmPassword" role="alert">Passwords must match!</div>
                <button type="button" class="btn btn-lg btn-primary btn-block" id="registrationButton">Register</button>
            </c:if>

        </form:form>
    </div>
</div> <!-- /container -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
<script src="resources/registrationpage/registration.js"></script>
</body>
</html>