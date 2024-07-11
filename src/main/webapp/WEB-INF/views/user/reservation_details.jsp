<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ENUM CAMPING</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">

    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">

    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">

</head>
<body>
<div class="wrapper">
    <%@ include file="../fragments/header.jspf" %>
    <div class="footer-main-content">
    <%@ include file="../fragments/mypage-sidebar.jspf"%>

        <main>
            <div class="mt-2 card">
                <div class="card-header">
                    <h2>예약내역 상세보기</h2>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mt-2">
                            <label for="resId" class="form-label">예약번호</label>
                            <input id="resId" name="resId" class="form-control"
                                type="text" value="${resMaster.resId}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="resCheckIn" class="form-label">체크인 날짜</label>
                            <input id="resCheckIn" class="form-control"
                                type="text" value="${resMaster.resCheckIn}"
                                readonly />
                        </div>
                        
                        <div>
                        <button id="btnPayCancel" class="btn btn-primary">결제 취소</button>
                        </div>
                        
					 </form>
            </div>
        </main>
</div>

    <%@ include file="../fragments/footer.jspf" %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
 	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
        <c:url var="paymentCancel_js" value="/js/paymentCancel.js" />
    <script src="${paymentCancel_js}"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

</body>
</html>