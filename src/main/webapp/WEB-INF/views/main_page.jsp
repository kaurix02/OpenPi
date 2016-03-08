<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OpenPi Pizza Service!</title>
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/mainpage/main.css" rel="stylesheet">
    <!-- Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <div class="masthead">
            <h3 class="text-muted">OpenPi</h3>
            <!--<c:if test="${isAuthorized}">
                <h1 class="text-muted" id="h3UserWelcome">Welcome, ${welcome} !</h1>
            </c:if> -->
            <nav>
                <ul class="nav nav-justified">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="<c:url value="/pizzas" />">Pizzas</a></li>
                    <c:if test="${isAuthorized}">
                        <li class="dropdown" id="liUserMenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${firstName}<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<c:url value="/user" />">Account</a></li>
                                <li><a href="<c:url value="/logout"/>">Logout</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${!isAuthorized}">
                        <li id="liLogIn"><a href="<c:url value="/login" />">Log In</a></li>
                    </c:if>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1 class="offer">Hot offers!</h1>
            <p class="lead">Try the TOP Estonian pizza at our place!</p>
            <p><a class="btn btn-lg btn-success" href="<c:url value="/registration"/>" role="button">Registration</a></p>
        </div>
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-xs-6">
                <h2>Try making Your own pizza!</h2>
                <p class="lead">You will accidentally become the greatest chef in the world and will be responsible for cooking for the Gods!</p>
                <p><a class="btn btn-primary" href="#" role="button">Become the Chef!</a></p>
            </div>
            <div class="col-xs-6">
                <h2>Explore The Menu</h2>
                <p class="lead">Explore hundreds of well cooked pizzas and choose the right one for You!</p>
                <p><a class="btn btn-primary" href="#" role="button">The Chosen One!</a></p>
            </div>
        </div>
        <!-- Site footer -->
        <footer class="footer">
            <p>&copy; 2016 OpenPi, Tartu</p>
        </footer>
    </div> <!-- /container -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
</body>
</html>
