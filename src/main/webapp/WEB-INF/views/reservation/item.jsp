<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대여 및 물품 선택</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous" />

    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">

<style>
table {
    width: 70%;
    table-layout: fixed;
    border-collapse: collapse;
}

th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
    width: 20%; /* 셀 너비를 20%로 설정하여 5개의 열이 동일한 너비를 갖도록 설정 */
}

.img-container img {
    width: 150px;
    height: 150px;
}
</style>

</head>

<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">

            <main style="margin-bottom: 5%; margin-top: 5%">
                <div class="container-fluid d-flex justify-content-center">
                    <h1>대여 및 판매 물품</h1>
                </div>
                <div class="container-fluid d-flex justify-content-center">
                    <table>
                        <tbody>
                            <c:forEach var="i" items="${items}">
                                <tr>
                                    <td class="img-container"><c:url
                                            value="${i.itemImg}"
                                            var="burnerset" /> <img
                                        alt="burnerset"
                                        src="${burnerset}" class="img"
                                        id="burnerset" /></td>
                                    <td>
                                        <h5>${i.itemName}</h5>
                                    </td>
                                    <td>${i.itemDesc}</td>
                                    <td>${i.itemPrice}원</td>
                                    <td class="narrow">
                                        <div class="quantity-controls">
                                            <button onclick="decreaseQuantity('${i.itemId}', ${i.itemPrice})">-</button>
                                            <span id="quantity${i.itemId}">0</span>
                                            <button onclick="increaseQuantity('${i.itemId}', ${i.itemPrice})">+</button>
                                        </div>
                                        <div>
                                            총 가격: 
                                            <span id="totalPrice${i.itemId}">0</span>
                                            원
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="container-fluid d-flex justify-content-center mt-3">
                    <h4>전체 총 가격: <span id="grandTotalPrice">0</span> 원</h4>
                </div>
                <div
                    class="container-fluid d-flex justify-content-center mt-3">
                    <c:url value="/reservation/order" var="orderJsp" />
                    <a href="${orderJsp}" class="btn btn-primary"
                        role="button">다음 단계</a>
                </div>
            </main>

            <div class="container-fluid" id="wrap">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </div>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

    <script>
        // 가격 포맷팅 함수
        function formatPrice(price) {
            return price.toLocaleString();
        }

        function decreaseQuantity(id, price) {
            const quantityElement = document.querySelector('#quantity' + id);
            let quantity = parseInt(quantityElement.textContent);
            if (quantity > 0) {
                quantityElement.textContent = --quantity;
                updateTotalPrice(id, price, quantity);
                updateGrandTotalPrice();
            }
        }

        function increaseQuantity(id, price) {
            const quantityElement = document.querySelector('#quantity' + id);
            let quantity = parseInt(quantityElement.textContent);
            quantityElement.textContent = ++quantity;
            updateTotalPrice(id, price, quantity);
            updateGrandTotalPrice();
        }

        function updateTotalPrice(id, price, quantity) {
            const totalPriceElement = document.querySelector('#totalPrice' + id);
            const totalPrice = price * quantity;
            totalPriceElement.textContent = formatPrice(totalPrice);
        }

        function updateGrandTotalPrice() {
            const totalPriceElements = document.querySelectorAll('[id^="totalPrice"]');
            let grandTotal = 0;
            totalPriceElements.forEach(function(element) {
                grandTotal += parseInt(element.textContent.replace(/,/g, ''));
            });
            const grandTotalPriceElement = document.querySelector('#grandTotalPrice');
            grandTotalPriceElement.textContent = formatPrice(grandTotal);
        }

        // 페이지 로드 시 초기 가격 포맷팅
        document.addEventListener('DOMContentLoaded', function() {
            const priceElements = document.querySelectorAll('[id^="price"]');
            priceElements.forEach(function(element) {
                element.textContent = formatPrice(parseInt(element.textContent));
            });
        });
        
    
    </script>
    

</body>
</html>