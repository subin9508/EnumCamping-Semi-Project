<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약 및 주문하기</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />

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
                <h1>주문 확인</h1>
                <table>
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                    </tr>
                    <c:forEach var="order" items="${orderItems}">
                        <tr>
                            <td>${order.itemName}</td>
                            <td>${order.quantity}</td>
                            <td>${order.price}</td>
                        </tr>
                    </c:forEach>
                </table>

                <h2>약관 동의</h2>
                <textarea readonly>약관 내용...</textarea>
                <br> <input type="checkbox" id="agree"> 약관에
                동의합니다

                <button onclick="proceedToPayment()">결제하기</button>

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
    function proceedToPayment() {
        if (!document.getElementById('agree').checked) {
            alert('약관에 동의해주세요.');
            return;
        }
        // 결제 처리 로직
    }
    </script>

</body>
</html>