<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/css/intro.css" var="introCSS" />
<link rel="stylesheet" href="${introCSS}" />

<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />

<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />
<c:url var="sidebarCSS" value="/css/sidebar.css" />
<link rel="stylesheet" href="${sidebarCSS}">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑장 소개</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">

</head>

<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>

        <div class="footer-main-content">
            <%@ include file="../fragments/intro-sidebar.jspf"%>

            <main class="main-content"
                style="margin-left: 300px; margin-top: 50px;">
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
                                    src="https://cdn.pixabay.com/photo/2016/02/05/01/58/camping-1180234_1280.jpg"
                                    alt="Image 1"></li>
                                <li><img
                                    src="https://cdn.pixabay.com/photo/2020/03/15/03/07/camping-4932314_1280.jpg"
                                    alt="Image 2"></li>
                                <li><img
                                    src="https://cdn.pixabay.com/photo/2017/07/17/16/44/besides-the-cancer-time-to-nearby-lodging-2513008_1280.jpg"
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
                            <h5>ENUM 캠핑장은 산도 있고 물도 있고~ 나무도 가득하고~
                                공기도 좋고~ 다 좋아요^_^</h5>
                        </div>
                        <div class="box box2">
                            <h4>2. 프라이빗 공간</h4>
                            <h5>전 구역 데크존으로 편리하고, 프라이빗하게 자연을 즐기실 수
                                있습니다~</h5>
                        </div>
                        <div class="box box3">
                            <h4>3. 힐링</h4>
                            <h5>지친 일상을 벗어나 ENUM 캠핑장에서 자연이 주는 힐링을
                                느끼시길 바랍니다~</h5>
                        </div>
                    </div>
                </section>
            </main>
            <%@ include file="../fragments/footer.jspf"%>
        </div>
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