<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/facilities.css" />
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Enum Semi-Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
</head>
<body>
    <div class="container-fluid">
        <div class="container-fluid">
            <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
            <%@ include file="../fragments/header.jspf"%>
        </div>

        <div class="container-fluid">
            <c:set value="소개" var="sidebarTitle" scope="page" />
            <c:set value="캠핑장 소개" var="page1" scope="page" />
            <c:set value="시설배치도" var="page2" scope="page" />
            <c:set value="편의시설" var="page3" scope="page" />
            <c:set value="주변 여행지" var="page4" scope="page" />
            <c:set value="캠핑장위치" var="page5" scope="page" />
            <c:set value="facilities" var="pageUrl3" scope="page" />
            <c:set value="travel" var="pageUrl4" scope="page" />
            <%@ include file="../fragments/sidebar.jspf"%>
        </div>

            <main>
                <div class="mt-2 card">
                    <div class="card-header text-center ">
                        <h3>소개</h3>
                    </div>
                    <div class="card-body">
                        <div class="text-center">
                            <h4>FACILITIES</h4>
                            <h6>Enum 캠핑장은 모두가 편안하게 즐기실 수 있는 부대시설을
                                갖추고 있습니다.</h6>
                        </div>
                        <div class="row">
                            <div class="mt-2 col-4 card text-center">
                                <h6>바베큐장</h6>
                                <img alt="barbecue"
                                    src="${pageContext.request.contextPath}/static/images/intro2_barbecue.jpg"
                                    width="500" height="400" class="img"
                                    id="barbecueImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>샤워실</h6>
                                <img alt="shower"
                                    src="${pageContext.request.contextPath}/static/images/intro2_shower.jpg"
                                    width="500" height="400" class="img"
                                    id="showerImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>화장실</h6>
                                <img alt="toilet"
                                    src="${pageContext.request.contextPath}/static/images/intro2_toilet.jpg"
                                    width="500" height="400" class="img"
                                    id="toiletImage" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="mt-2 col-4 card text-center">
                                <h6>개수대</h6>
                                <img alt="sink"
                                    src="${pageContext.request.contextPath}/static/images/intro2_sink.jpg"
                                    width="500" height="400" class="img"
                                    id="sinkImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>수영장</h6>
                                <img alt="pool"
                                    src="${pageContext.request.contextPath}/static/images/intro2_pool.jpg"
                                    width="500" height="400" class="img"
                                    id="poolImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>매점</h6>
                                <img alt="store"
                                    src="${pageContext.request.contextPath}/static/images/intro2_pool.jpg"
                                    width="500" height="400" class="img"
                                    id="stroreImage" />
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

    <!-- Modal Structure -->
    <div class="modal" id="imageModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">편의시설</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_barbecue.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Barbecue">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_shower.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Shower">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_toilet.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Toilet">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_sink.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Sink">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_pool.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Pool">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/static/images/intro2_store.jpg" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Store">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    <!-- JavaScript 코드 -->
    <c:url var="facilities_js" value="/static/js/facilities.js" />
    <script src="${facilities_js}"></script>
    
    <!-- JavaScript for Modal Image Slider -->
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
                const carousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'));

                // 슬라이더를 클릭된 이미지로 이동
                carousel.to(imgIndex);

                // 모달 띄우기
                const modal = new bootstrap.Modal(document.getElementById('imageModal'));
                modal.show();
            });
        });
    });
    </script>
</body>
</html>