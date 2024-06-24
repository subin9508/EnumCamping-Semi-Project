<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
</head>
<body>
    <div class="container-fluid">
        <div class="container-fluid">
            <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
            <%@ include file="../fragments/header.jspf"%>
        </div>

        <div class="container-fluid">
            <%@ include file="../fragments/intro-sidebar.jspf"%>
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
                                <c:url value="/images/intro2_barbecue.jpg" var="intro2_barbecue" />
                                <img alt="barbecue"
                                    src="${intro2_barbecue}"
                                    width="500" height="400" class="img"
                                    id="barbecueImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>샤워실</h6>
                                <c:url value="/images/intro2_shower.jpg" var="intro2_shower"/>
                                <img alt="shower"
                                    src="${intro2_shower}"
                                    width="500" height="400" class="img"
                                    id="showerImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>화장실</h6>
                                <c:url value="/images/intro2_toilet.jpg" var="intro2_toilet"/>
                                <img alt="toilet"
                                    src="${intro2_toilet}"
                                    width="500" height="400" class="img"
                                    id="toiletImage" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="mt-2 col-4 card text-center">
                                <h6>개수대</h6>
                                <c:url value="/images/intro2_sink.jpg" var="intro2_sink"/>
                                <img alt="sink"
                                    src="${intro2_sink}"
                                    width="500" height="400" class="img"
                                    id="sinkImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>수영장</h6>
                                <c:url value="/images/intro2_pool.jpg" var="intro2_pool"/>
                                <img alt="pool"
                                    src="${intro2_pool}"
                                    width="500" height="400" class="img"
                                    id="poolImage" />
                            </div>
                            <div class="mt-2 col-4 card text-center">
                                <h6>매점</h6>
                                <c:url value="/images/intro2_store.png" var="intro2_store"/>
                                <img alt="store"
                                    src="${intro2_store}"
                                    width="500" height="400" class="img"
                                    id="stroreImage" />
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <div class="container-fluid">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
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
                                <c:url value="/images/intro2_barbecue.jpg" var="intro2_barbecue" />
                                <img src="${intro2_barbecue}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Barbecue">
                            </div>
                            <div class="carousel-item">
                                <c:url value="/images/intro2_shower.jpg" var="intro2_shower"/>
                                <img src="${intro2_shower}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Shower">
                            </div>
                            <div class="carousel-item">
                                <c:url value="/images/intro2_toilet.jpg" var="intro2_toilet"/>
                                <img src="${intro2_toilet}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Toilet">
                            </div>
                            <div class="carousel-item">
                                <c:url value="/images/intro2_sink.jpg" var="intro2_sink"/>
                                <img src="${intro2_sink}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Sink">
                            </div>
                            <div class="carousel-item">
                                <c:url value="/images/intro2_pool.jpg" var="intro2_pool"/>
                                <img src="${intro2_pool}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Pool">
                            </div>
                            <div class="carousel-item">
                                <c:url value="/images/intro2_store.png" var="intro2_store"/>
                                <img src="${intro2_store}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Store">
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
    <c:url var="facilities_js" value="/js/facilities.js" />
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