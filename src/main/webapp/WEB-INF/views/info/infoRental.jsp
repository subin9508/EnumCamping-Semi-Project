<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <c:url value="/css/facilities.css" var="facilitiesCSS" />
    <link rel="stylesheet" href="${facilitiesCSS}" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Enum Semi-Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />       
    
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
    
</head>
<body>
<div class="wrapper">

    <%@ include file="../fragments/header.jspf"%>
<div class="footer-main-content">
    <%@ include file="../fragments/info-sidebar.jspf"%>

    <main class="main-content"
                style="margin-left: 300px; margin-top: 50px;">
    <div class="content-1">
        <br>
        <h1>
            <strong>[대여 물품 목록]</strong>
        </h1>
        <br>
        <div class="content-2" style="margin-right: 35px;">
        <div class="facilities-section">        
            
            <div class="facilities-card">
                <h5>그리들&버너세트</h5>
                <div class="img-container">
                    <c:url value="/images/info/burnerset.png"
                        var="info2_burner" />
                    <img alt="sink" src="${info2_burner}" class="img"
                        height=400px width=500px id="sinkImage" />
                </div>
            </div>
            <div class="facilities-card">
                <h5>랜턴</h5>
                <div class="img-container">
                    <c:url value="/images/info/lantern.jpg"
                        var="info2_lantern" />
                    <img alt="shower" src="${info2_lantern}" class="img"
                        height=400px width=500px id="showerImage" />
                </div>
            </div>
            <div class="facilities-card">
                <h5>전기릴선</h5>
                <div class="img-container">
                    <c:url value="/images/info/electricreelwire.png"
                        var="info2_reel" />
                    <img alt="toilet" src="${info2_reel}" class="img"
                        height=400px width=500px id="toiletImage" />
                </div>

            </div>

        </div>


        <div class="facilities-section">
            <div class="facilities-card">
                <h5>10L난로</h5>
                <div class="img-container">
                    <c:url value="/images/info/fireplace.png"
                        var="info2_fire" />
                    <img alt="barbecue" src="${info2_fire}"
                        class="img" height=400px width=500px
                        id="barbecueImage" />

                </div>
            </div>
            <div class="facilities-card">
                <h5>전기장판</h5>
                <div class="img-container">
                    <c:url value="/images/info/electricblanket.png"
                        var="info2_electric" />
                    <img alt="campfire" src="${info2_electric}" class="img"
                        height=400px width=500px id="campFireImage" />
                </div>
            </div>
            <div class="facilities-card">
                <h5>캠핑의자</h5>
                <div class="img-container">
                <c:url value="/images/info/chair.png"
                    var="info2_chair" />
                <img alt="store" src="${info2_chair}" class="img"
                    height=400px width=500px id="storeImage" />
                </div>
            </div>
        </div>
    </div>

    

    <!-- Modal Structure -->
    <div class="modal" id="imageModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">물품 대여 리스트</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item" data-title="그리들&버너 세트">
                                <c:url value="/images/info/burnerset.png" var="info2_burner"/>
                                <img src="${info2_burner}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Sink">
                                <div class="d-flex flex-column align-items-center mt-2" >
                                <h5 style="color: black;">15,000원</h5>
                                <p style="color: gray;">*이소가스 미포함</p>
                            </div>
                            </div>
                            <div class="carousel-item" data-title="랜턴">
                                <c:url value="/images/info/lantern.jpg" var="info2_lantern"/>
                                <img src="${info2_lantern}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Shower">
                                <div class="d-flex flex-column align-items-center mt-2">
                                <h5 style="color: black;">3,500원</h5>
                                <p style="color: gray;">다양한 랜턴 보유</p>
                            </div>
                            </div>
                            <div class="carousel-item" data-title="전기릴선">
                                <c:url value="/images/info/electricreelwire.png" var="info2_reel"/>
                                <img src="${info2_reel}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Toilet">
                                <div class="d-flex flex-column align-items-center mt-2">
                                <h5 style="color: black;">3,000원</h5>
                                <p style="color: gray;">*20m</p>
                            </div>
                            </div>
                            
                            <div class="carousel-item active" data-title="10L 난로">
                                <c:url value="/images/info/fireplace.png" var="info2_fire" />
                                <img src="${info2_fire}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Barbecue">
                                <div class="d-flex flex-column align-items-center mt-2">
                                <h5 style="color: black;">20,000원</h5>
                                <p style="color: gray;">*기름 미포함</p>
                            </div>
                            </div>
                            <div class="carousel-item" data-title="전기장판">
                                <c:url value="/images/info/electricblanket.png" var="info2_electric"/>
                                <img src="${info2_electric}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Pool">
                                <div class="d-flex flex-column align-items-center mt-2">
                                <h5 style="color: black;">4,000원</h5>
                                <p style="color: gray;">*2인용</p>
                            </div>
                            </div>
                            <div class="carousel-item" data-title="캠핑 의자">
                                <c:url value="/images/info/chair.png" var="info2_chair"/>
                                <img src="${info2_chair}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Store">
                                <div class="d-flex flex-column align-items-center mt-2">
                                <h5 style="color: black;">5,000원</h5>
                                <p style="color: gray;">다양한 캠핑의자 보유</p>
                            </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    </main>
</div>
    <%@ include file="../fragments/footer.jspf"%>
</div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    <!-- JavaScript 코드 -->
    <c:url var="infoRental_js" value="/js/infoRental.js" />
    <script src="${infoRental_js}"></script>
    
    <!-- JavaScript to handle image clicks and update modal title on slide change -->
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // 모든 이미지 요소를 가져오기
        const images = document.querySelectorAll('.img');
        
        // 이미지 클릭 이벤트 핸들러 추가
        images.forEach((image, index) => {
            image.addEventListener('click', (event) => {
                // 클릭된 이미지의 인덱스 가져오기
                const imgIndex = index;

                // Bootstrap Carousel 인스턴스 가져오기
                const carouselElement = document.getElementById('carouselExampleControls');
                const carousel = new bootstrap.Carousel(carouselElement);

                // 슬라이더를 클릭된 이미지로 이동
                carousel.to(imgIndex);

                // 모달 띄우기
                const modal = new bootstrap.Modal(document.getElementById('imageModal'));
                modal.show();

                // 초기 modal-title 설정
                const activeItem = carouselElement.querySelector('.carousel-item.active');
                const newTitle = activeItem.getAttribute('data-title');
                document.getElementById('modalTitle').textContent = newTitle;
            });
        });

        // Carousel 슬라이드 변경 시 modal-title 업데이트
        var carouselElement = document.getElementById('carouselExampleControls');
        carouselElement.addEventListener('slid.bs.carousel', function (e) {  // 'slid.bs.carousel' 이벤트로 변경
            var activeItem = e.relatedTarget;
            var newTitle = activeItem.getAttribute('data-title');
            document.getElementById('modalTitle').textContent = newTitle;
        });
    });
</script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

</body>
</html>