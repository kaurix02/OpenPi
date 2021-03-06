<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
    <title>Pizzas page</title>
    <c:if test="${isShopping}">
        <link href="<c:url value="/"/>resources/css/bootstrap.min.css"  rel="stylesheet"/>
        <link href="<c:url value="/"/>resources/openpi.css" rel="stylesheet"/>
        <script async src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script async src="<c:url value="/"/>resources/js/bootstrap.min.js"></script>
    </c:if>
    <c:if test="${!isShopping}">
        <link href="<c:url value="/" />resources/css/bootstrap.min.css"  rel="stylesheet"/>
        <link href="<c:url value="/" />resources/openpi.css" rel="stylesheet"/>
        <script async src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script async src="<c:url value="/" />resources/js/bootstrap.min.js"></script>
    </c:if>

    <script async src="<c:url value="/"/>resources/js/fb_pizza.js"></script>

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
            <li class="active"><a href="<c:url value="/pizzas" />"><c:if test="${isEstonian}">Pitsad</c:if> <c:if test="${!isEstonian}">Pizzas</c:if></a></li>
            <c:if test="${isShopping}">
                <li id="registeredUser" class="dropdown">
                    <a href="#" class="disabled">
                            ${userFirstName} <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value="/user"/>"><c:if test="${isEstonian}">Kasutaja</c:if> <c:if test="${!isEstonian}">User</c:if></a></li>
                        <li><a href="<c:url value="/logout"/>"><c:if test="${isEstonian}">Logi välja</c:if> <c:if test="${!isEstonian}">Logout</c:if></a></li>
                    </ul>
                    <!--<a href="<c:url value="/user"/>">
                        ${userFirstName}
                    </a>-->
                </li>
            </c:if>
            <c:if test="${!isShopping}">
                <li id="unRegisteredUser"><a href="<c:url value="/login" />"><c:if test="${isEstonian}">Sisselogimine</c:if> <c:if test="${!isEstonian}">Log In</c:if></a></li>
            </c:if>
            <li><a href="<c:url value="/about" />"><c:if test="${isEstonian}">Meist</c:if> <c:if test="${!isEstonian}">About Us</c:if></a></li>
            <li><a href="<c:url value="/contact" />"><c:if test="${isEstonian}">Kontakt</c:if> <c:if test="${!isEstonian}">Contact</c:if></a></li>
            <li><a href="<c:url value="/funpizzafacts" />"><c:if test="${isEstonian}">Pitsa Faktid</c:if> <c:if test="${!isEstonian}">Fun Pizza Facts</c:if></a></li>
        </ul>
    </nav>
    <div class="container pizzaOffers">
        <div class="row">
            <div class="col-sm-9">
                <h1 id="pizzaPage">Pizzas</h1>
                <!--p class="lead">${test}</p>-->
                <!--<c:if test="${isShopping}">
                        <p>${listOfProducts}</p>
                    </c:if> -->
                <c:if test="${!isShopping}">

                </c:if>
                <table class="lead">
                    <tr>
                        <td><c:if test="${isEstonian}">Pilt</c:if> <c:if test="${!isEstonian}">Picture</c:if></td>
                        <td><c:if test="${isEstonian}">Nimetus</c:if> <c:if test="${!isEstonian}">Naming</c:if></td>
                        <td><c:if test="${isEstonian}">Kirjeldus</c:if> <c:if test="${!isEstonian}">Description</c:if></td>
                        <td><c:if test="${isEstonian}">Hind (eur)</c:if> <c:if test="${!isEstonian}">Price(eur)</c:if></td>
                    </tr>
                    <c:forEach items="${pizzas}" var="pizza">
                        <tr>
                            <td class="tabeliCell" id="pizzaPicture${pizza.id}">
                                <figure>
                                    <img src="<c:url value="/" />resources/images/${pizza.id}.jpg" alt="${pizza.naming}">
                                    <figcaption>${pizza.naming} <c:if test="${isEstonian}">Pilt</c:if> <c:if test="${!isEstonian}">Picture</c:if> </figcaption>
                                </figure>
                            </td>
                            <td class="tabeliCell" id="pizzaNaming${pizza.id}">${pizza.naming}</td>
                            <td class="tabeliCell" id="pizzaDescription${pizza.id}">${pizza.description}</td>
                            <td class="tabeliCell" id="pizzaDescription${pizza.id}">${pizza.price}</td>
                            <c:if test="${isShopping}">
                                <td><button type="button" class="btn btn-sm btn-warning addPizza tabeliCell" id="${pizza.id}" >
                                    <c:if test="${isEstonian}">Osta</c:if> <c:if test="${!isEstonian}">Buy</c:if>
                                </button></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="col-sm-3">
                <ul id="sidebar" class="nav nav-stacked affix">
                    <c:if test="${isShopping}">
                        <c:forEach items="${shoppingCart}" var="cart">
                            <li id="pizza${cart}">${cart.key} : ${cart.value}tk</li>
                            <li><button class="btn btn-sm btn-success addPizzaAdditional" id="add${cart}">
                                +
                            </button></li>
                            <li><button class="btn btn-sm btn-danger removePizza" id="${cart}">
                                -
                            </button></li>
                        </c:forEach>
                        <c:if test="${shoppingCart.size() > 0}">
                            <li><a href="<c:url value="/cart/checkout"/>">
                                <button class="btn btn-lg btn-success">
                                    <c:if test="${isEstonian}">Jätka</c:if> <c:if test="${!isEstonian}">Checkout</c:if>
                                </button>
                            </a></li>
                        </c:if>
                    </c:if>
                </ul>
                <c:if test="${!isShopping}">
                    <a href="<c:url value="/cart/"/>">
                        <input type="button" class="btn btn-lg btn-success" value="Start Shopping" />
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
<c:if test="${isShopping}" >
    <script async src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script async src="<c:url value="/"/>resources/cart/cart.js"></script>
</c:if>
</html>
