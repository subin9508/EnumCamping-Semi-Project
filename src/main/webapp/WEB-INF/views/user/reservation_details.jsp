<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ENUM CAMPING</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<c:url value="../css/header.css" var="headerCss" />
<link rel="stylesheet" href="${headerCss}">

<c:url value="../css/footer.css" var="footerCss" />
<link rel="stylesheet" href="${footerCss}">

</head>
<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">
            <%@ include file="../fragments/mypage-sidebar.jspf"%>

            <main>
                <div class="mt-2 card">
                    <div class="card-header">
                        <h2>예약내역 상세보기</h2>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="mt-2">
                                <label for="resId" class="form-label">예약번호</label>
                                <input id="resId" class="form-control"
                                    type="text"
                                    value="${resMaster.resId}" readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resCheckIn"
                                    class="form-label">체크인 날짜</label> <input
                                    id="resCheckIn" class="form-control"
                                    type="text"
                                    value="${resMaster.resCheckIn}"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resCheckOut"
                                    class="form-label">체크아웃 날짜</label> <input
                                    id="resCheckOut"
                                    class="form-control" type="text"
                                    value="${resMaster.resCheckOut}"
                                    readonly />
                            </div>
                            <!-- 
                            <div class="mt-2">
                                <label for="areaId" class="form-label">구역</label>
                                <input id="areaId" class="form-control"
                                    type="text"
                                    value="${resMaster.areaId}" readonly />
                            </div>
                             -->
                            <div class="mt-2">
                                <label for="requirement"
                                    class="form-label">요청사항</label>
                                <textarea id="requirement"
                                    class="form-control" rows="5"
                                    readonly>${resMaster.requirement}</textarea>
                            </div>
                            <div class="mt-2">
                                <label for="resCreatedTime"
                                    class="form-label">최초 예약 시간</label>
                                <input id="resCreatedTime"
                                    class="form-control" type="text"
                                    value="${resMaster.resCreatedTime}"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resModifiedTime"
                                    class="form-label">최종 수정 시간</label>
                                <input id="resModifiedTime"
                                    class="form-control" type="text"
                                    value="${resMaster.resModifiedTime}"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resTotalPrice"
                                    class="form-label">총 가격</label> <input
                                    id="resTotalPrice"
                                    class="form-control" type="text"
                                    value="${resMaster.resTotalPrice}"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resState" class="form-label">예약
                                    상태</label>
                                <c:set var="resStateText">
                                    <c:choose>
                                        <c:when
                                            test="${resMaster.resState == 0}">예약대기</c:when>
                                        <c:when
                                            test="${resMaster.resState == 1}">예약완료</c:when>
                                        <c:when
                                            test="${resMaster.resState == 2}">예약취소</c:when>
                                        <c:otherwise>알 수 없음</c:otherwise>
                                    </c:choose>
                                </c:set>
                                <input id="resState"
                                    class="form-control" type="text"
                                    value="${resStateText}" readonly />
                            </div>

                        </form>
                    </div>

                    <div class="card-footer d-flex justify-content-end">
                        <div>
                            <button class="btn btn-primary">예약
                                수정</button>
                            <button id="btnDelete"
                                class="btn btn-danger">예약 취소</button>
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
    <c:url var="notify_delete_JS" value="/js/notice_delete.js" />
    <script src="${notify_delete_JS}"></script>
</body>
</html>