<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/css/signin.css" var="signinCSS" />
<link rel="stylesheet" href="${signinCSS}" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Enum Semi-Project</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />



<c:url value="../css/header.css" var="headerCss" />
<link rel="stylesheet" href="${headerCss}">

<c:url value="../css/footer.css" var="footerCss" />
<link rel="stylesheet" href="${footerCss}">

<style>
@charset "UTF-8";

.login-container {
	display: flex;
	justify-content: center; /*수평 중앙 정렬 */
	height: 100vh; /* 뷰포트 높이 100% */
	margin-top: 2%;
	margin-bottpm: 2%;
}

.fixed-size-form {
	width: 400px; /* 고정 너비 설정 */
	margin: 0 auto; /* 수평 중앙 정렬 */
	padding: 10px;
}

input.write {
	border-radius: 5px;
	border-color: #001522;
}

.form-group {
	display: flex;
	align-items: center;
}

.form-label {
	margin-right: 10px; /* label과 input 사이의 간격 조정 */
	width: 20%;
	font-size: 12pt;
}

.write {
	flex: 1; /* input 요소가 가능한 많은 공간을 차지하도록 */
    border-color: #DEE2E6;
}

.btn-login {
	border-radius: 5px;
	border-color: #198754;
	background-color: #fff;
	color: #198754;
}

.btn-login:hover {
	background-color: #198754; 
	border-color: #198754;
	color: #fff;
}

a.signup {
	border-radius: 5px;
    border-color: #198754;
    background-color: #fff;
    color: #198754;
}

a.signup:hover {
	background-color: #198754; 
    border-color: #198754;
    color: #fff;
}

.no-border {
	border-width: 0;
}

.right-border {
	border-width: 0 0 1px;
	border-color: #198754;
}

.d-flex {
	display: flex;
}

.align-items-center {
	align-items: center;
}

.justify-content-center {
	justify-content: center;
}

.link-style:hover {
	font-weight: bold;
}

.link-style {
    color: black;
	text-decoration: none; /* 기본 밑줄 제거 */
	padding: 0; /* 기본 패딩 제거 */
	font-size: 1rem; /* 원하는 폰트 크기로 조정 */
	cursor: pointer; /* 커서를 포인터로 변경 */
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../fragments/header.jspf"%>
		<div class="login-container footer-main-content">
			<div class="row">
				<div class="col-12">
					<div class="fixed-size-form mb-5"
						style="border: 1px solid #001522; padding: 10px; margin-top: 5%; margin-left: 200px; margin-right: 200px;
                            border-radius: 5px;">
						<div class="card-header text-center mt-3">
							<h2 style="color: #001522; font-weight: bold;">로그인</h2>
						</div>
						<div class="card-body">

							<!-- 알림 메시지 표시 -->
							<c:if test="${not empty message}">
								<div class="alert alert-warning" role="alert">${message}</div>
							</c:if>

							<form method="post">
								<c:if test="${not empty param.result && param.result eq 'f'}">
									<div class="text-danger" style="text-align: center;">아이디와
										패스워드를 확인하세요.</div>
								</c:if>

								<c:if
									test="${not empty param.result && param.result eq 'inactive'}">
									<div class="text-danger" style="text-align: center;">이
										계정이 비활성화되었습니다.</div>
								</c:if>
								<c:if
									test="${not empty param.result && param.result eq 'deactivated'}">
									<div class="text-danger" style="text-align: center;">비활성화
										기간이 남아있습니다.</div>
								</c:if>


								<div class="form-group mt-5 d-flex align-items-center">
									<label for="userid" class="form-label text-center">아이디</label>
									<input type="text" name="userId" placeholder="아이디"
										class="form-control write" id="userId" style="border-color: #DEE2E6;"required autofocus />
								</div>
								<div class="form-group mt-3 d-flex align-items-center">
									<label for="password" class="form-label text-center">비밀번호</label>
									<input type="password" name="userPassword" placeholder="비밀번호"
										class="form-control write" id="userPassword" style="border-color: #DEE2E6;" required />
								</div>
								<div class="mt-2">
									<input class="form-control btn btn-login mt-2" id="btnSignIn"
										type="submit" value="로그인" />
								</div>
								<div class="mt-2" style="text-align: center;">
									<div class="d-flex align-items-center justify-content-center">
										<a href="/semiproject/user/findid" class="link-style">아이디
											찾기</a>
										<h3 style="margin: 0 10px;">|</h3>
										<a href="/semiproject/user/findpassword" class="link-style">비밀번호
											찾기</a>
									</div>
								</div>
						</div>
						<div class="mt-2" style="text-align: right;">
							<div class="m-3" style="display: inline-block; color: #001522;">
								<h6 style="font-weight: bold;">계정이 없으신가요?</h6>
							</div>
							<a href="signup" id="btnUpdate" class="btn signup"
								style="display: inline-block;">회원가입</a>
						</div>
						</form>
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
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<c:url var="weatherJS" value="/js/weather.js" />
	<script src="${weatherJS}"></script>
</body>
</html>