<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>캠핑장 시설배치도</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<c:url var="sidebarCSS" value="/css/sidebar.css" />
<link rel="stylesheet" href="${sidebarCSS}">
<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />
<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />
<c:url value="/css/facilityLayout.css" var="facilityLayoutCSS" />
<link rel="stylesheet" href="${facilityLayoutCSS}" />

</head>
<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>

        <div class="footer-main-content">
            <%@ include file="../fragments/intro-sidebar.jspf"%>

            <main class="main-content"
                style="margin-left: 300px; margin-top: 50px;">
                <div class="content-1">
                    <br>
                    <h1>
                        <strong>[시설배치도]</strong>
                    </h1>
                </div>
               
                   
                    <div class="info-section">
                     <img class="facility-image"
                        src="../images/intro/KakaoTalk_20240717_110940836.jpg"
                        alt="캠핑장 시설배치도" width="600" height="600">
                        <div class="box">
                            <div class="left-content">
                                <!-- 왼쪽 내용 -->
                                <h2 class="bold">1 ~5구역</h2>
                                <ul>
                                    <li>전 구역 데크존으로 편안한 캠핑 가능합니다.</li>
                                    <li>계곡과 인접하여 이동성이 좋습니다.</li>
                                    <li>자연으로 둘러싸인 구조로 조용한 휴식 가능합니다.</li>
                                    <li>중앙 벤치 무료 이용 가능합니다. </li>
                                    <li>캠핑장 주변 둘레길로 산책 가능합니다.</li>
                                </ul>
                            </div>
                            <div class="right-content">
                                <!-- 오른쪽 내용 -->
                                <h2 class="bold">편의 시설</h2>
                                <ul>
                                    <li>화장실, 샤워실, 식수대, 주차장 구비되어있습니다.</li>
                                    <li>자체 매점 운영으로 식재료 및 필요한 용품 즉시
                                        구매 가능합니다.</li>
                                    <li>야간 캠프파이어</li>
                                    <li>(추가 요금 없이 캠프파이어 이용 가능)</li>
                                    <li>(운영시간: 오후 8시 ~ 오후 10시)</li>
                                    <li>*동절기는 오후 7시부터 이용 가능합니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
               

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