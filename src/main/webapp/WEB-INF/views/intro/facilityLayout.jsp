<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑장 시설배치도</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
    
    <style>
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

.box {
    border: 5px solid #A5D8FA;
    padding: 20px;
    flex: none;
    text-align: center;
    width: 1500px;
    height: 300px;
    margin: 10px;
    box-sizing: border-box;
    display: flex; /* Flexbox 레이아웃 사용 */
    justify-content: space-between; /* 요소 사이에 공간을 최대한 분배 */
    border-radius: 15px;
}    

.left-content {
        flex: 1; /* 왼쪽 콘텐츠가 가능한 최대 공간을 차지하도록 설정 */
        margin-right: 20px; 
    }
    
.item {
        margin-bottom: 10px; /* 각 항목(아이템) 사이에 아래쪽 여백을 설정합니다 */
    }
    
.item2 {
		margin-top: 40px;
}    
    
    .right-content {
        flex: 1; /* 오른쪽 콘텐츠도 가능한 최대 공간을 차지하도록 설정 */
        /* 추가적인 스타일링을 원하는 경우 여기에 추가하세요 */
    }
    
img {
	position: relative;
	left: 50px;
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
            <h5>ENUM 캠핑장 시설배치도</h5>
            <p>Enjoy Nature Under Moonlight</p>
        </section>

        <section class="facility-section">
            <div class="intro-sidebar">
                <c:set var="pageTitle" value="Home" scope="page" />
                <%@ include file="../fragments/intro-sidebar.jspf"%>
            </div>

			<div>
				<img
					src="https://lh3.googleusercontent.com/proxy/ihHd_M-wsSuOaBajAJ34kuoZEF7eUVB-X7ccHVw0IKrrxmQxI0-0VzlXdot4WL72_CKpfBPWoQfM7-NbGfTQyhqiICCMK6WAWFXWYFMaK17mwKuc9PtXPBEOssmdUjDtmDgJ7W3d"
					alt="시설배치도" width="1100" height="1100">
			</div>

			<div class="box">
				<div class="left-content">
					<div class="item">
					<h4>캠핑 A, B, C동</h4>
					<h5>- 전 구역 데크존으로 편안한 캠핑 가능</h5>
					<h5>- 계곡 및 수영장과 인접하여 이동성 좋음</h5>
					<h5>- 자연으로 둘러싸인 구조로 조용한 휴식 가능</h5>
					</div>
					
					<div class="item2">
					<h4>산책로(화살표 방향)</h4>
					<h5>- 캠핑장 주변 둘레길로 산책 가능</h5>
					</div>
					
				</div>
				<div class="right-content">
					<h4>로뎀동, 카이로스동(관리동)</h4>
					<h5>- 화장실, 샤워실, 식수대, 주차장 구비</h5>
					<h5>- 자체 매점 운영으로 식재료 및 필요 용품 즉시 구매 가능</h5>
				</div>
			</div>

		</section>

        <section>
            
        </section>
    </main>

   <!--  <footer>
        <div class="container-fluid" id="wrap">
            <%@ include file="../fragments/footer.jspf" %>
        </div>
    </footer>
-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>