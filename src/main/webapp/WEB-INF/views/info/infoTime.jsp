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
    <div class="wrapper">

        <header>
            <div class="container-fluid">
                <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
                <%@ include file="../fragments/header.jspf"%>
            </div>
        </header>
        <div class="container-fluid">
            <%@ include file="../fragments/info-sidebar.jspf"%>
        </div>

        <div class="content">
            <main class="main-content">
                <div class="slider">
           
                <div class="content-1">
                <br>
                <h1>
                    <strong>[이용시간]</strong>
                </h1>
                <div class="horizontal-divider" ></div>
                <div class="horizontal-divider2"></div>
                <br>
                </div>
                <div class="info-section">
                    <div class="info-item">
                        <c:url var="checkin" value="/images/checkin.png" />
                        <img style="float:left" alt = "체크인" src="${checkin}"/>
                        <div class="info-text">
                            <h3 style="text-indent: 10px;">
                                <strong> 입장</strong>
                            </h3>
                            <h5 style="text-indent: 10px;">오후 14:00 부터 21:00 까지</h5>
                        </div>
                    </div>
                    <br><br>
                    <div class="info-item">
                        <c:url var="checkout" value="/images/checkout.png" />
                        <img style="float:left" alt = "체크아웃" src="${checkout}"/>
                        <div class="info-text">
                            <h3 style="text-indent: 10px;">
                                <strong> 퇴장</strong>
                            </h3>
                            <h5 style="text-indent: 10px;" >오전 11:00 까지</h5>
                        </div>
                    </div>
                </div>
                <br><br>
                <h1>
                    <strong>[이용요금]</strong>
                </h1>
                <div class="horizontal-divider" ></div>
                <div class="horizontal-divider2"></div>
                <br>
                <table class="table table-strped talbe-hover" style="width:70%">
                    <thead>
                        <tr>
                            <th style="width:50%">비성수기 / 평일</th>
                            <td>40,000</td>
                        </tr>
                        <tr>
                            <th style="width:50%">비성수기 / 주말</th>
                            <td>50,000</td>
                        </tr>
                        <tr>
                            <th style="width:50%">성수기 / 평일</th>
                            <td>50,000</td>
                        </tr>
                        <tr>
                            <th style="width:50%">성수기 / 주말</th>
                            <td>60,000</td>
                        </tr>
                    </thead>
                </table>
                
                <p>- 성수기: 7월~8월 / 주말: 금,토,일</p>
                <p>- 1박 요금입니다. 일일요금은 텐트1개, 차량1대, 1인 기준입니다.</p>
                <br><br>
                </div>
            </main>
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