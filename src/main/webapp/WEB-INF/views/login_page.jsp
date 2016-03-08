<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login page</title>
    <link href="resources/css/bootstrap.css"  rel="stylesheet"/>
    <link href="resources/loginpage/login.css" rel="stylesheet"/>
    <link href="resources/mainpage/main.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
    <script src="resources/registrationpage/md5.js"></script>
</head>
<body>
    <div class="container">
        <div class="masthead">
            <h3 class="text-muted">OpenPi</h3>
            <nav>
                <ul class="nav nav-justified">
                    <li><a href="<c:url value="/" />">Home</a></li>
                    <li><a href="<c:url value="/pizzas" />">Pizzas</a></li>
                    <li class="active"><a href="<c:url value="/login" />">Log In</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
        <!-- Container -->
        <div class="container" id="divLogin">
            <c:url var="loginUrl" value="/login" />
            <form action="${loginUrl}" method="post" class="form-login" id="formLogIn">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger" role="alert" id="alertInvalid">Invalid username and password</div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success" role="alert" id="alertSuccess">You have been logged out successfully.</div>
                </c:if>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required/>

                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" path="password" required/>

                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                <button class="btn btn-lg btn-primary btn-block" type="button" id="buttonLogIn">Log In</button>
            </form>
        </div>
        <!-- Site footer -->
        <footer class="footer">
            <p>&copy; 2016 OpenPi, Tartu</p>
        </footer>
    </div> <!-- /container -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
    <script src="resources/loginpage/login.js"></script>
</html>
