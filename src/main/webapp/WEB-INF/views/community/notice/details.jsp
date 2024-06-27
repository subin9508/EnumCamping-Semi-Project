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
    <%@ include file="../../fragments/intro-sidebar.jspf"%>

        <main>
            <div class="mt-2 card">
                <div class="card-header">
                    <h2>공지사항 상세보기</h2>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mt-2">
                            <label for="id" class="form-label">번호</label>
                            <input id="id" class="form-control"
                                type="text" value="${notice.id}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="title" class="form-label">제목</label>
                            <input id="title" class="form-control"
                                type="text" value="${notice.title}"
                                readonly />
                        </div>
                        <div class="mt-2">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" class="form-control"
                                rows="5" readonly>${notice.content}</textarea>
                        </div>
                        <div class="mt-2">
                            <label for="createdTime" class="form-label">작성
                                시간</label> <input id="createdTime"
                                class="form-control" type="text"
                                value="${notice.createdTime}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="modifiedTime" class="form-label">최종
                                수정 시간</label> <input id="modifiedTime"
                                class="form-control" type="text"
                                value="${notice.modifiedTime}" readonly />
                        </div>
                    </form>
                </div>

        
                
                <!-- signedUser 체크 -->
                <div class="card-footer">
                    <c:if test="${userRole eq 'admin'}">
                    <button type="button" class="btn delete">삭제하기</button>
                    <c:url var="noticeModifyPage" value="/community/notice/modify">
                        <c:param name="id" value="${notice.id}" />
                    </c:url>
                    <a class="btn btn-outline-primary"
                        href="${noticeModifyPage}">수정하기</a>
                    </c:if>
                </div>

            </div>
        </main>
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