<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>OpenPi Pizza Service!</title>
    <!-- Bootstrap Core -->
    <link href="<c:url value="/" />resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/" />resources/openpi.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/" />resources/js/bootstrap.min.js"></script>
    <script src="<c:url value="/" />resources/js/fb_pizza.js"></script>
</head>
<body>
<div class="container">
    <form method="post" action="http://localhost:8080/banklink/ipizza">
        <c:forEach items="${checkoutInfo}" var="checkout">
            <input type="hidden" name="${checkout.key}" value="${checkout.value}" />
        </c:forEach>


        <table class="lead">
            <c:forEach items="${checkoutInfo}" var="checkout">
                <tr>
                    <td>${checkout.key}</td>
                    <td>${checkout.value}</td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>
</html>
