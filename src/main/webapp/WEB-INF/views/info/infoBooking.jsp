<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>semiproject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
        
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
    
    <style>
.horizontal-divider {
  background: #ebebeb;
  width: 1000px;
  height: 1px;
  left: 0px;
  bottom: -10px;
}
.horizontal-divider2 {
  background: #111111;
  width: 200px;
  height: 1px;
  right: 0%;
  left: 0%;
  bottom: -10px;
}
 .slider {
    width: 1000px;   
    margin: 0 auto;    
    align-items: center;
    justify-content: center;
}
</style>

</head>
<body>
   <div class="container">
      <div class="container-fluid">
         <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
         <%@ include file="../fragments/header.jspf"%>
      </div>

      <div class="container-fluid">
         <%@ include file="../fragments/info-sidebar.jspf"%>
      </div>
      
        <div class="content">
            <main class="main-content">
            <div class="slider">
            
            <div class="content-1"> 
            <br>
                <h1><strong>[예약방법]</strong></h1>
                <div class="horizontal-divider" ></div>
                <div class="horizontal-divider2"></div>
                </div>
                        <div class="info-text">
                        <br>
                            <h5>1. 매일 오전 10시에 한달 후의 구역이 활성됩니다</h5>
                            <h5>2. 원하는 날짜 선택</h5>
                            <h5>3. 원하는 구역 선택</h5>
                            <h5>4. 예약 신청</h5>
                            <h5>5. 예약 조회 및 확인</h5>
                            <h5>6. 모든 시설 이용객은 관리사무실에서 체크인 후 입장 가능합니다</h5>
                            <h5>7. 양도, 양수, 교환, 매매행위 금지합니다</h5>
                            <h5>8. 예약자와 시설이용자는 동일인이여야 합니다</h5>
                        </div>
                        <br><br>
              </div>
            </main>
        </div>
    </div>
    
    <footer>
         <div class="container-fluid" id="wrap">
        <%@ include file="../fragments/footer.jspf" %>
          </div> 
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
        
           <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>