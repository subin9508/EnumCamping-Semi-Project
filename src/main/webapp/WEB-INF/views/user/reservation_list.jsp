<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
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
        <%@ include file="../fragments/mypage-sidebar.jspf"%>
        <main>
            <div class="card mt-5">
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>예약사이트</th>
                                <th>예약자</th>
                                <th>예약일</th>
                                <th>예약상태</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                        
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