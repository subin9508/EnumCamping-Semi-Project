<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/travel.css" />

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Enum Semi-Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
</head>
<body>
    <div class="container-fluid">
        <div class="container-fluid">
            <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
            <%@ include file="../fragments/header.jspf"%>
        </div>

        <div class="container-fluid">
            <%@ include file="../fragments/intro-sidebar.jspf"%>
        </div>

        <main>
            <div class="mt-2 card">
                <div class="card-header text-center">
                    <h3>소개</h3>
                </div>   
                <div class="card-body text-center">
                    <h4>TRAVEL</h4>
                    <h6>주변 여행지/먹거리</h6>
                </div> 
                <div>
                    <div class="mt-2 card text-center" style="display: flex; flex-direction: column; align-items: center;">
                        <a href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC%EA%B3%84%EA%B3%A1?c=15.00,0,0,0,dh"
                            target="_blank">
                            <img alt="valley" src="${pageContext.request.contextPath}/static/images/intro2_valley.jpg" width="1000" height="300"/>
                        </a>
                        <h5>수타사 계곡</h5>
                        <div style="display: flex; align-items: center;">
                            <a href="https://map.naver.com/p/search/%EC%88%98%ED%83%80%EC%82%AC%EA%B3%84%EA%B3%A1?c=15.00,0,0,0,dh"
                                target="_blank"> 
                                <img
                                src="${pageContext.request.contextPath}/static/images/intro2_locationicon.png"
                                width="20" height="20"
                                style="margin-right: 5px;" class="img" />
                            </a>
                            <h6 style="margin: 0;">걸어서 1분거리, 50m</h6>
                        </div>
                    </div>
                    <div class="mt-2 card text-center" style="display: flex; flex-direction: column; align-items: center;">
                        <a href="https://map.naver.com/p/entry/place/389404515?c=17.12,0,0,0,dh"
                            target="_blank">
                            <img alt="trail" src="${pageContext.request.contextPath}/static/images/intro2_trail.jpg" width="1000" height="300"/>
                        </a>
                        <h5>수타사 생태숲공원</h5>
                        <div style="display: flex; align-items: center;">
                            <a href="https://map.naver.com/p/entry/place/389404515?c=17.12,0,0,0,dh"
                                target="_blank"> 
                                <img
                                src="${pageContext.request.contextPath}/static/images/intro2_locationicon.png"
                                width="20" height="20"
                                style="margin-right: 5px;" 
                                class="img" />
                            </a>
                            <h6 style="margin: 0;">걸어서 2분거리, 143m</h6>
                        </div>
                    </div>
                    <div class="mt-2 card text-center" style="display: flex; flex-direction: column; align-items: center;">
                        <a href="https://map.naver.com/p/entry/place/11554781?lng=127.7535566&lat=37.8765627&placePath=%2Fhome&entry=plt&searchType=place&c=15.00,0,0,0,dh"
                            target="_blank"> 
                            <img alt="chicken"
                                src="${pageContext.request.contextPath}/static/images/intro2_chicken.jpg"
                                width="1000" height="300" />
                        </a>
                        <h5>황토숯불닭갈비</h5>
                        <div style="display: flex; align-items: center;">
                            <a href="https://map.naver.com/p/entry/place/11554781?lng=127.7535566&lat=37.8765627&placePath=%2Fhome&entry=plt&searchType=place&c=15.00,0,0,0,dh"
                                target="_blank"> 
                                <img
                                src="${pageContext.request.contextPath}/static/images/intro2_locationicon.png"
                                width="20" height="20"
                                style="margin-right: 5px;" 
                                class="img"/>
                            </a>
                            <h6 style="margin: 0;">차로 5분거리, 2.2km</h6>

                        </div>
                    </div>
                    <div class="mt-2 card text-center" style="display: flex; flex-direction: column; align-items: center;">
                        <a href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%EA%B0%95%EB%A7%89%EA%B5%AD%EC%88%98?c=15.00,0,0,0,dh"
                            target="_blank">
                            <img alt="noodle"
                                src="${pageContext.request.contextPath}/static/images/intro2_noodle.jpg"
                                width="1000" height="300"/>
                        </a>
                        <h5>홍천강막국수</h5>
                        <div style="display: flex; align-items: center;">
                            <a href="https://map.naver.com/p/search/%ED%99%8D%EC%B2%9C%EA%B0%95%EB%A7%89%EA%B5%AD%EC%88%98?c=15.00,0,0,0,dh"
                                target="_blank"> 
                                <img
                                src="${pageContext.request.contextPath}/static/images/intro2_locationicon.png"
                                width="20" height="20"
                                style="margin-right: 5px;" 
                                class="img"/>
                            </a>
                            <h6 style="margin: 0;">차로 10분거리, 5.5km</h6>
                        </div>
                    </div>
                </div>        
            </div>
        </main>
    
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
</body>
</html>