<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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



</head>

<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">

            <main style="margin-bottom: 5%; margin-top: 5%">
                <div
                    class="container-fluid d-flex justify-content-center">
                    <h1>예약 및 주문</h1>
                </div>

                <div
                    class="container-fluid d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">개인 정보 수집 동의</h5>
                            <p class="card-text">저희 사이트는 귀하의 개인 정보를
                                수집합니다. 수집된 정보는 사용자 식별, 서비스 제공 등의 목적으로
                                사용됩니다. 자세한 정보는 개인 정보 보호 정책을 참조하시기 바랍니다.
                            </p>
                            <div class="form-check">
                                <input class="form-check-input"
                                    type="checkbox" value=""
                                    id="agreeCollect"> <label
                                    class="form-check-label"
                                    for="agreeCollect"> 개인 정보
                                    수집에 동의합니다. </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="container-fluid d-flex justify-content-center mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">개인 정보 제공 동의</h5>
                            <p class="card-text">귀하의 개인 정보는 서비스 제공을
                                목적으로 일부 외부 제휴사에게 제공될 수 있습니다. 자세한 정보는 개인
                                정보 보호 정책을 참조하시기 바랍니다.</p>
                            <div class="form-check">
                                <input class="form-check-input"
                                    type="checkbox" value=""
                                    id="agreeProvide"> <label
                                    class="form-check-label"
                                    for="agreeProvide"> 개인 정보
                                    제공에 동의합니다. </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="container-fluid d-flex justify-content-center mt-3">
                    <button id="paymentButton" class="btn btn-primary"
                        disabled>결제하기</button>
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
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
    <script>
					// 체크 박스 상태 변경 시 호출될 함수
					function checkAgreements() {
						const agreeCollect = document
								.getElementById('agreeCollect').checked;
						const agreeProvide = document
								.getElementById('agreeProvide').checked;

						// 모든 체크 박스가 선택되었을 때 버튼 활성화
						if (agreeCollect && agreeProvide) {
							document.getElementById('paymentButton')
									.removeAttribute('disabled');
						} else {
							document.getElementById('paymentButton')
									.setAttribute('disabled', 'disabled');
						}
					}

					// 체크 박스 상태 변화 감지
					document.getElementById('agreeCollect').addEventListener(
							'change', checkAgreements);
					document.getElementById('agreeProvide').addEventListener(
							'change', checkAgreements);
				</script>

</body>
</html>