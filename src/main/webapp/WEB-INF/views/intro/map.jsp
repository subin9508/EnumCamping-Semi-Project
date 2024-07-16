<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑 소개 페이지</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">

<c:url value="/css/map.css" var="mapCss" />
<link rel="stylesheet" href="${mapCss}">

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
            <%@ include file="../fragments/intro-sidebar.jspf"%>


            <main class="main-content"
                style="margin-left: 300px; margin-top: 50px;">
                <div class="content-1">
                    <br>
                    <h1>
                        <strong>[캠핑장 위치]</strong>
                    </h1>
                </div>
                <section class="facility-section">
                    <div class="slider-container">
                        <div class="slider">

                            <div class="descriptions">
                                <div class="term">
                                    <div class="div2">전화번호</div>
                                </div>
                                <div class="details">
                                    <div class="_012-345-6789">033-1234-5678</div>
                                </div>
                            </div>
                            <div class="descriptions2">
                                <div class="term">
                                    <div class="div2">유의사항</div>
                                </div>
                                <div class="details2">
                                    <div class="item">
                                        <div class="div3">
                                            예약시 주차 등록한 차량만 주차 가능합니다. <br />
                                            <br /> 들어오는 입구가 좁아 조심히
                                            들어오셔야 됩니다.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="background">
                                <div id="map"></div>
                            </div>
                            <div class="background2">
                                <div class="container1">

                                    <div class="div7">주소: 강원 홍천군 영귀미면 수타사로 227-18 수타사 계곡</div>
                                </div>
                            </div>
                            <div class="horizontal-border">
                                <div class="descriptions3">
                                    <div class="term2">
                                        <div class="div2">대중교통 이용시</div>
                                    </div>
                                    <div class="details3">
                                        <div class="div6">
                                            홍천 터미널 -> 수타사행 버스(30~35분 소요)
                                            -> 수타사 하차 -> 도보로 650m(약 11분 소요)
                                             <br /> <br /> 홍천 터미널
                                            -> 신봉행 버스(30~35분 소요) -> 구종점
                                            하차 -> 도보로 1.4KM(약 23분 소요)
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
             <%@ include file="../fragments/footer.jspf"%>
        </div>
    </div>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5f576fbc4bf2a712d8f138a0b208af6"></script>
    <script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.698868, 127.957925), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker(
							{
								position : new kakao.maps.LatLng(37.698868,
										127.957925), // 마커의 좌표
								map : map
							// 마커를 표시할 지도 객체
							});

					// 마커 위에 표시할 인포윈도우를 생성한다
					// var infowindow = new kakao.maps.InfoWindow({
					//  content : '<div style="padding:5px;">아이티윌</div>' // 인포윈도우에 표시할 내용
					// });

					// 인포윈도우를 지도에 표시한다
					// infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					// map.setCenter(cooder);
				</script>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

</body>
</html>