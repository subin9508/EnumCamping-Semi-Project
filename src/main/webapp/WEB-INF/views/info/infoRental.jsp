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
			<h1 class="text-center"><strong>[물품 대여 리스트]</strong></h1>
			<div class="info-section">
				<div class="info-card">
					<c:url var="burnerset" value="/images/burnerset.png" />
					<img alt = "그리들버너세트" src="${burnerset}"/>
					<h3>그리들&버너 세트</h3>
					<p>*이소가스 불포함</p>
					<p>15,000원</p>
				</div>
				<div class="info-card">
					<c:url var="lantern" value="/images/lantern.jpg" />
					<img alt = "랜턴" src="${lantern}"/>
					<h3>랜턴</h3>
					<p>다양한 랜턴이 있습니다</p>
					<p>3,500원</p>
				</div>
				<div class="info-card">
					<c:url var="electricreelwire" value="/images/electricreelwire.png" />
					<img alt = "전기릴선" src="${electricreelwire}"/>
					<h3>전기릴선</h3>
					<p>전기릴선 20m</p>
					<p>4,000원</p>
				</div>
			</div>
			<div class="info-section">
				<div class="info-card">
					<c:url var="fireplace" value="/images/fireplace.png" />
					<img alt = "난로" src="${fireplace}"/>
					<h3>난로</h3>
					<p>10L 난로 입니다 (기름 불포함)</p>
					<p>20,000원</p>
				</div>
				<div class="info-card">
					<c:url var="electricblanket" value="/images/electricblanket.png" />
					<img alt = "전기장판" src="${electricblanket}"/>
					<h3>전기장판</h3>
					<p>전기장판 2인용</p>
					<p>4,000원</p>
				</div>
				<div class="info-card">
					<c:url var="chair" value="/images/chair.png" />
					<img alt = "캠핑의자" src="${chair}"/>
					<h3>캠핑 의자</h3>
					<p>캠핑계 에르** 캠핑 의자 입니다</p>
					<p>5,000원</p>
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