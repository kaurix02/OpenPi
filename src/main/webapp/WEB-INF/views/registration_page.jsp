<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
                <li><a href="<c:url value="/" />">Home</a></li>
                <li><a href="<c:url value="/pizzas" />">Pizzas</a></li>
                <li><a href="<c:url value="/login" />">Log In</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <!-- Container -->
        <div class="container">
            <form:form method="post" modelAttribute="user" id="registrationForm">
                <h2 id="registration">Registration</h2>
                <c:if test="${param.unique != null}">
                    <div class="alert alert-danger" role="alert">This email is already in use</div>
                </c:if>
                <c:if test="${param.success != null}">
                    <div class="alert alert-success" role="alert">Success!</div>
                </c:if>
                <form:input type="text" class="form-control" placeholder="First Name" path="firstName"/>
                <form:input type="text" class="form-control" placeholder="Last Name" path="lastName"/>
                <form:input type="text" class="form-control" placeholder="Email address" path="email"/>
                <form:input type="password" class="form-control" id="inputPassword" placeholder="Password" path="password"/>
                <input type="password" class="form-control" id="inputConfirmPassword" placeholder="Confirm Password"/>
                <button type="button" class="btn btn-lg btn-primary btn-block" id="registrationButton">Register</button>
            </form:form>
        </div>
    </div> <!-- /container -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
    <script src="resources/registrationpage/registration.js"></script>
</body>
</html>
