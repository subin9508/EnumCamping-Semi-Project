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
<link rel="stylesheet" href="../../css/header.css">
<link rel="stylesheet" href="../../css/footer.css">
    <c:url value="../../css/mypage_qna_details.css" var="qnaDetailsCss" />
    <link rel="stylesheet" href="${qnaDetailsCss}">
<style>
.card h2 {
    color: #7C9C63;
    margin-bottom: 1.5rem;
    border-bottom: 2px solid #7C9C63;
    padding-bottom: 0.5rem;
}
.btn-register {
    border-color: #7C9C63;
    color: #7C9C63;
}

.btn-register:hover {
    border-color: #7C9C63;
    background-color: #7C9C63;
    color: white;
}

</style>
</head>
<body>
	<div class="qna-wrapper">
		<c:set var="pageTitle" value="QnA Details" />
		<%@ include file="../../fragments/header.jspf"%>
		<div class="footer-main-content qna-content">
			<%@ include file="../../fragments/community-sidebar.jspf"%>

			<div class="container-fluid">
				<main>
				<div class="qna-details-container">

					<!-- 알림 메시지 표시 -->
					<c:if test="${not empty sessionScope.message}">
						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							${sessionScope.message}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<c:remove var="message" scope="session" />
					</c:if>
							<h2>${qna.qnaTitle}</h2>
							<form>
								<div class="mt-2">
									<label for="qnaPostId" class="form-label">번호</label> <input
										id="qnaPostId" class="form-control" type="text"
										value="${qna.qnaPostId}" readonly />
								</div>
								<div class="mt-2">
									<label for="qnaTitle" class="form-label">제목</label> <input
										id="qnaTitle" class="form-control" type="text"
										value="${qna.qnaTitle}" readonly />
								</div>
								<div class="mt-2">
									<label for="qnaContent" class="form-label">내용</label>
									<textarea id="qnaContent" class="form-control" rows="5"
										readonly>${qna.qnaContent}</textarea>
								</div>
								<div class="mt-2">
									<label for="qnaUserId" class="form-label">작성자</label> <input
										id="qnaUserId" class="form-control" type="text"
										value="${qna.qnaUserId}" readonly />
								</div>
								<div class="mt-2">
									<label for="qnaCreatedTime" class="form-label" hidden>작성
										시간</label> <input id="qnaCreatedTime" class="form-control"
										type="hidden" value="${qna.qnaCreatedTime}" readonly />
								</div>
								<div class="mt-2">
									<label for="qnaModifiedTime" class="form-label" hidden>최종
										수정 시간</label> <input id="qnaModifiedTime" class="form-control"
										type="hidden" value="${qna.qnaModifiedTime}" readonly />
								</div>
								<!-- 비밀글 체크박스, 관리자 또는 작성자인 경우에만 표시 -->
								<c:if test="${userRole == 0 || signedInUser == qna.qnaUserId}">
                                    <div class="mt-2 form-check">
                                        <input class="form-check-input" type="checkbox" id="qnaLock"
                                            name="qnaLock" <c:if test="${qna.qnaLock ==1}">checked</c:if>
                                            disabled> 
                                        <label class="form-check-label" for="qnaLock"> 비밀글 </label>
                                    </div>
                                </c:if>
								<input type="hidden" id="userRole" value="${userRole}">
							</form>
						<div class="card-footer">
							<c:url var="qnaListPage" value="/community/qna/list" />
							<a class="btn btn-outline-primary" href="${qnaListPage}">목록보기</a>

							<!-- 로그인 사용자 아이디와 작성자 아이디가 같은 경우에만 수정하기 버튼을 보여줌 -->
							<c:if
								test="${signedInUser != null && signedInUser == qna.qnaUserId}">
								<c:url var="qnaModifyPage" value="/community/qna/modify">
									<c:param name="qnaPostId" value="${qna.qnaPostId}" />
								</c:url>
								<a class="btn btn-outline-primary" style="float: right"
									href="${qnaModifyPage}">수정하기</a>
							</c:if>

						</div>

						<!-- 답변 목록 -->
						<!--                 <div class="mt-2 card"> -->
						<!--                     <div class="card-header"> -->
						<!--                         <h2>Comment</h2> -->
						<!--                     </div> -->
						<div id="answersContainer" style="font-size: 1.2em;">
							<!-- 답변 목록이 여기에 동적으로 추가됩니다. -->
							<c:forEach var="answer" items="${answers}">
								<div class="answer">
									<p>${answer.content}</p>
									<small>작성자: ${answer.userId}</small><br> <small>작성시간:
										${answer.createdTime}</small>
								</div>
							</c:forEach>
						</div>
						<!-- 답변 등록 폼 -->
						<c:if test="${userRole == 0}">
							<!--                 <div class="mt-2 card"> -->
							<!--                     <div class="card-body"> -->
							<div class="mt-2 d-flex align-items-center">
								
								<div class="flex-grow-1 me-3" >
									<textarea class="form-control flex-grow-1" rows="2" id="answerContent"
										placeholder="답변을 작성해주세요" style="font-size:1.1em;"></textarea>
										</div>
								
									<button class="btn btn-register" style="font-size:1.5em;" id="btnRegisterAnswer" >답변 등록</button>
							</div>
							<!--                     </div> -->
							<!--                 </div> -->
						</c:if>

						<!--                 </div> -->

					</div>
				</main>

				<!--         <section> -->
				<!--             <div class="mt-2 card"> -->
				<!--                 <div class="card-header d-inline-flex gap-1"> -->
				<!--                     댓글 접기/펼치기 기능 버튼 -->
				<!--                     <button class="btn btn-secondary" -->
				<!--                         id="btnToggleComment">댓글 보기</button> -->
				<!--                 </div> -->
				<!--                 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 -->
				<!--                 <div class="card-body collapse" id="collapseComments"> -->
				<!--                     댓글 등록 -->
				<!--                     <div class="mt-2 card card-body"> -->
				<!--                         <div class="mt-2 row"> -->
				<!--                             <div class="col-10"> -->
				<!--                                 댓글 입력 -->
				<!--                                 <textarea class="form-control" rows="3" -->
				<!--                                     id="qcContent" placeholder="댓글 내용"></textarea> -->
				<!--                                 댓글 작성자 아이디를 로그인한 사용자의 아이디로 설정 -->
				<%--                                 <input class="d-none" id="qcUserId" value="${signedInUser}" /> --%>
				<!--                             </div> -->
				<!--                             <div class="col-2"> -->
				<!--                                 <button class="btn btn-outline-success" -->
				<!--                                     id="btnRegisterComment">등록</button> -->
				<!--                             </div> -->
				<!--                         </div> -->
				<!--                     </div> -->

				<!--                     포스트에 달려 있는 댓글 목록을 보여줄 영역 -->
				<!--                     <div class="mt-2" id="QnAComment"></div> -->
				<!--                 </div> -->
				<!--             </div> -->
				<!--         </section> -->

				<!--         댓글 업데이트 모달(다이얼로그) -->
				<!--         <div id="commentModal" class="modal" tabindex="-1">  -->
				<!--             <div class="modal-dialog"> -->
				<!--                 <div class="modal-content"> -->
				<!--                     <div class="modal-header"> -->
				<!--                         <h5 class="modal-title">댓글 업데이트</h5> -->
				<!--                         <button type="button" class="btn-close" -->
				<!--                             data-bs-dismiss="modal" aria-label="Close"></button> -->
				<!--                     </div> -->
				<!--                     <div class="modal-body"> -->
				<!--                         수정할 댓글 아이디(번호) -->
				<!--                         <input class="d-none" id="modalCommentId" /> -->
				<!--                         수정할 댓글 내용 -->
				<!--                         <textarea class="form-control" id="modalCommentText"></textarea> -->
				<!--                     </div> -->
				<!--                     <div class="modal-footer"> -->
				<!--                         <button type="button" class="btn btn-outline-secondary" -->
				<!--                             data-bs-dismiss="modal">취소</button> -->
				<!--                         <button type="button" class="btn btn-outline-primary" -->
				<!--                             id="btnUpdateComment">저장</button> -->
				<!--                     </div> -->
				<!--                 </div> -->
				<!--             </div> -->
				<!--         </div> -->

			</div>
		</div>
		<%@ include file="../../fragments/footer.jspf"%>
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
		const userRole = '${userRole}';
	</script>

	<c:url var="qnaanswersJS" value="/js/qnaanswers.js" />
	<script src="${qnaanswersJS}"></script>

	<c:url var="commentsJS" value="/js/comments.js" />
	<script src="${commentsJS}"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<c:url var="weatherJS" value="/js/weather.js" />
	<script src="${weatherJS}"></script>
</body>
</html>