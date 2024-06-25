<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>semiproject</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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
  width: 350px;
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
.info-section {
   display: flex;
   justify-content: space-around;
   margin-top: 20px;
}

.info-card {
   width: 30%;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   padding: 20px;
   text-align: center;
}

.info-card img {
   width: 100%;
   height: auto;
   border-radius: 5px;
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
         <div class="slider">
            
            <div class="content-1"> 
            <br>
            <h1><strong>[물품 판매 리스트]</strong></h1>
                <div class="horizontal-divider" ></div>
                <div class="horizontal-divider2"></div>
                </div>
            <br>
         
         <div class="info-section">
            <div class="info-card">
               <c:url var="bbqset" value="/images/bbqset.png" />
               <img alt = "바베큐세트" src="${bbqset}"/>
               <h3>바베큐 세트</h3>
               <p>(삼겹살200g + 소세지 + 채소 + 장작 + 집게 + 불판)</p>
               <p>35,000원</p>
            </div>
            <div class="info-card">
               <c:url var="sweetpotato" value="/images/sweetpotato.png" />
               <img alt = "고구마" src="${sweetpotato}"/>
               <h3>고구마</h3>
               <p>(200g)</p>
               <p>5,000원</p>
            </div>
            <div class="info-card">
               <c:url var="marshmallow" value="/images/marshmallow.png" />
               <img alt = "마시멜로우" src="${marshmallow}"/>
               <h3>마시멜로우</h3>
               <p>(1봉지-10개입 + 꼬치 5개)</p>
               <p>6,000원</p>
            </div>
            </div>
         <div class="info-section">
            <div class="info-card">
               <c:url var="firewood" value="/images/firewood.png" />
               <img alt = "장작" src="${firewood}"/>
               <h3>장작</h3>
               <p>(1kg)</p>
               <p>11,000원</p>
            </div>
            <div class="info-card">
               <c:url var="butangas" value="/images/butangas.png" />
               <img alt = "부탄가스" src="${butangas}"/>
               <h3>부탄가스</h3>
               <p>(1개)</p>
               <p>2,000원</p>
            </div>
            <div class="info-card">
               <c:url var="aurorapowder" value="/images/aurorapowder.png" />
               <img alt = "오로라가루" src="${aurorapowder}"/>
               <h3>오로라가루</h3>
               <p>(1개)</p>
               <p>불에 뿌리면 멋진 오로라를 볼 수 있어요</p>
               <p>1,500원</p>
            </div>
            </div>
            </div>
         </div>
      </div>

   <footer>
      <div class="container-fluid" id="wrap">
         <%@ include file="../fragments/footer.jspf"%>
      </div>
   </footer>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
      
         <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>