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
    
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
</head>
<body>
<div class="wrapper">
    <div class="container-fluid">
        <c:set var="pageTitle" value="QnA Details" />
        <%@ include file="../fragments/header.jspf"%>
        
        <%@ include file="../fragments/community-sidebar.jspf"%>
        
        <main>
            <div class="mt-2 card">
                <div class="card-header">
                    <h2>Q&A 상세보기</h2>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mt-2">
                            <label for="id" class="form-label">번호</label>
                            <input id="id" class="form-control"
                                type="text" value="${qna.id}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="title" class="form-label">제목</label>
                            <input id="title" class="form-control"
                                type="text" value="${qna.title}"
                                readonly />
                        </div>
                        <div class="mt-2">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" class="form-control"
                                rows="5" readonly>${qna.content}</textarea>
                        </div>
                        <div class="mt-2">
                            <label for="userId" class="form-label">작성자</label>
                            <input id="userId" class="form-control"
                                type="text" value="${qna.userId}"
                                readonly />
                        </div>
                        <div class="mt-2">
                            <label for="createdTime" class="form-label">작성
                                시간</label> <input id="createdTime"
                                class="form-control" type="text"
                                value="${qna.createdTime}" readonly />
                        </div>
                        <div class="mt-2">
                            <label for="modifiedTime" class="form-label">최종
                                수정 시간</label> <input id="modifiedTime"
                                class="form-control" type="text"
                                value="${qna.modifiedTime}" readonly />
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <!-- 로그인 사용자 아이디와 작성자 아이디가 같은 경우에만 수정하기 버튼을 보여줌 -->
                    <c:if test="${signedInUser eq qna.userId}">
                    <c:url var="qnaModifyPage" value="/community/qnaModify">
                        <c:param name="userId" value="${qna.userId}" />
                    </c:url>
                    <a class="btn btn-outline-primary"
                        href="${qnaModifyPage}">수정하기</a>
                    </c:if>
                </div>
            </div>
        </main>
        
        <section>
            <div class="mt-2 card">
                <div class="card-header d-inline-flex gap-1">
                    <!-- 댓글 접기/펼치기 기능 버튼 -->
                    <button class="btn btn-secondary"
                        id="btnToggleComment">댓글 보기</button>
                </div>
                <!-- 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 -->
                <div class="card-body collapse" id="collapseComments">
                    <!-- 댓글 등록 -->
                    <div class="mt-2 card card-body">
                        <div class="mt-2 row">
                            <div class="col-10">
                                <!-- 댓글 입력 -->
                                <textarea class="form-control" rows="3"
                                    id="ctext" placeholder="댓글 내용"></textarea>
                                <!-- 댓글 작성자 아이디를 로그인한 사용자의 아이디로 설정 -->
                                <input class="d-none" id="username" value="${signedInUser}" />
                            </div>
                            <div class="col-2">
                                <button class="btn btn-outline-success"
                                    id="btnRegisterComment">등록</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 포스트에 달려 있는 댓글 목록을 보여줄 영역 -->
                    <div class="mt-2" id="comments"></div>
                </div>
            </div>
        </section>
        
        <!-- 댓글 업데이트 모달(다이얼로그) -->
        <div id="commentModal" class="modal" tabindex="-1"> 
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">댓글 업데이트</h5>
                        <button type="button" class="btn-close"
                            data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 수정할 댓글 아이디(번호) -->
                        <input class="d-none" id="modalCommentId" />
                        <!-- 수정할 댓글 내용 -->
                        <textarea class="form-control" id="modalCommentText"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary"
                            data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-outline-primary"
                            id="btnUpdateComment">저장</button>
                    </div>
                </div>
            </div>
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