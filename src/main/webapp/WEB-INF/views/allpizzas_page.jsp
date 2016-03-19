<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>OpenPi Service</title>
    <!--[if lt IE 9] -->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <h1>Pizzas</h1>
    <p>${test}</p>
    <c:if test="${isShopping}">
        <p>${listOfProducts}</p>
    </c:if>
    <c:if test="${!isShopping}">
        <a href="<c:url value="/cart/"/>">
            <button>Start Shopping</button>
        </a>
    </c:if>
    <table>
        <tr>
            <td>Naming</td><td>Description</td>
        </tr>
        <c:forEach items="${pizzas}" var="pizza">
            <tr>
                <td id="pizzaNaming${pizza.id}">${pizza.naming}</td>
                <td id="pizzaDescription${pizza.id}">${pizza.description}</td>
                <c:if test="${isShopping}">
                    <td><button type="button" id="${pizza.id}" >Buy</button></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${isShopping}">
        <div id="shoppingCart">${cartItems}</div>
    </c:if>
</body>
<c:if test="${isShopping}" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<c:url value="/"/>resources/cart/cart.js"></script>
</c:if>
</html>
