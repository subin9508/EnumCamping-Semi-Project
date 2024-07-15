<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Enum camping</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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
        <c:set var="pageTitle" value="QnA Details" />
        <%@ include file="../fragments/header.jspf"%>
 <div class="footer-main-content">         
        <%@ include file="../fragments/mypage-sidebar.jspf"%>
        
    <div class="container-fluid">
        <main>
            <div class="mt-2 card">
                <div class="card-header">
                    <h2>Q&A 상세</h2>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mt-2">
                            <label for="qnaPostId" class="form-label">번호</label>
                            <input id="qnaPostId" class="form-control"
                                type="text" value="${qnaDetails.qnaPostId}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="qnaTitle" class="form-label">제목</label>
                            <input id="qnaTitle" class="form-control"
                                type="text" value="${qnaDetails.qnaTitle}"
                                readonly />
                        </div>
                        <div class="mt-2">
                            <label for="qnaContent" class="form-label">내용</label>
                            <textarea id="qnaContent" class="form-control"
                                rows="5" readonly>${qnaDetails.qnaContent}</textarea>
                        </div>
                        <div class="mt-2">
                            <label for="qnaUserId" class="form-label">작성자</label>
                            <input id="qnaUserId" class="form-control"
                                type="text" value="${qnaDetails.qnaUserId}"
                                readonly />
                        </div>
                        <div class="mt-2">
                            <label for="qnaCreatedTime" class="form-label" hidden>작성
                                시간</label> <input id="qnaCreatedTime"
                                class="form-control" type="hidden"
                                value="${qnaDetails.qnaCreatedTime}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="qnaModifiedTime" class="form-label" hidden>최종
                                수정 시간</label> <input id="qnaModifiedTime"
                                class="form-control" type="hidden"
                                value="${qnaDetails.qnaModifiedTime}" readonly />
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                <c:url var="qnaListPage" value="/user/qna_list">
        			<c:param name="userId" value="${user.userId}" />
    			</c:url>
                    <a class="btn btn-outline-info"
                        href="${qnaListPage}">목록보기</a>
                
                    <!-- 로그인 사용자 아이디와 작성자 아이디가 같은 경우에만 수정하기 버튼을 보여줌 -->
                    <c:if test="${signedInUser eq qnaDetails.qnaUserId}">
                    <c:url var="qnaModifyPage" value="/user/qna_modify">
                        <c:param name="qnaPostId" value="${qnaDetails.qnaPostId}" />
                        <c:param name="userId" value="${user.userId}" />
                    </c:url>
                    <a class="btn btn-outline-primary"
                        href="${qnaModifyPage}">수정하기</a>
                    </c:if>
                </div>
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
        
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <script>
    // 세션에 저장된 로그인 사용자 아이디를 자바스크립트 변수에 저장
    // -> comment.js 파일에서 이용할 수 있도록 하기 위해.
    const signedInUser = '${signedInUser}';
    </script>
    
    <!-- 우리가 만드는 JS 파일 -->
    <!-- <c:url var="commentsJS" value="/js/comments.js" />
    <script src="${commentsJS}"></script> -->
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   	<c:url var="weatherJS" value="/js/weather.js" />
  	<script src="${weatherJS}"></script>
</body>
</html>