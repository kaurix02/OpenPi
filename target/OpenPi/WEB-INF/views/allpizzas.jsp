<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>OpenPi Service</title>
</head>
<body>
    <h1>Pizzas</h1>
    <table>
        <tr>
            <td>Naming</td><td>Description</td>
        </tr>
        <c:forEach items="${pizzas}" var="pizza">
            <tr>
                <td>${pizza.naming}</td>
                <td>${pizza.description}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
