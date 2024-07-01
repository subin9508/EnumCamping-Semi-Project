<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Enum camping</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
	</head>
	<body>
	<div class="wrapper">
            <c:set var="pageTitle" value="QnA Modify" />
            <%@ include file="../../fragments/header.jspf" %>
  <div class="footer-main-content">            
                    <%@ include file="../../fragments/community-sidebar.jspf"%>
		<div class="containere-fluid">
            
            <main>
                <div class="mt-2 card">
                    <div class="card-header">
                        <h2> Q&A 수정 페이지</h2>
                    </div>
                    <div class="card-body">
                        <form id="modifyForm">
                            <div class="mt-2">
                                <label for="qnaPostId" class="form-label">번호</label>
                                <input id="qnaPostId" class="form-control" type="text"
                                    name="qnaPostId" value="${qna.qnaPostId}" readonly />
                            </div>
                            <div class="mt-2">
                                <label for="qnaTitle" class="form-label">제목</label>
                                <input id="qnaTitle" class="form-control" type="text"
                                    name="qnaTitle" value="${qna.qnaTitle}" />
                            </div>
                            <div class="mt-2">
                                <label for="qnaContent" class="form-label">내용</label>
                                <textarea id="qnaContent" class="form-control"
                                    name="qnaContent" rows="5">${qna.qnaContent}</textarea>
                    </div>
                            <div class="d-none">
                                <label for="qnaUserId" class="form-label">작성자</label>
                                <input id="qnaUserId" class="form-control" type="text"
                                    value="${qna.qnaUserId}" readonly />
                            </div>
                        </form>
                    </div>
                    <!-- 로그인 사용자 아이디와 글 작성자가 같은 경우에만 버튼을 보여줌. -->
                     <c:if test="${signedInUser eq qna.qnaUserId}">
                        <div class="card-footer">
                            <button id="btnDelete" class="btn btn-outline-danger">삭제</button>
                            <button id="btnUpdate" class="btn btn-outline-success">업데이트</button>
                        </div>
                      </c:if>
                </div>
            </main>
        </div>
        </div>
        <%@ include file="../../fragments/footer.jspf"%>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
        
        <c:url var="qnaModifyJs" value="/js/qna_modify.js" /> 
        <script src="${qnaModifyJs}"></script>
        
                    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   	<c:url var="weatherJS" value="/js/weather.js" />
  	<script src="${weatherJS}"></script>
	</body>
</html>