<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />

<title>Find ID</title>
<style>
.container {
	background: #fff;
	padding: 2rem;
	border-radius: 0.5rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
}

.form-label {
	font-weight: bold;
}

.btn-custom {
	background-color: #007bff;
	color: white;
	border: none;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.result-container {
	margin-top: 1rem;
}

.hidden {
	display: none;
}
</style>
</head>
<body>

	<div class="wrapper">
		<%@ include file="../fragments/header.jspf"%>
		<div class="footer-main-content">
			<div class="card mt-5" style="width: 50rem; margin: auto;">
				<div class="card-header ">
					<h2 class="mt-2">아이디 찾기</h2>
				</div>
				<div class="card-body">
					<c:url var="findIdPage" value="/user/findid" />
					<form class="form-horizontal" role="form" method="POST"
						action="${findIdPage}">
						<div class="mb-3">
							<label for="user_name" class="form-label">이름</label> <input
								type="text" name="user_name" class="form-control" id="user_name"
								placeholder="이름" required autofocus>
						</div>
						<div class="mb-3">
							<label for="user_email" class="form-label">이메일</label> <input
								type="email" name="user_email" class="form-control"
								id="user_email" placeholder="이메일" required>
						</div>
						<button type="submit" class="btn btn-success"
							style="float: right;" id="submitBtn" disabled>찾기</button>
						<c:url var="SignInPage" value="/user/signin" />
						<a href="${SignInPage}" class="btn btn-outline-primary ">로그인</a>
					</form>
				</div>
				<div id="messageContainer" class="mt-3">
					<c:if test="${not empty message}">
						<div class="alert alert-danger">${message}</div>
					</c:if>
				</div>
			</div>
		</div>
		<%@ include file="../fragments/footer.jspf"%>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var submitBtn = document.getElementById("submitBtn");
			var nameInput = document.getElementById("user_name");
			var emailInput = document.getElementById("user_email");

			function validateInputs() {
				if (nameInput.value.trim() !== ""
						&& emailInput.value.trim() !== "") {
					submitBtn.disabled = false;
				} else {
					submitBtn.disabled = true;
				}
			}

			nameInput.addEventListener("input", validateInputs);
			emailInput.addEventListener("input", validateInputs);
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<c:url var="weatherJS" value="/js/weather.js" />
</body>
</html>
