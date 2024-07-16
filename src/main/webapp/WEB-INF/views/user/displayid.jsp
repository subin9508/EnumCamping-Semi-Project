<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Title</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	background: #fff;
	padding: 2rem;
	border-radius: 0.5rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
	text-align: center;
}

.btn-custom {
	margin-top: 1rem;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../fragments/header.jspf"%>
		<div class="footer-main-content">
			<div class="card mt-5 text-center"
				style="width: 30rem; margin: auto;">
				<h2 class="card-header ">아이디 찾기 결과</h2>
				<div class="card-body mt-3">
					<p>
						회원님의 아이디는 <strong>${userId}</strong> 입니다.
					</p>
				</div>
				<div class="mb-3">
					<c:url var="findPasswordPage" value="/user/findpassword" />
					<a href="${findPasswordPage}"
						class="btn btn-outline-info ">비밀번호 찾기</a>
					<c:url var="SignInPage" value="/user/signin" />
					<a href="${SignInPage}" class="btn btn-outline-success">로그인</a>
				</div>
			</div>
		</div>
		<%@ include file="../fragments/footer.jspf"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<c:url var="weatherJS" value="/js/weather.js" />
</body>

</html>