<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Enum camping</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
        
            <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
</head>
<body>
<div class="wrapper">
    <div class="container-fluid">
        <c:set var="pageTitle" value="QnA List" />
        <%@ include file="../fragments/header.jspf" %>
        
        <%@ include file="../fragments/community-sidebar.jspf"%>
        
        <main>
            <div class="mt-2 card">
                <div class="card-header">
                        <c:url var="qnaSearchPage" value="/community/qnaSearch" />
                    <form method="get" action="${qnaSearchPage}">
                        <div class="row"> <!--  화면을 1:2:1로 나눔 (기본 12개) -->
                            <div class="col-3">
                                <select class="form-control" name="qCategory">
                                    <option value="qt">제목</option>
                                    <option value="qc">내용</option>
                                    <option value="qtqc">제목+내용</option>
                                    <option value="qu">작성자</option>
                                </select>
                            </div>
                            <div class="col-7">
                                <input type="text" class="form-control" name="qKeyword" placeholder="검색어 입력" required />
                            </div>
                            <div class="col-2">
                                <input type="submit" class="form-control btn btn-outline-secondary" value="검색" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>수정시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="qna" items="${qnas}">
                                <tr>
                                    <td>${qna.qPostId}</td>
                                    <td>
                                        <c:url var="qnaDetailsPage" value="/community/qnaDetails">
                                            <c:param name="qPostId" value="${qna.qPostId}"></c:param>
                                        </c:url>
                                        <a href="${qnaDetailsPage}">${qna.qTitle}</a>
                                    </td>
                                    <td>${qna.qUserId}</td>
                                    <td>${qna.qModifiedTime}</td>
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