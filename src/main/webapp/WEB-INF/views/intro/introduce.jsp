<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑장 소개</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />
<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />
<c:url var="sidebarCSS" value="/css/sidebar.css" />
<link rel="stylesheet" href="${sidebarCSS}">
<c:url value="/css/intro.css" var="introCSS" />
<link rel="stylesheet" href="${introCSS}" />

</head>

<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        
        <div class="footer-main-content">
            <%@ include file="../fragments/intro-sidebar.jspf"%>

            <main class="main-content" style="margin-left: 300px; margin-top: 50px;">
                <div class="content-1">
                    <br>
                    <h1>
                        <strong>[ENUM 캠핑장 소개]</strong>
                    </h1>
                </div>

                <section class="facility-section">

                    <div class="slider-container">
                        <div class="slider">
                            <input type="radio" name="slide" id="slide1"
                                checked> <input type="radio"
                                name="slide" id="slide2"> <input
                                type="radio" name="slide" id="slide3">
                            <ul class="imgs">
                                <li><img
                                    src="https://cdn.pixabay.com/photo/2020/08/21/15/04/tent-5506381_1280.jpg"
                                    alt="Image 1"></li>
                                <li><img
                                    src="https://cdn.pixabay.com/photo/2017/08/06/02/32/camp-2587926_1280.jpg"
                                    alt="Image 2"></li>
                                <li><img
                                    src="https://cdn.pixabay.com/photo/2017/08/07/18/28/night-2606510_1280.jpg"
                                    alt="Image 3"></li>
                            </ul>
                            <div class="bullets">
                                <label for="slide1"></label> <label
                                    for="slide2"></label> <label
                                    for="slide3"></label>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container">
                        <div class="box box1">
                            <h4>1. 자연친화적</h4>
                            <h5>ENUM 캠핑장은 자연친화적 공간으로 일상으로부터 벗어나 
                            온전한 휴식을 즐기실 수 있습니다.</h5>
                        </div>
                        <div class="box box2">
                            <h4>2. 전 구역 데크존</h4>
                            <h5>모든 구역이 데크존으로 이루어져 있어 편리하고, 프라이빗하게 
                            자연을 즐기실 수 있습니다.</h5>
                        </div>
                        <div class="box box3">
                            <h4>3. 다양한 편의 시설</h4>
                            <h5>화장실, 샤워실, 식수대, 주차장 뿐만 아니라 자체 매점
                            운영 및 무료 수영장 운영으로 합리적인 가격에 다양한 시설을
                            이용하실 수 있습니다.</h5>
                        </div>
                    </div>
                </section>
                
            </main>
           
        </div>
         <%@ include file="../fragments/footer.jspf"%>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>