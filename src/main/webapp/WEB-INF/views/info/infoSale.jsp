<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>semiproject</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<style>
.info-section {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
}

.info-card {
	width: 30%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
}

.info-card img {
	width: 100%;
	height: auto;
	border-radius: 5px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
			<%@ include file="../fragments/header.jspf"%>
		</div>

		<div class="container-fluid">
			<%@ include file="../fragments/info-sidebar.jspf"%>
		</div>

		<div class="container">
			<h1 class="text-center"><strong>[물품 판매 리스트]</strong></h1>
			<div class="info-section">
				<div class="info-card">
					<c:url var="bbqset" value="/images/bbqset.png" />
					<img alt = "바베큐세트" src="${bbqset}"/>
					<h3>바베큐 세트</h3>
					<p>(삼겹살 600g + 소세지 + 장작 + 집게 + 불판)</p>
					<p>55,000원</p>
				</div>
				<div class="info-card">
					<c:url var="sweetpotato" value="/images/sweetpotato.png" />
					<img alt = "고구마" src="${sweetpotato}"/>
					<h3>고구마</h3>
					<p>(고구마 200g)</p>
					<p>5,000원</p>
				</div>
				<div class="info-card">
					<c:url var="marshmallow" value="/images/marshmallow.png" />
					<img alt = "마시멜로우" src="${marshmallow}"/>
					<h3>마시멜로우</h3>
					<p>(마시멜로우 1봉지 + 꼬치 5개)</p>
					<p>6,000원</p>
				</div>
				</div>
			<div class="info-section">
				<div class="info-card">
					<c:url var="firewood" value="/images/firewood.png" />
					<img alt = "장작" src="${firewood}"/>
					<h3>장작</h3>
					<p>(장작 1kg)</p>
					<p>11,000원</p>
				</div>
				<div class="info-card">
					<c:url var="butangas" value="/images/butangas.png" />
					<img alt = "부탄가스" src="${butangas}"/>
					<h3>부탄가스</h3>
					<p>(부탄가스 1개)</p>
					<p>2,000원</p>
				</div>
				<div class="info-card">
					<c:url var="aurorapowder" value="/images/aurorapowder.png" />
					<img alt = "오로라가루" src="${aurorapowder}"/>
					<h3>오로라가루</h3>
					<p>불에 뿌리면 멋진 오로라를 볼 수 있어요</p>
					<p>1,500원</p>
				</div>
				</div>
			</div>
		</div>

	<footer>
		<div class="container-fluid" id="wrap">
			<%@ include file="../fragments/footer.jspf"%>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>