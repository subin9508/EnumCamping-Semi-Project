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
        <header class="mt-2 p-4 bg-primary text-white text-center">
            <h1>Enum Camping</h1>
        </header>
        
        <main>
            <div class="mt-2 card">
                <div class="card-header text-center ">
                    <h3>소개</h3>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <h4>FACILITIES</h4>
                        <h6>Enum 캠핑장은 모두가 편안하게 즐기실 수 있는 부대시설을 갖추고 있습니다.</h6>
                    </div>
                    <div class="row">
                        <div class="mt-2 col-4 card text-center">
                            <h6>바베큐장</h6>
                            <img alt="barbecue" src="${pageContext.request.contextPath}/static/images/intro2_barbecue.jpg" width="500" height="400"
                                class="img" id="barbecueImage"/>
                            <div id="myModal1" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage1">
                            </div>
                        </div>
                        <div class="mt-2 col-4 card text-center">
                            <h6>샤워실</h6>
                            <img alt="shower" src="${pageContext.request.contextPath}/static/images/intro2_shower.jpg" width="500" height="400"
                                class="img" id="showerImage"/>
                            <div id="myModal2" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage2">
                            </div>
                        </div>
                        <div class="mt-2 col-4 card text-center">
                            <h6>화장실</h6>
                            <img alt="toilet" src="${pageContext.request.contextPath}/static/images/intro2_toilet.jpg" width="500" height="400"
                                class="img" id="toiletImage"/>
                            <div id="myModal3" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage3">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="mt-2 col-4 card text-center">
                            <h6>개수대</h6>
                            <img alt="sink" src="${pageContext.request.contextPath}/static/images/intro2_sink.jpg" width="500" height="400"
                                class="img" id="sinkImage"/>
                            <div id="myModal4" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage4">
                            </div>
                        </div>
                        <div class="mt-2 col-4 card text-center">
                            <h6>수영장</h6>
                            <img alt="pool" src="${pageContext.request.contextPath}/static/images/intro2_pool.jpg" width="500" height="400"
                                class="img" id="poolImage"/>
                            <div id="myModal5" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage5">
                            </div>
                        </div>
                        <div class="mt-2 col-4 card text-center">
                            <h6>매점</h6>
                            <img alt="store" src="${pageContext.request.contextPath}/static/images/intro2_store.jpg" width="500" height="400"
                                class="img" id="stroreImage"/>
                            <div id="myModal5" class="modal">
                                <span class="close">&times;</span> 
                                <img class="modal_content" id="modalImage5">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    <!-- JavaScript 코드 -->
    <c:url var="facilities_js" value="/static/js/facilities.js" />
    <script src="${facilities_js}"></script>
</body>
</html>