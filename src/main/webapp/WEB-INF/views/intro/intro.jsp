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
</head>

<body>
 <div class="container-fluid">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page"/> 
        <%@ include file="../fragments/header.jspf" %>
    </div>
    
    

    <main>
        <section class="banner">
            <h1>ENUM 캠핑장 소개</h1>
            <p>Enjoy Nature Under Moonlight</p>
        </section>

        <section class="facility-section">
<div class="intro-sidebar">
            <c:set var="pageTitle" value="Home" scope="page" />
            <%@ include file="../fragments/intro-sidebar.jspf"%>
        </div>
            <div class="slider-container">
                <div class="slider">
                <input type="radio" name="slide" id="slide1" checked> 
                <input type="radio" name="slide" id="slide2"> 
                <input type="radio" name="slide" id="slide3">  
                    <ul class="imgs">
                    <li>
                        <img src="https://img.freepik.com/premium-photo/multi-colored-tents-against-cloudy-sky-during-sunny-day_1048944-1271265.jpg?w=996" alt="Image 1">
                    </li>
                    <li>
                        <img src="https://img.freepik.com/premium-photo/scenic-view-of-tents-in-forest-against-lake_1048944-11878042.jpg?w=740" alt="Image 2">
                    </li>
                    <li>
                        <img src="https://cdn.pixabay.com/photo/2017/07/17/16/44/besides-the-cancer-time-to-nearby-lodging-2513008_1280.jpg" alt="Image 3">
                    </li>
                </ul>
                    
                    <div class="bullets">
                    <label for="slide1"></label> 
                    <label for="slide2"></label> 
                    <label for="slide3"></label>

                </div>
            </div>        
         </div>
  
<style>

.banner {
    text-align: center;
    padding: 20px;
    background-color: #f8f8f8;
    height: 15vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.facility-section {
        display: flex;
        justify-content: center; /* 부모 요소가 가운데 정렬되도록 설정 */
        align-items: flex-start; /* 자식 요소들이 상단에 정렬되도록 설정 */
        padding: 20px;
    }
    
      .intro-sidebar {
        flex: 0 0 200px; /* 사이드바의 너비를 고정으로 설정 */
        margin-right: 20px; /* 사이드바와 슬라이더 사이의 간격을 설정 */
    }
    .slider-container {
        flex: 1; /* 남은 공간을 슬라이더가 차지하도록 설정 */
        display: flex;
        justify-content: center; /* 슬라이더를 수평으로 가운데 정렬 */
    }

.slider {
    width: 720px;
    height: 520px;
    position: relative;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.slider input[type=radio] {
    display: none;
}
 ul.imgs {
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }
ul.imgs li {
    position: absolute;
    opacity: 0;
    list-style: none;
    padding: 0;
    margin: 0;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: opacity 1s;
}
ul.imgs li img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    border-radius: 15px; /* 이미지 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0,0,0,0.1), 0 6px 20px rgba(0,0,0,0.1); /* 그림자 효과 */
}
.bullets {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label {
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1) {
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2) {
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3) {
    background-color: #fff;
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1) {
    opacity: 1;
    z-index: 1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2) {
    opacity: 1;
    z-index: 1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3) {
    opacity: 1;
    z-index: 1;
}


</style>

        </section>

        <body>
            <div class="container">
                <div class="box"><h3>1. 자연친화적</h3>
                <h4>ENUM 캠핑장은 산도 있고 물도 있고~ 나무도 가득하고~
                    공기도 좋고~ 다 좋아요^_^
                </h4>
                </div>
                <div class="box"><h3>2. 프라이빗한 공간</h3>
                <h4>전 구역 데크존으로 편리하고, 프라이빗하게
                자연을 즐기세요~
                </h4></div>
                <div class="box"><h3>3. 힐링</h3>
                <h4>지친 일상을 벗어나 ENUM 캠핑장에서 자연이 주는 
                힐링을 느끼시길 바랍니다~
                </h4></div>
            </div>

            <style>
 .container {
       
        display: flex;
        justify-content: center;
        align-items: center;
        height: 30vh;
        padding: 0 20px;
        box-sizing: border-box;
        }

        .box {
        background-color: lightblue;
        padding: 20px;
        border: 1px solid #ccc;
        flex: none; /* 모든 div가 동일한 너비를 갖도록 설정 */
        text-align: center; /* 텍스트 중앙 정렬 */
        width: 250px; /* 고정 너비 */
        height: 200px; /* 고정 높이 */
        margin: 10px; /* 상하좌우에 일정 간격을 두도록 설정 */
        box-sizing: border-box; /* 패딩과 테두리를 포함하여 박스 크기 계산 */
        display: flex; /* Flexbox 설정 */
        flex-direction: column; /* 자식 요소를 수직으로 배치 */
        justify-content: center; /* 수직 중앙 정렬 */
    }
</style>



<!--  <div class="container-fluid" id="wrap">
        <%@ include file="../fragments/footer.jspf" %>
    </div> 
    -->

        </body>



    </main>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>