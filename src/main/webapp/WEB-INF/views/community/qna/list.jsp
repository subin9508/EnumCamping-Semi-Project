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

<style>
ul.pagination {
	display: flex;
	justify-content: center;
	list-style-type: none; /* 순서 없는 리스트 스타일 제거 */
	padding: 0;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:set var="pageTitle" value="QnA List" />
		<%@ include file="../../fragments/header.jspf"%>
		<div class="footer-main-content">
			<%@ include file="../../fragments/community-sidebar.jspf"%>

			<div class="container-fluid">
				<main>
					<div>
						<h1 class="align-center mt-2">Q&A</h1>
					</div>

					<div>
						<h6 style="text-align: right">총 게시글 수: ${totalCount}</h6>
					</div>



					<div class="mt-2 card" style="text-align: center">
						<div class="card-header">
							<c:url var="qnaSearchPage" value="/community/qna/search" />
							<form method="get" action="${qnaSearchPage}">
								<div class="row">
									<!--  화면을 1:2:1로 나눔 (기본 12개) -->
									<div class="col-3">
										<select class="form-control" name="category">
											<option value="qt">제목</option>
											<option value="qc">내용</option>
											<option value="qtqc">제목+내용</option>
											<option value="qu">작성자</option>
										</select>
									</div>
									<div class="col-7">
										<input type="text" class="form-control" name="keyword"
											placeholder="검색어 입력" required />
									</div>
									<div class="col-2">
										<input type="submit"
											class="form-control btn btn-outline-info" value="검색" />
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
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="qna" items="${qnas}">
										<tr>
											<td>${qna.qnaPostId}</td>
											<td><c:url var="qnaDetailsPage"
													value="/community/qna/details">
													<c:param name="qnaPostId" value="${qna.qnaPostId}"></c:param>
												</c:url> <a href="${qnaDetailsPage}">${qna.qnaTitle}</a></td>
											<td>${qna.qnaUserId}</td>
											<td>${qna.qnaModifiedTime}</td>
											<td>${qna.qnaViewCnt}</td>
										</tr>
									</c:forEach>
									<c:if test="${empty qnas}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">검색 결과가 없습니다.</td>
                                </tr>
                            </c:if>
								</tbody>
							</table>

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
						<c:url var="qnaCreatePage" value="/community/qna/create"></c:url>
						<a class="btn btn-outline-primary" href="${qnaCreatePage}">글쓰기</a>
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