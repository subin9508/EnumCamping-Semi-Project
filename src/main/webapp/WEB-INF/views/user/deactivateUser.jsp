<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Enum Camping</title>
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
	<%@ include file="../fragments/header.jspf"%>
	<%@ include file="../fragments/mypage-sidebar.jspf"%>

	<div class="content">
		<main class="main-content">
			<div class="slider">

				<div class="content-1">
					<br>
					<h1>
						<strong>@@님!</strong>
					</h1>
					<h1>
						<strong>탈퇴하면 enum 캠핑장과의 추억이</strong>
					</h1>
					<h1>
						<strong>모두 사라져요.</strong>
					</h1>
				</div>
				<div class="info-text">
					<br>
					<h3>
						삭제되는 정보
						</h3>
						<h5>· 계정 및 프로필 정보</h5>
						<h5>· 예약 정보</h5>

						<br>
						<br>

							<h3>유지되는 정보</h3>
							<h5>· 리뷰 및 사진</h5>
							<h5>(작성자 정보 없이 노출)</h5>
							<hr />
							<h3>탈퇴 진행 시</h3>
								<h3>삭제된 정보는 복구가 불가합니다.</h3>
								<h5>상기 내용을 모두 확인하셨다면 회원 탈퇴 버튼을 눌러주세요.</h5>
								<br>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" 
					data-bs-target="#deleteAccount"> 회원 탈퇴 </button>
				</div>
				<br>
				<br>
				
				 <!-- 회원 탈퇴 모달 -->
    <div class="modal fade" id="deleteAccount" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteAccountModalLabel">회원 탈퇴</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-danger">경고: 회원 탈퇴 시 30일 동안 재가입이 불가능합니다.</p>
                    <form id="deactivateForm">
                        <!-- hidden input 필드로 사용자 ID 전달 -->
                        <input type="hidden" id="id" name="id" value="${loginUserId}">
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" id="deactivateButton" class="btn btn-danger">탈퇴</button>
                </div>
            </div>
        </div>
    </div>
				
				
			</div>
		</main>
	</div>
		
	<%@ include file="../fragments/footer.jspf"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="weatherJS" value="/js/weather.js" />
	<script src="${weatherJS}"></script>
	
    <c:url var="deactivateJS" value="/js/deactivateUser.js" />
    <script src="${deactivateJS}"></script>
</body>
</html>