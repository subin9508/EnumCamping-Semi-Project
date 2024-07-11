<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>

<c:url value="/css/travel.css" var="travelCSS" />
<link rel="stylesheet" href="${travelCSS}" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Enum Semi-Project</title>
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
        <%@ include file="../fragments/header.jspf"%>

        <div class="footer-main-content">
            <%@ include file="../fragments/intro-sidebar.jspf"%>

            <div class="container">
                <h3 class="text-center mt-3">
                    <strong>[주변 여행지]</strong>
                </h3>

                <div class="travel-section">
                    <div class="travel-card">
                        <div class="responsive-image">
                            <a
                                href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC%EA%B3%84%EA%B3%A1?c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_valley.jpg"
                                    var="intro2_valley" /> <img
                                alt="valley" src="${intro2_valley}"
                                width="600" height="400" />
                            </a>
                        </div>
                        <div class="mt-2">
                            <h5>
                                <strong>수타사 계곡</strong>
                            </h5>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <a
                                href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC%EA%B3%84%EA%B3%A1?c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_locationicon.png"
                                    var="intro2_locationicon" /> <img
                                src="${intro2_locationicon}" width="20"
                                height="20" style="margin-right: 5px;"
                                class="img" />
                            </a>
                            <h6 style="margin: 0;">걸어서 1분거리, 50m</h6>
                        </div>
                    </div>
                    <div class="travel-card">
                        <div class="responsive-image">
                            <a
                                href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC/place/1629327313?placePath=?entry=pll&from=nx&fromNxList=true&searchType=place&c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_temple.jpg"
                                    var="intro2_temple" /> <img
                                alt="trail" src="${intro2_temple}"
                                width="600" height="400" />
                            </a>
                        </div>
                        <div class="mt-2">
                            <h5>
                                <strong>수타사</strong>
                            </h5>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <a
                                href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC/place/16222041?placePath=?entry=pll&from=nx&fromNxList=true&searchType=place&c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_locationicon.png"
                                    var="intro2_locationicon" /> <img
                                src="${intro2_locationicon}" width="20"
                                height="20" style="margin-right: 5px;"
                                class="img" />
                            </a>
                            <h6 style="margin: 0;">걸어서 3분거리, 226m</h6>
                        </div>
                    </div>
                </div>
                <div class="travel-section">
                    <div class="travel-card">
                        <div class="responsive-image">
                            <a
                                href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%ED%95%9C%EC%9A%B0%EC%88%98%EB%9D%BC/place/1241815713?c=15.00,0,0,0,dh&isCorrectAnswer=true"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_beef.jpg"
                                    var="intro2_beef" /> <img
                                alt="beef" src="${intro2_beef}"
                                width="600" height="400" />
                            </a>
                        </div>
                        <div class="mt-2">
                            <h5>
                                <strong>홍천한우수라</strong>
                            </h5>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <a
                                href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%ED%95%9C%EC%9A%B0%EC%88%98%EB%9D%BC/place/1241815713?c=15.00,0,0,0,dh&isCorrectAnswer=true"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_locationicon.png"
                                    var="intro2_locationicon" /> <img
                                src="${intro2_locationicon}" width="20"
                                height="20" style="margin-right: 5px;"
                                class="img" />
                            </a>
                            <h6 style="margin: 0;">차로 6분거리, 3.6km</h6>

                        </div>
                    </div>
                    <div class="travel-card">
                        <div class="responsive-image">
                            <a
                                href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%EA%B0%95%EB%A7%89%EA%B5%AD%EC%88%98?c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_noodle.jpg"
                                    var="intro2_noodle" /> <img
                                alt="noodle" src="${intro2_noodle}"
                                width="600" height="400" />
                            </a>
                        </div>
                        <div class="mt-2">
                            <h5>
                                <strong>홍천강막국수</strong>
                            </h5>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <a
                                href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%EA%B0%95%EB%A7%89%EA%B5%AD%EC%88%98?c=15.00,0,0,0,dh"
                                target="_blank"> <c:url
                                    value="/images/intro/intro2_locationicon.png"
                                    var="intro2_locationicon" /> <img
                                src="${intro2_locationicon}" width="20"
                                height="20" style="margin-right: 5px;"
                                class="img" />
                            </a>
                            <h6 style="margin: 0;">차로 10분거리, 5.5km</h6>
                        </div>
                    </div>
                </div>
            </div>

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