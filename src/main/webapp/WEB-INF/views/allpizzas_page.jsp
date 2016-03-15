<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>OpenPi Service</title>
    <link href="resources/pizzaspage/pizzas.css" rel="stylesheet">
</head>
<body>
    <h1>Pizzas</h1>
    <p>${test}</p>
    <a href="<c:url value="/cart/"/>">
        <button>Start Shopping</button>
    </a>
    <table>
        <tr>
            <td>Naming</td><td>Description</td>
        </tr>
        <c:forEach items="${pizzas}" var="pizza">
            <tr>
                <td>${pizza.naming}</td>
                <td>${pizza.description}</td>
                <td><button type="button">Buy</button></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
