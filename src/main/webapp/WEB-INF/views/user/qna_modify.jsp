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
    <c:url value="../css/header.css" var="headerCss" />
	<link rel="stylesheet" href="${headerCss}">

	<c:url value="../css/footer.css" var="footerCss" />
	<link rel="stylesheet" href="${footerCss}">
    <c:url value="../css/mypage_qna_modify.css" var="qnaModifyCss"/>
    <link rel="stylesheet" href="${qnaModifyCss}">
	</head>
	<body>
    <div class="wrapper">
        <c:set var="pageTitle" value="QnA Modify" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content qna-content">
            <%@ include file="../fragments/mypage-sidebar.jspf"%>
            <div class="container-fluid">
                <main>
                    <div class="qna-modify-container">
                        <h2 class="qna-title">문의내역 수정</h2>
                        <form id="modifyForm" method="post"
                            action="../user/qna_update">
                            <div class="mb-3">
                                <label for="qnaPostId"
                                    class="form-label">번호</label> <input
                                    id="qnaPostId" class="form-control"
                                    type="text" name="qnaPostId"
                                    value="${qnaDetails.qnaPostId}"
                                    readonly />
                            </div>
                            <div class="mb-3">
                                <label for="qnaTitle" class="form-label">제목</label>
                                <input id="qnaTitle"
                                    class="form-control" type="text"
                                    name="qnaTitle"
                                    value="${qnaDetails.qnaTitle}" />
                            </div>
                            <div class="mb-3">
                                <label for="qnaContent"
                                    class="form-label">내용</label>
                                <textarea id="qnaContent"
                                    class="form-control"
                                    name="qnaContent" rows="5">${qnaDetails.qnaContent}</textarea>
                            </div>
                            <input id="qnaUserId" type="hidden"
                                name="qnaUserId"
                                value="${qnaDetails.qnaUserId}" /> <input
                                type="hidden" name="userId"
                                value="${user.userId}" />
                        </form>
                        <c:if
                            test="${signedInUser eq qnaDetails.qnaUserId}">
                            <div class="card-footer text-end">
                                <button type="submit" form="modifyForm"
                                    class="btn btn-outline-success btnUpdate">업데이트</button>
                                <c:url var="qnaDeletePage"
                                    value="/user/qna_delete">
                                    <c:param name="qnaPostId"
                                        value="${qnaDetails.qnaPostId}" />
                                    <c:param name="userId"
                                        value="${user.userId}" />
                                </c:url>
                                <a
                                    class="btn btn-outline-danger btnDelete"
                                    href="${qnaDeletePage}">삭제하기</a>
                            </div>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>
        <%@ include file="../fragments/footer.jspf"%>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
    crossorigin="anonymous"></script>
    
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        // 변수 생성 (필요한 엘리먼트 찾기) - 작성자는 수정, 삭제할 때 사용안함
        const modifyForm = document.querySelector('form#modifyForm');
        const inputQnAPostId = document.querySelector('input#qnaPostId');
        const inputQnATitle = document.querySelector('input#qnaTitle');
        const textQnAContent = document.querySelector('textarea#qnaContent');
        const btnDelete = document.querySelector('.btnDelete');
        const btnUpdate =document.querySelector('.btnUpdate');
        
     // 삭제 버튼의 클릭 이벤트 리스너 생성:
        btnDelete.addEventListener('click', (e) => {
            // 정말 삭제할건지 확인
            const result = confirm('정말 삭제할까요?');
            if (!result) {
                e.preventDefault(); // 기본 동작 취소
            }
        });
        
        // 업데이트 버튼의 클릭 이벤트 리스너 생성:
        btnUpdate.addEventListener('click', (e) => {
            e.preventDefault(); // 기본 제출 동작 취소
            // 제목과 내용이 비어있는지 체크
            if (inputQnATitle.value === '' || textQnAContent.value === '') {
                alert('제목과 내용은 반드시 입력하세요.');
                return;
            }

            // 제목과 내용이 전부다 채워져 있을 때 업데이트 내용을 저장할지 확인
            const result = confirm('변경 내용을 저장할까요?');
            if (result) {
                modifyForm.submit(); // 폼 제출
            }
        });
    });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
	</body>
</html>