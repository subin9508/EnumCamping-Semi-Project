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
    
    <c:url value="../css/mypage_qna_list.css" var="qnaListCss"/>
    <link rel="stylesheet" href="${qnaListCss}">
    
    <style>
    a:hover {
      font-weight: bold;
    }
    </style>
</head>
<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content qna-content">
            <%@ include file="../fragments/mypage-sidebar.jspf"%>
            <div class="container-fluid">
                <main>
                    <div class="qna-list-container">
                        <h2 class="qna-title">문의내역</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>문의 번호</th>
                                    <th>제목</th>
                                    <th>수정시간</th>
                                    <th>답변 상태</th>
                                </tr>
                            </thead>
                           
                            <tbody>
                                <c:forEach items="${qnalist}" var="q">
                                    <c:url var="qnaDetails"
                                        value="/user/qna_details">
                                        <c:param name="qnaPostId"
                                            value="${q.qnaPostId}"></c:param>
                                        <c:param name="userId"
                                            value="${user.userId}" />
                                    </c:url>
                                    <tr onclick="location.href='${qnaDetails}'">
                                        <td>${q.qnaPostId}</td>
                                        <td>${q.qnaTitle}</td>
                                        <td>
                                            <fmt:parseDate value="${q.qnaModifiedTime}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm:ss" />
                                            <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        </td>
                                        <td><c:if
                                                test="${q.qnaState == 0}">
                                            답변대기
                                        </c:if> <c:if test="${q.qnaState == 1}">
                                            답변완료
                                        </c:if></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </main>
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