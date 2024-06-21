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
        <c:set var="pageTitle" value="Home" scope="page" />
    </div>
    <header>
        <div class="logo">Camping Site</div>
       
    </header>

    <main>
        <section class="banner">
            <h1>ENUM 캠핑장 소개</h1>
            <p>Enjoy Nature Under Moonlight</p>
        </section>
        <section class="facility-section">
            <div class="slider">
                <div class="slides">    
                    <div class="slide">
                        <img src="https://img.freepik.com/premium-photo/multi-colored-tents-against-cloudy-sky-during-sunny-day_1048944-1271265.jpg?w=996" alt="Image 1" />
                    </div>
                    <div class="slide">
                        <img src="https://img.freepik.com/premium-photo/scenic-view-of-tents-in-forest-against-lake_1048944-11878042.jpg?w=740" alt="Image 2" />
                    </div>
                    <div class="slide">
                        <img src="https://cdn.pixabay.com/photo/2017/07/17/16/44/besides-the-cancer-time-to-nearby-lodging-2513008_1280.jpg" alt="Image 3" />
                    </div>
                </div>
            </div>
           
            

            <style>
.banner {
            text-align: center;
            padding: 20px;
            background-color: #f8f8f8;
            height: 20vh; /* 배너 섹션 높이 설정 */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
.slider {
            width: 100%;
            height: 50vh; /* 슬라이더 섹션 높이 설정 */
            overflow: hidden;
            position: relative;
        }
.slides {
            display: flex;
            width: 300%; /* 각 슬라이드가 33.33% 너비를 가질 것이므로 전체 너비는 300% */
            height: 100%;
            transition: transform 0.5s ease-in-out;
        }

.slide {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

.slide img {
            max-width: 80%;
            height: auto;
            object-fit: cover;
            cursor: pointer; /* 이미지 클릭 가능하도록 포인터 커서 설정 */
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
            justify-content: center; /* 수평으로 중앙 정렬 */
            align-items: center; /* 수직으로 중앙 정렬 */
            height: 30vh; /* 화면 높이의 30%를 차지하도록 설정 */
            padding: 0 20px; /* 좌우 패딩을 추가하여 끝부분에서 벗어나지 않도록 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함하여 박스 크기 계산 */
        }

        .box {
            background-color: lightblue;
            padding: 20px;
            border: 1px solid #ccc;
            flex: 1; /* 모든 div가 동일한 너비를 갖도록 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
            max-width: 300px; /* 최대 너비를 설정하여 너무 넓어지지 않도록 설정 */
            margin: 10px; /* 상하좌우에 일정 간격을 두도록 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함하여 박스 크기 계산 */
        }
</style>
        </body>



    </main>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>