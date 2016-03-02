<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OpenPi Pizza Service!</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/registrationpage/registration.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <form:form cssClass="form-registration" method="POST" modelAttribute="user" id="formRegistration">
            <form:input type="hidden" path="id" id="id"/>
            <h2 class="form-registration-heading">Registration</h2>

            <label for="inputFirstName" class="sr-only">First Name</label>
            <form:input type="text" id="inputFirstName" class="form-control align-left" placeholder="First Name" path="firstName"/>
            <div class="alert alert-danger align-right" role="alert" id="alertFirstName">...</div>

            <label for="inputLastName" class="sr-only">Last Name</label>
            <form:input type="text" id="inputLastName" class="form-control align-left" placeholder="Last Name" path="lastName"/>
            <div class="alert alert-danger align-right" role="alert" id="alertLastName">...</div>

            <label for="inputEmail" class="sr-only">Email address</label>
            <form:input type="email" id="inputEmail" class="form-control align-left" placeholder="Email address" path="email"/>
            <div class="alert alert-danger align-right" role="alert" id="alertEmail">...</div>

            <label for="inputPassword" class="sr-only">Password</label>
            <form:input type="password" id="inputPassword" class="form-control align-left" placeholder="Password" path="password"/>
            <div class="alert alert-danger align-right" role="alert" id="alertPassword">...</div>

            <label for="inputConfirmPassword" class="sr-only">Confirm Password</label>
            <input type="password" id="inputConfirmPassword" class="form-control align-left" placeholder="Confirm Password"/>
            <div class="alert alert-danger align-right" role="alert" id="alertConfirmPassword">...</div>

            <button class="btn btn-lg btn-primary btn-block align-left" type="button" id="registrationButton">Register</button>
        </form:form>
    </div>
    <script src="resources/registrationpage/registration.js"></script>
</body>
</html>
