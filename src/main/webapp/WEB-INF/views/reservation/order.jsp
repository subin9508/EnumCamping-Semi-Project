<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
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
.custom-form {
	width: 100%; /* 폼의 너비를 70%로 설정 */
	margin: auto; /* 가운데 정렬 */
}

.form-container {
	margin-bottom: 50px; /* 폼 사이 간격을 설정 */
}

.table {
	width: 100%;
	table-layout: fixed;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle;
	padding: 8px;
}

.card {
	width: 100%;
}

.no-padding {
	padding-left: 0;
	padding-right: 0;
}
</style>

</head>

<body>


	<div class="wrapper">
		<c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
		<%@ include file="../fragments/header.jspf"%>
		<div class="footer-main-content">

			<main
				style="width: 70%; margin-left: auto; margin-right: auto; margin-bottom: 5%; margin-top: 5%">
				<div class="container-fluid d-flex justify-content-center">
					<h1>예약 및 주문</h1>
				</div>
				<br /> <br />
				<div class="container">

					<table class="table">
						<thead>
							<tr>
								<th style="background-color: #7C9C63; color: white;">선택 구역</th>
								<th style="background-color: #7C9C63; color: white;">가격</th>
							</tr>
						</thead>
						<tbody id="areaOrder">
							<c:forEach items="${reservationDetails}" var="item">
								<c:choose>
									<c:when test="${item.itemId ge 1 and item.itemId le 4}">
										<c:set var="area" value="1구역" />
										<c:set var="price" value="${item.itemAmount}" />
									</c:when>
									<c:when test="${item.itemId ge 5 and item.itemId le 8}">
										<c:set var="area" value="2구역" />
										<c:set var="price" value="${item.itemAmount}" />
									</c:when>
									<c:when test="${item.itemId ge 9 and item.itemId le 12}">
										<c:set var="area" value="3구역" />
										<c:set var="price" value="${item.itemAmount}" />
									</c:when>
									<c:when test="${item.itemId ge 13 and item.itemId le 16}">
										<c:set var="area" value="4구역" />
										<c:set var="price" value="${item.itemAmount}" />
									</c:when>
									<c:when test="${item.itemId ge 17 and item.itemId le 20}">
										<c:set var="area" value="5구역" />
										<c:set var="price" value="${item.itemAmount}" />
									</c:when>
								</c:choose>
							</c:forEach>
							<tr>
								<td>${area}</td>
								<td>${price}원</td>
							</tr>

						</tbody>
					</table>
					<br /> <br />


					<table class="table">
						<thead>
							<tr>
								<th style="background-color: #7C9C63; color: white;">물품 이름</th>
								<th style="background-color: #7C9C63; color: white;">물품 사진</th>
								<th style="background-color: #7C9C63; color: white;">수량</th>
								<th style="background-color: #7C9C63; color: white;">총가격</th>
							</tr>
						</thead>
						<tbody id="orderDetails">
							<c:set var="hasItems" value="false" />
							<c:forEach var="rs" items="${reservationDetails}">
								<c:if test="${rs.itemId gt 20}">
									<c:set var="hasItems" value="true" />
									<tr>
										<td>${rs.itemName}</td>
										<td class="img-container" style="width: 20%;"><c:url
												value="${rs.itemImg}" var="itemImgUrl" /> <img
											alt="${rs.itemName}" src="${itemImgUrl}" class="img"
											id="itemImg-${rs.itemId}"
											style="height: 150px; width: 150px;" /></td>
										<td>${rs.itemQuantity}</td>
										<td>${rs.itemAmount}원</td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${!hasItems}">
								<tr>
									<td colspan="4" style="text-align: center;">선택하신 구매/대여물품이
										없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
                        <div class="mt-2">
                                <label for="requirement" class="form-label">요청사항</label>
                                <textarea id="requirement" class="form-control" rows="5" readonly><c:set var="requirementValue" value="${empty reservationMaster.requirement ? '요청없음' : reservationMaster.requirement}" />
                                ${requirementValue}
                                </textarea>
                            </div>
					<br /> <br />
				</div>


				<div class="container">
					<div class="form-container">
						<form class="custom-form">


							<div class="mt-2 form-group">
								<label for="userName">이름:</label> <input type="text"
									class="form-control" id="userName" value="${user.userName}"
									readonly>
							</div>
							<div class="mt-2 form-group">
								<label for="userEmail">이메일:</label> <input type="text"
									class="form-control" id="userEmail" value="${user.userEmail}"
									readonly>
							</div>
							<div class="mt-2 form-group">
								<label for="userPhone">휴대폰 번호:</label> <input type="text"
									class="form-control" id="userPhone" value="${user.userPhone}"
									readonly>
							</div>
						</form>
					</div>

					<!-- 두 번째 폼 -->
					<div class="form-container">
						<form class="custom-form">
							<div
								class="container-fluid d-flex no-padding justify-content-center">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">개인 정보 수집 동의</h5>
										<p class="card-text">저희 사이트는 귀하의 개인 정보를 수집합니다. 수집된 정보는 사용자
											식별, 서비스 제공 등의 목적으로 사용됩니다. 자세한 정보는 개인 정보 보호 정책을 참조하시기 바랍니다.</p>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="agreeCollect"> <label class="form-check-label"
												for="agreeCollect"> 개인 정보 수집에 동의합니다. </label>
										</div>
									</div>
								</div>
							</div>

							<div
								class="container-fluid d-flex no-padding justify-content-center mt-3">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">개인 정보 제공 동의</h5>
										<p class="card-text">귀하의 개인 정보는 서비스 제공을 목적으로 일부 외부 제휴사에게
											제공될 수 있습니다. 자세한 정보는 개인 정보 보호 정책을 참조하시기 바랍니다.</p>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="agreeProvide"> <label class="form-check-label"
												for="agreeProvide"> 개인 정보 제공에 동의합니다. </label>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- 총 결제 금액 표시 -->
				<div class="container-fluid d-flex justify-content-center mt-3">
					<h3>
						총 결제 금액: <span id="totalAmount">0</span>
					</h3>
				</div>
				<br />
				<div class="container-fluid d-flex justify-content-center mt-3">
					<!--  <form action="../reservation/reservationConfirm"
                        method="get">  -->
					<input type="hidden" name="resId" id="resId"
						value="${reservationMaster.resId}" />
					<button id="btnPayment" class="btn btn-primary" disabled>결제하기</button>
					<!-- </form>  -->
				</div>
			</main>

			<div class="container-fluid" id="wrap">
				<%@ include file="../fragments/footer.jspf"%>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


	<c:url var="payment_js" value="/js/payment.js" />
	<script src="${payment_js}"></script>

	<c:url var="weatherJS" value="/js/weather.js" />
	<script src="${weatherJS}"></script>
	<script>
		// 페이지 로딩 시 초기 버튼 상태 설정
		document.addEventListener('DOMContentLoaded', function() {
			checkAgreements(); // 초기 버튼 상태 설정을 위해 함수 호출
		});

		// 체크 박스 상태 변경 시 호출될 함수
		function checkAgreements() {
			const agreeCollect = document.getElementById('agreeCollect').checked;
			const agreeProvide = document.getElementById('agreeProvide').checked;

			// 모든 체크 박스가 선택되었을 때 버튼 활성화
			if (agreeCollect && agreeProvide) {
				document.getElementById('btnPayment').removeAttribute(
						'disabled');
			} else {
				document.getElementById('btnPayment').setAttribute('disabled',
						'disabled');
			}
		}

		// 체크 박스 상태 변화 감지
		document.getElementById('agreeCollect').addEventListener('change',
				checkAgreements);
		document.getElementById('agreeProvide').addEventListener('change',
				checkAgreements);

		// 페이지 로딩 시 주문 상세 항목들의 총 금액 계산하여 표시
		document.addEventListener('DOMContentLoaded', function() {
			calculateTotalAmount(); // 초기화시 총 금액 계산 함수 호출
		});

		// 총 결제 금액 계산 함수
		function calculateTotalAmount() {
			let totalAmount = 0;

			// 각 주문 상세 항목의 금액을 모두 합산
			const itemAmountElements = document
					.querySelectorAll('#orderDetails td:nth-child(4)');
			//const areaPrice = document.querySelector('input#resAreaPrice');
			const areaPrice = document
					.querySelectorAll('#areaOrder td:nth-child(2)');
			console.log(areaPrice);
			itemAmountElements.forEach(function(element) {
				totalAmount += parseInt(element.textContent.replace('원', ''),
						10);
			});

			areaPrice.forEach(function(element) {
				totalAmount += parseInt(element.textContent.replace('원', ''),
						10);
			});

			// 총 결제 금액을 화면에 반영
			const totalAmountElement = document.getElementById('totalAmount');
			totalAmountElement.textContent = totalAmount + '원';
		}
		
        
	</script>
    

</body>
</html>