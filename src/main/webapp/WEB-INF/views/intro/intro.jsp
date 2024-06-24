<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑장 소개</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">

<style>
body, html {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
   
}

.container-fluid {
    padding: 0;
}

main {
    flex: 1;
}

.banner {
    text-align: center;
    padding: 20px;
    background-color: #f8f8f8;
    height: 12vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.facility-section {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 20px;
}




.slider-container {
    flex: 1;
    display: flex;
    justify-content: center;
}

.slider {
    width: 720px;
    height: 480px;
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
    margin-left: -200px;
}

ul.imgs li {
    position: absolute;
    opacity: 0;
    list-style: none;
    padding: 10;
    margin: 10;
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
   
    box-shadow: 0 4px 8px rgba(0,0,0,0.1), 0 6px 20px rgba(0,0,0,0.1);
}

.bullets {
    position: absolute;
    left: 35%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}

.bullets label {
    display: inline-block;
    border-radius: 50%;
    background-color: #f7f2e7;
    width: 20px;
    height: 20px;
    cursor: pointer;
}

.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1),
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2),
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3) {
    background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1),
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2),
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3) {
    opacity: 1;
    z-index: 1;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 30vh;
    padding: 0 20px;
    box-sizing: border-box;
}

.box1 {
    border: 5px solid #000000;
    padding: 20px;
    flex: none;
    text-align: center;
    width: 250px;
    height: 200px;
    margin: 10px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-radius: 15px;
}

.box2 {
    border: 5px solid #000000;
    padding: 20px;
    flex: none;
    text-align: center;
    width: 250px;
    height: 200px;
    margin: 10px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-radius: 15px;
}

.box3 {
    border: 5px solid #000000;
    padding: 20px;
    flex: none;
    text-align: center;
    width: 250px;
    height: 200px;
    margin: 10px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-radius: 15px;
}

</style>
</head>

<body>
    <div class="container-fluid">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page"/> 
        <%@ include file="../fragments/header.jspf" %>
    </div>

    <main>
        <section class="banner">
            <h5>ENUM 캠핑장 소개</h5>
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
                            <img src="https://cdn.pixabay.com/photo/2020/03/15/03/07/camping-4932314_1280.jpg" alt="Image 2">
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
        </section>

        <section>
            <div class="container">
                <div class="box1">
                    <h4>1. 자연친화적</h4>
                    <h5>ENUM 캠핑장은 산도 있고 물도 있고~ 나무도 가득하고~ 공기도 좋고~ 다 좋아요^_^</h5>
                </div>
                <div class="box2">
                    <h4>2. 프라이빗 공간</h4>
                    <h5>전 구역 데크존으로 편리하고, 프라이빗하게 자연을 즐기실 수 있습니다~</h5>
                </div>
                <div class="box3">
                    <h4>3. 힐링</h4>
                    <h5>지친 일상을 벗어나 ENUM 캠핑장에서 자연이 주는 힐링을 느끼시길 바랍니다~</h5>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container-fluid" id="wrap">
            <%@ include file="../fragments/footer.jspf" %>
        </div>
		
		
	</footer>
    
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>