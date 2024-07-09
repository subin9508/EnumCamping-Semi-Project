<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html>
<head>
    <c:url value="/css/myPage.css" var="myPageCSS" />
    <link rel="stylesheet" href="${myPageCSS}" />

    <c:url value="/css/header.css" var="headerCSS" />
    <link rel="stylesheet" href="${headerCSS}" />

    <c:url value="/css/footer.css" var="footerCSS" />
    <link rel="stylesheet" href="${footerCSS}" />
    
    <c:url var="sidebarCSS" value="/css/sidebar.css" />
    <link rel="stylesheet" href="${sidebarCSS}">
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>결제 취소 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
</head>
<body>
<div class="wrapper">
    
    <main class="container-fluid no-padding content">
       
            <div class="col-md-9 main-content">
                <div class="card mt-2">
                    <div class="card-header">
                        <h2>결제 취소 페이지</h2>
                    </div>
                    
						<div class="card-body">
						<!-- 예약 ID 입력 필드 -->
                            <label for="resId" class="col-sm-2 col-form-label">예약 ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="resId" name="resId">
                            </div>
							

						<!-- 결제 취소 버튼  -->
						<div class="mb-3 row">
							<div class="col-sm-10 offset-sm-2">
								<button id="btnPayCancel" class="btn btn-primary">결제 취소 하기</button>
							</div>
						</div>
					</div>

						<div class="card-footer"></div>
                </div>
            </div>
        </div>
    </main>

   
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
    crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></</script>    

<c:url var="paymentCancel_js" value="/js/paymentCancel.js" />
<script src="${paymentCancel_js}"></script>

</body>
</html>