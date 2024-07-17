<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

    <c:url value="../../css/mypage_qna_list.css" var="qnaListCss"/>
    <link rel="stylesheet" href="${qnaListCss}">


<style>
.status-waiting {
	color: red !important;
}

.status-completed {
	color: blue !important;
}

.secret-icon {
	width: 16px;
	height: 16px;
	margin-left: 5px;
	vertical-align: middle;
}

ul.pagination {
	display: flex;
	justify-content: center;
	list-style-type: none; /* 순서 없는 리스트 스타일 제거 */
	padding: 0;
}
.pagination .page-link {
            color: #000000; /* 기본 글자색 검정 */
            
        }

.pagination .page-link:hover {
	background-color: #7C9C63; /* 호버 시 배경색 초록 */
	color: #fff; /* 호버 시 글자색 흰색 */
}

.pagination .page-item.active .page-link {
	background-color: #7C9C63; /* 활성화된 페이지 배경색 초록 */
	border-color: #7C9C63; /* 활성화된 페이지 테두리 색상 초록 */
	color: #fff; /* 활성화된 페이지 글자색 흰색 */
}

.btnSearch {
    border-radius: 5px;
    border-color: #7C9C63;
    background-color: #white;
    color: #7C9C63;
}

.btnSearch:hover {
    background-color: #708b58; /* hover 상태에서 약간 밝은 색상으로 변경 */
    border-color: #708b58;
    color: white;
}

.btnList {
    border-radius: 5px;
    border-color: #7C9C63;
    background-color: #white;
    color: #7C9C63;
}

.btnList:hover {
    background-color: #708b58; /* hover 상태에서 약간 밝은 색상으로 변경 */
    border-color: #708b58;
    color: white;
}

.btnCreate {
    border-radius: 5px;
    border-color: #7C9C63;
    background-color: #white;
    color: #7C9C63;
}

.btnCreate:hover {
    background-color: #708b58; /* hover 상태에서 약간 밝은 색상으로 변경 */
    border-color: #708b58;
    color: white;
}
</style>

</head>
<body>
	<div class="wrapper">
		<c:set var="pageTitle" value="QnA List" />
		<%@ include file="../../fragments/header.jspf"%>
		<div class="footer-main-content qna-content">
			<%@ include file="../../fragments/community-sidebar.jspf"%>


			<div class="container-fluid" style="flex:1 padding: 20px;">
				<main>
					<div class="qna-list-container mt-10 card">
                        <h1 class="qna-title align-center mt-2"style="color:#7C9C63; border-bottom: 2px solid #7C9C63;">Q&A</h1>

							<c:url var="qnaSearchPage" value="/community/qna/search" />
							<form method="get" action="${qnaSearchPage}">
								<div class="row">
									<!--  화면을 1:2:1로 나눔 (기본 12개) -->
									<div class="col-2">
										<select class="form-control" name="category">
											<option value="qt">제목</option>
											<option value="qc">내용</option>
											<option value="qtqc">제목+내용</option>
											<option value="qu">작성자</option>
										</select>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" name="keyword"
											placeholder="검색어 입력" required />
									</div>
									<div class="col-2">
										<input type="submit"
											class="form-control btn btnSearch" value="검색" />
									</div>
                                    <div class="col-2">
                                <button type="button" class="form-control btn btnList"
                                onclick="location.href='/semiproject/community/qna/list'">전체 목록</button>
                                  </div>
								
                                </div>
							</form>
                        
						<div class="card-body">
							<!-- 알림 메시지 표시 -->
                            <c:if test="${not empty message}">
                                <div class="alert alert-warning" role="alert">
                                    ${message}
                                </div>
                            </c:if>
						
							<table class="table table-hover">
								<thead>
									<tr style="text-align: center;">
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>수정시간</th>
										<th>답변상태</th>
										<th>조회수</th>
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="qna" items="${qnas}">
										<tr
											onclick="location.href='${pageContext.request.contextPath}/community/qna/details?qnaPostId=${qna.qnaPostId}'"
											style="cursor:pointer; text-align: center;">
											<td class="col-1">${qna.qnaPostId}</td>
											<td class="col-3">
                                            <c:url var="secretIconUrl" value="/images/community/secret.png" />
                                            <c:url var="qnaDetailsPage"	value="/community/qna/details">
													<c:param name="qnaPostId" value="${qna.qnaPostId}"></c:param>
												</c:url>
												
											<a href="${qnaDetailsPage}">
                                                    ${qna.qnaTitle}
                                                    <c:if test="${qna.qnaLock == 1}">
                                                        <img src="${secretIconUrl}" class="secret-icon" alt="비밀글">
                                                    </c:if>
                                                </a>
                                            </td>
                                            <td class="col-2">${qna.qnaUserId}</td>
											<td class="col-2">${qna.qnaModifiedTime}</td>
											<td class="${qna.qnaState == 0 ? 'status-waiting' : 'status-completed'} col-2">
                                                <c:choose>
                                                    <c:when test="${qna.qnaState == 0}">
                                                        답변 대기
                                                    </c:when>
                                                    <c:otherwise>
                                                        답변 완료
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
											<td class="col-1">${qna.qnaViewCnt}</td>
										</tr>
									</c:forEach>
									<c:if test="${empty qnas}">
                                <tr>
                                    <td colspan="6" style="text-align: center;">검색 결과가 없습니다.</td>
                                </tr>
                            </c:if>
								</tbody>
							</table>
                        <a style="text-align: left">총 게시글 수: ${totalCount} 개</a>
                        <div class="text-end">
                        <c:url var="qnaCreatePage" value="/community/qna/create"></c:url>
                        <a class="btn btnCreate" href="${qnaCreatePage}" style="text-align: right">글작성</a>
                        </div>
							<div> 
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item ${pager.page == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${pager.page - 1}&category=${category}&keyword=${keyword}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="i" begin="1" end="${pager.totalPage}">
                    <li class="page-item ${pager.page == i ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&category=${category}&keyword=${keyword}">${i}</a>
                    </li>
                </c:forEach>
                <li class="page-item ${pager.page == pager.totalPage ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${pager.page + 1}&category=${category}&keyword=${keyword}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
		
        </div>
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
</body>
</html>