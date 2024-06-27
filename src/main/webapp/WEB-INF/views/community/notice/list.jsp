<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ENUM CAMPING</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
</head>
<body>
<div class="wrapper">
    <%@ include file="../../fragments/header.jspf" %>
<div class="footer-main-content">    
    <%@ include file="../../fragments/community-sidebar.jspf"%>

    <div class=" container-fluid">
        
        <main>
            <div>
                <h1 class="align-center mt-2">공지사항</h1>
            </div>
        
        
        
            <div class="mt-10 card">
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>수정시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${notices}">
                                <tr>
                                    <td class="col-3">${n.id}</td>
                                    <td class="col-6">
                                        <c:url var="noticeDetailsPage" value="/community/notice/details">
                                            <c:param name="id" value="${n.id}"></c:param>
                                        </c:url>
                                        <a href="${noticeDetailsPage}">${n.title}</a>
                                    </td>
                                    <td class="col-3">${n.modifiedTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
        
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-5">
                <c:if test="${userRole eq 'admin'}">
                <button type="button" onclick="location.href ='create'"
                class="btn btn-info">공지사항 작성</button>
                </c:if>
            </div>
            

            
            
        </main>
    </div>
</div>   
    <%@ include file="../../fragments/footer.jspf" %>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>