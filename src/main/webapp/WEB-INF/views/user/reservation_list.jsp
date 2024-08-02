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
                                <colgroup>
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                    <col style="width: 25%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>예약 번호</th>
                                        <th>숙박 구역</th>
                                        <th>숙박 일자</th>
                                        <th>예약 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- 우선 예약 없음(예약 대기일 경우 화면에 나타나는 경우 방지)으로 둠 -->
                                    <c:set var="hasReservations" value="false" />
                                    <c:forEach items="${reservations}" var="r">
                                        <!-- 예약완료/예약취소 상태이고 예약한 숙소가 있으면 예약있음으로 상태 변경 -->
                                        <!-- 음...근데 예약 번호 확인은.. 안해도 될 듯? 당시에 sql developer에서 임의로 추가하는 경우 때문에 넣은 것으로 보임 -->
                                        <!-- 수정 시 없애면 될 것 같음!! -->
                                        <c:if test="${r.resState != 0 && r.itemId <= 20}">
                                            <c:set var="hasReservations" value="true" />
                                            <tr onclick="location.href='${pageContext.request.contextPath}/user/reservation_details?resId=${r.resId}'" 
                                                style="cursor:pointer;">
                                                <td>${r.resId}</td>
                                                <td>
                                                    <c:choose>
                                                        <!-- 물품 번호를 기준으로 물품 이름을 알려줌 -->
                                                        <c:when test="${r.itemId ge 1 and r.itemId le 4}">
                                                            캠핑존 A-1
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 5 and r.itemId le 8}">
                                                            캠핑존 A-2
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 9 and r.itemId le 12}">
                                                            캠핑존 B-1
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 13 and r.itemId le 16}">
                                                            캠핑존 B-2
                                                        </c:when>
                                                        <c:when test="${r.itemId ge 17 and r.itemId le 20}">
                                                            캠핑존 C
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${r.resCheckIn}</td>
                                                <td>
                                                    <!-- 예약 상태에 따른 상태 표시 -->
                                                    <c:if test="${r.resState == 0}">
                                                        <span style="color: green;">예약대기</span>
                                                    </c:if>
                                                    <c:if test="${r.resState == 1}">
                                                        <span style="color: blue;">예약완료</span>
                                                    </c:if>
                                                    <c:if test="${r.resState == 2}">
                                                        <span style="color: red;">예약취소</span>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <!-- 예약 내역이 없을 때 표시할 내용 -->
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
