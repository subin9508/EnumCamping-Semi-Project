<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    
    <style>
    a:hover {
      font-weight: bold;
    }
    </style>
</head>
<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">
        <%@ include file="../fragments/mypage-sidebar.jspf"%>
        <main>
            <div class="card m-5">
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>숙박일</th>
                                <th>예약일</th>
                                <th>예약상태</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${reservations}" var="r">
                           <!-- 
                           <c:set value="${reservationDetails}" var="res_details"/>
                                    <td>${res_details.itemId }</td>
                            -->
                                <tr>
                                    <td>
                                    <c:url var="reservationListDetails" value="/user/reservation_details">
                                    <c:param name="resId" value="${r.resId}"></c:param>
                                    </c:url>
                                    <a href="${reservationListDetails}">
                                    ${r.resId}</a></td>
                                    <td>${r.resCheckIn}</td>
                                    <td>${r.resCreatedTime}</td>
                                    
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
                            </c:forEach>
                        
                        </tbody>
                    </table>
                </div>
        
            </div>
        </main>
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