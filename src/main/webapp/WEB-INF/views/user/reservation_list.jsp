<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ENUM CAMPING</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">

    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">

    <c:url value="../css/reservation_list.css" var="reservationListCss" />
    <link rel="stylesheet" href="${reservationListCss}">
</head>
<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">
            <%@ include file="../fragments/mypage-sidebar.jspf"%>
            <div class="container-fluid">
                <main>
                    <div class="card">
                        <h2 class="card-title">예약 내역 리스트</h2>
                        <div class="card-body">
                            <table class="table  table-hover">
                                <thead>
                                    <tr>
                                        <th>예약 번호</th>
                                        <th>숙박 구역</th>
                                        <th>숙박 일자</th>
                                        <th>예약 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="hasReservations" value="false" />
                                    <c:forEach items="${reservations}" var="r">
                                        <c:if test="${r.resState != 0 && r.itemId <= 20}">
                                            <c:set var="hasReservations" value="true" />
                                            <tr onclick="location.href='${pageContext.request.contextPath}/user/reservation_details?resId=${r.resId}'" 
                                                style="cursor:pointer;">
                                                <td>${r.resId}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${r.itemId ge 1 and r.itemId le 4}">
                                                            1구역
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 5 and r.itemId le 8}">
                                                            2구역
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 9 and r.itemId le 12}">
                                                            3구역
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 13 and r.itemId le 16}">
                                                            4구역
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 17 and r.itemId le 20}">
                                                            5구역
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${r.resCheckIn}</td>
                                                <td>
                                                    <c:if test="${r.resState == 0}">
                                                        예약대기
                                                    </c:if>
                                                    <c:if test="${r.resState == 1}">
                                                        예약완료
                                                    </c:if>
                                                    <c:if test="${r.resState == 2}">
                                                        예약취소
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${!hasReservations}">
                                        <tr>
                                            <td colspan="4" style="text-align: center;">예약 내역이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <%@ include file="../fragments/footer.jspf"%>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>
