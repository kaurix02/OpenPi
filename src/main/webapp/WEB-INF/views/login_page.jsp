<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    0charset="utf-8">
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
    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            // The response object is returned with a status field that lets the
            // app know the current login status of the person.
            // Full docs on the response object can be found in the documentation
            // for FB.getLoginStatus().
            if (response.status === 'connected') {
                // Logged into your app and Facebook.
                testAPI();
            } else if (response.status === 'not_authorized') {
                // The person is logged into Facebook, but not your app.
                document.getElementById('status').innerHTML = 'Please log ' +
                        'into this app.';
            } else {
                // The person is not logged into Facebook, so we're not sure if
                // they are logged into this app or not.
                document.getElementById('status').innerHTML = 'Please log ' +
                        'into Facebook.';
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function() {
            FB.init({
                appId      : '1761793507390965',
                cookie     : true,  // enable cookies to allow the server to access
                                    // the session
                xfbml      : true,  // parse social plugins on this page
                version    : 'v2.5' // use graph api version 2.5
            });

            // Now that we've initialized the JavaScript SDK, we call
            // FB.getLoginStatus().  This function gets the state of the
            // person visiting this page and can return one of three states to
            // the callback you provide.  They can be:
            //
            // 1. Logged into your app ('connected')
            // 2. Logged into Facebook, but not your app ('not_authorized')
            // 3. Not logged into Facebook and can't tell if they are logged into
            //    your app or not.
            //
            // These three cases are handled in the callback function.

            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });

        };

        // Load the SDK asynchronously
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        // Here we run a very simple test of the Graph API after login is
        // successful.  See statusChangeCallback() for when this call is made.
        function testAPI() {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function(response) {
                var email = response.name.replace(" ", "_") + "@facebook.com";
                $.ajax({
                    type: "POST",
                    url: window.location.href.replace("login", "facebooklogin"),
                    data: JSON.stringify({
                        firstName: response.name.split(" ")[0],
                        lastName: response.name.split(" ")[1],
                        email: response.id
                    }),
                    success: function(response){
                        console.log(response);
                        // Authentication successful, redirect to root
                        window.location.href = "/openpi";
                    },
                    error: function(response) {
                        console.log(response);
                    },
                    dataType: "json",
                    contentType: 'application/json; charset=utf-8'
                });
                console.log('Successful login for: ' + response.name);
            });
        }
    </script>

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

            <h1 id="fb-welcome"></h1>
            <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
            </fb:login-button>
            <a href="/SpringSocial/social/facebook/signin" >Log in with facebook!</a>
            <div id="status"></div>
        </div>
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