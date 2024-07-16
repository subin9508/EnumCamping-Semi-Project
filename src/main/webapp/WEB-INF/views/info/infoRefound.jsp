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

<c:url value="../css/header.css" var="headerCss" />
<link rel="stylesheet" href="${headerCss}">

<c:url value="../css/footer.css" var="footerCss" />
<link rel="stylesheet" href="${footerCss}">
<style>
.table th, .table td {
	width: 5%
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../fragments/header.jspf"%>

		<div class="footer-main-content">
			<%@ include file="../fragments/info-sidebar.jspf"%>

			<main main class="main-content"
				style="margin-left: 300px; margin-top: 50px;">
				<div class="slider">

					<div class="content-1">
						<br>
						<h1>
							<strong>[환불규정]</strong>
						</h1>
					</div>
					<br>

					<div class="info-section">
						<div class="info-text">
							<br>
							<h5>- 올바른 예약 문화를 위하여 저희 캠핑장에서는 예약 취소시 환불 기준을 아래와 같이 운영하고 있으니
								확인하시고 예약해 주시기 바랍니다.</h5>
							<br>
							<h5>- 보호자 동반 없는 미성년자 예약 발견시, 환불 없이 예약취소됩니다.</h5>
							<br>
							<h5>- 예약일 변경시 발생하는 수수료는 취소 수수료와 동일하게 적용되오니 예약시 신중히 생각하시고 결정해
								주시기 바랍니다.</h5>
						</div>
					</div>
					<br> <br /> <br>
					<table class="table table-strped table-hover" style="width: 70%">
						<thead>
							<tr style="word-spacing: 57px; text-align: center">
								<th>이용 당일</th>
								<th>이용 1일전</th>
								<th>이용 2일전</th>
								<th>이용 3일전</th>
								<th>이용 4일전</th>
								<th>이용 5일전</th>
								<th>이용 6일전</th>
								<th>이용 7일전</th>
								<th>이용 8일전</th>
								<th>이용 9일전</th>
								<th>이용 10일전</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: center">
								<td>0% 환불</td>
								<td>0% 환불</td>
								<td>0% 환불</td>
								<td>50% 환불</td>
								<td>60% 환불</td>
								<td>70% 환불</td>
								<td>80% 환불</td>
								<td>90% 환불</td>
								<td>100% 환불</td>
								<td>100% 환불</td>
								<td>/</td>
							</tr>
						</tbody>
					</table>
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />

				</div>

			</main>

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