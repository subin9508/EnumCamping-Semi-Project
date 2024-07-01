<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>대여 및 물품 선택</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">

    
</head>

<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">

            <main style="margin-bottom: 5%; margin-top: 5%">
                <div class="container-fluid d-flex justify-content-center">


                    <div id="product-list">
                        <div th:each="item : ${items}">
                            <div class="product-item">
                                <img src="product_image_url"
                                    alt="Product Image">
                                <h3 th:text="${item.itemName}">Product
                                    Name</h3>
                                <p th:text="${item.itemDescription}">Product
                                    Description</p>
                                <p
                                    th:text="'Price: $' + ${item.itemPrice}">Price:
                                    $100</p>
                                <input type="number" name="quantity"
                                    value="1" min="1">
                                <button
                                    onclick="addToCart(${item.itemId})">Add
                                    to Cart</button>
                            </div>
                        </div>
                    </div>


                </div>
            </main>

            <div class="container-fluid" id="wrap">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

   
</body>
</html>