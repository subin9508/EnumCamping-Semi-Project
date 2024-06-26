<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>캠핑장 시설배치도</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
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
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</head>
<body>
<div class="wrapper">
    <div class="container-fluid">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
    </div>
    <main>
        <div class="heading-wrapper">
            <h4 class="fheading-3">시설배치도</h4>
        </div>
        <div class="image-sidebar-wrapper">
            <div class="intro-sidebar">
                <c:set var="pageTitle" value="Home" scope="page" />
                <%@ include file="../fragments/intro-sidebar.jspf"%>
            </div>
            <div class="image-wrapper">
                <img
                        src="https://lh3.googleusercontent.com/proxy/ihHd_M-wsSuOaBajAJ34kuoZEF7eUVB-X7ccHVw0IKrrxmQxI0-0VzlXdot4WL72_CKpfBPWoQfM7-NbGfTQyhqiICCMK6WAWFXWYFMaK17mwKuc9PtXPBEOssmdUjDtmDgJ7W3d"
                        alt="Image4" width="900" height="900">
            </div>
        </div>
        <section class="facility-section content-wrapper">
            <div class="box">
                <div class="left-content">
                    <div class="item">
                        <h4>캠핑 A, B, C동</h4>
                        <h5>- 전 구역 데크존으로 편안한 캠핑 가능</h5>
                        <h5>- 계곡 및 수영장과 인접하여 이동성 좋음</h5>
                        <h5>- 자연으로 둘러싸인 구조로 조용한 휴식 가능</h5>
                    </div>
                    <div class="item2">
                        <h4>산책로(화살표 방향)</h4>
                        <h5>- 캠핑장 주변 둘레길로 산책 가능</h5>
                    </div>
                </div>
                <div class="right-content">
                    <div class="item3">
                        <h4>로뎀동, 카이로스동(관리동)</h4>
                        <h5>- 화장실, 샤워실, 식수대, 주차장 구비</h5>
                        <h5>- 자체 매점 운영으로 식재료 및 필요 용품 즉시 구매 가능</h5>
                    </div>
                    <div class="item4">
                        <h4>무료 수영장</h4>
                        <h5>- 추가 요금 없이 수영장 이용 가능</h5>
                        <h6>*운영시간: 오전 11시 ~ 오후 4시*</h6>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <div class="container-fluid" id="wrap">
            <%@ include file="../fragments/footer.jspf"%>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
