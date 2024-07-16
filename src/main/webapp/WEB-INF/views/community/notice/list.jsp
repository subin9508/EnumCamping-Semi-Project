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
    <c:url value="../../css/reservation_list.css" var="reservationListCss" />
    <link rel="stylesheet" href="${reservationListCss}">
</head>
<body>
<div class="wrapper">
    <%@ include file="../../fragments/header.jspf" %>
<div class="footer-main-content">    
    <%@ include file="../../fragments/community-sidebar.jspf"%>

    <div class=" container-fluid">
        
        <main>
            <div>
            </div>
        
        
        
            <div class="mt-10 card" style="margin-right:50px;">
                <div class="card-header">
                <h1 class="card-title align-center mt-2">공지사항</h1>
                    <c:url var="noticeSearchPage" value="/community/notice/search" />
                    <form action="${noticeSearchPage }">
                        <div class="row">
                            <div class="col-2">
                                <select class="form-control" name= "category">
                                    <option value="t">제목</option>
                                    <option value="c">내용</option>
                                    <option value="tc">제목+내용</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="keyword" placeholder="검색어 입력" required/>
                            </div>
                            <div class="col-2">
                                <input type="submit" class="form-control btn btn-outline-success" value="검색"/>
                            </div>
                            <div class="col-2">
                                <button type="button" class="form-control btn btn-outline-success"
                                onclick="location.href='/semiproject/community/notice/list'">전체 목록</button>
                            </div>

                        
                        </div>
                    </form>
                    
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                            <tr style="text-align: center;">
                                <th>번호</th>
                                <th>제목</th>
                                <th>수정시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${notices}">
                                <tr onclick="location.href='${pageContext.request.contextPath}/community/notice/details?id=${n.id}'" 
                                                style="cursor:pointer; text-align: center;">
                                    <td class="col-2">${n.id}</td>
                                    <td class="col-7">
                                        ${n.title}
                                    </td>
                                    <td class="col-3">${n.modifiedTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-5">
                <c:if test="${userRole eq 0}">
                <button type="button" onclick="location.href ='create'"
                class="btn btn-outline-success">공지사항 작성</button>
                </c:if>
            </div>
           
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