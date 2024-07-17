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
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
        <c:url value="../../css/notice_modify.css" var="noticeModifyCss" />
    <link rel="stylesheet" href="${noticeModifyCss}">
</head>
<body>
    <div class="modify-wrapper">
    <%@ include file="../../fragments/header.jspf"%>
    <div class="footer-main-content not-content">
    <%@ include file="../../fragments/community-sidebar.jspf"%>
    <div class="container-fluid">
        <main>
        <div class="not-modify-container">
                    <h2 class="not-title">공지 수정</h2>
                
                    <form id="modifyForm">
                        <div class="mb-3">
                            <label for="id" class="form-label">번호</label>
                            <input id="id" class="form-control" type="text"
                                name="notPostId" value="${notice.notPostId}" readonly />
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input id="title" class="form-control" type="text"
                                name="notTitle" value="${notice.notTitle}" />
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" class="form-control" 
                                name="notContent" rows="5">${notice.notContent}</textarea>
                        </div>
                    </form>

                <div class="card-footer">
                    <button id="btnUpdate" class="btn btn-outline-success">업데이트</button>
                </div>

            </div>
         </main>
         </div>
    </div>
                
    <%@ include file="../../fragments/footer.jspf"%>
</div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
    <c:url var="notice_js" value="/js/notice_modify.js" />
    <script src="${notice_js}"></script>
</body>
</html>