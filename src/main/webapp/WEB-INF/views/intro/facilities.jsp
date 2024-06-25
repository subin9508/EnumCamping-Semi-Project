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
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
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
                <section class="m-5">
                <div class="mt-2">
                    <div class="card-body">
                     <div class="card-body" style="margin-bottom: 50px;">
                    <h4 style="margin: 50px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;편의시설</h4>
                    <div class="horizontal-divider"></div>
                    <div class="horizontal-divider2"></div>
                    </div>
                        <div class="row">
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>바베큐장</h5>
                                    <div class="image-wrapper" style="width: 100%; height: 100%; object-fit: cover;">
                                    <c:url value="/images/intro2_barbecue.jpg" var="intro2_barbecue" />
                                    <img alt="barbecue"
                                        src="${intro2_barbecue}"
                                        class="img"
                                        height=400px width=500px
                                        id="barbecueImage" />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>샤워실</h5>
                                    <div class="image-wrapper" style="width: 100%; height: 100%; object-fit: cover;">
                                    <c:url value="/images/intro2_shower.jpg" var="intro2_shower"/>
                                    <img alt="shower"
                                        src="${intro2_shower}"
                                        class="img"
                                        height=400px width=500px
                                        id="showerImage" />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>화장실</h5>
                                    <div class="image-wrapper" style="width: 100%; height: 100%; object-fit: cover;">
                                    <c:url value="/images/intro2_toilet.jpg" var="intro2_toilet"/>
                                    <img alt="toilet"
                                        src="${intro2_toilet}"
                                        class="img"
                                        height=400px width=500px
                                        id="toiletImage"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row m-2">
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>개수대</h5>
                                    <c:url value="/images/intro2_sink.jpg" var="intro2_sink"/>
                                    <img alt="sink"
                                        src="${intro2_sink}"
                                        class="img"
                                        height=400px width=500px
                                        id="sinkImage" />
                                </div>
                            </div>
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>수영장</h5>
                                    <c:url value="/images/intro2_pool.jpg" var="intro2_pool"/>
                                    <img alt="pool"
                                        src="${intro2_pool}"
                                        class="img"
                                        height=400px width=500px
                                        id="poolImage" />
                                    </div>
                            </div>
                            <div class="mt-2 col-12 col-md-4 text-center img-container">
                                <div>
                                    <h5>매점</h5>
                                    <c:url value="/images/intro2_store.png" var="intro2_store"/>
                                    <img alt="store"
                                        src="${intro2_store}"
                                        class="img"
                                        height=400px width=500px
                                        id="storeImage" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </section>

            <div class="container-fluid">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </main>

        </div>

    <!-- Modal Structure -->
    <div class="modal" id="imageModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">편의시설</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-title="바베큐장">
                                <c:url value="/images/intro2_barbecue.jpg" var="intro2_barbecue" />
                                <img src="${intro2_barbecue}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Barbecue">
                            </div>
                            <div class="carousel-item" data-title="샤워실">
                                <c:url value="/images/intro2_shower.jpg" var="intro2_shower"/>
                                <img src="${intro2_shower}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Shower">
                            </div>
                            <div class="carousel-item" data-title="화장실">
                                <c:url value="/images/intro2_toilet.jpg" var="intro2_toilet"/>
                                <img src="${intro2_toilet}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Toilet">
                            </div>
                            <div class="carousel-item" data-title="개수대">
                                <c:url value="/images/intro2_sink.jpg" var="intro2_sink"/>
                                <img src="${intro2_sink}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Sink">
                            </div>
                            <div class="carousel-item" data-title="수영장">
                                <c:url value="/images/intro2_pool.jpg" var="intro2_pool"/>
                                <img src="${intro2_pool}" class="d-block w-100" style="width: 500px; height: 400px; object-fit: cover;" alt="Pool">
                            </div>
                            <div class="carousel-item" data-title="매점">
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

</body>
</html>