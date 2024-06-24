<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다중 팝업</title>

<style>
.layerpopup {
	display: flex;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: transparent; // background: rgba(0, 0, 0, 0.5);
	z-index: 9999;
	align-items: center;
	justify-content: space-evenly;
	flex-direction: row;  // 가로 방향으로 요소를 배열
}

.popup {
    background: white;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    width: 30%;  // 폭 고정
    min-width: 300px;  // 최대 폭 제한
    margin: 0 10px;  // 팝업 사이의 간격 조정
    padding: 20px;
	margin-top: 20px;
	position: relative;
}

.title {
	font-size: 18px;
	margin-bottom: 10px;
}

.cont {
	margin-bottom: 20px;
}

.layerpopup img {
	margin-bottom: 20px;
}

#close {
	font-size: 16px;
	font-weight: 600;
	color: black;
	cursor: pointer;
	text-align: center;
	text-decoration: underline;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

</head>

<body>
	<div class="layerpopup" id="layer_popup">
		<div class="popup" id="popup1">
			<h1 class="title">[안내사항]</h1>
			<div class="cont">
				<p>
					<img src="./images/main/logo.png" width=250 height=250
						usemap="#popup" alt="popup">
				<h4>시스템 공지입니다.</h4>
				<br>
				<h4>시스템 공지 내용입니다.</h4>
				<br>
				<h4>이용에 불편을 드려 대단히 죄송합니다.</h4>
				</p>
			</div>

			<form name="pop_form">
				<div id="check1">
					<input type="checkbox" name="chkbox1" value="checkbox" id='chkbox1'>
					<label for="chkbox1">&nbsp&nbsp오늘 하루동안 보지 않기</label>
				</div>
				<div id="close1">
					<a href="javascript:closePop1();" id="close1">닫기</a>
				</div>
			</form>
		</div>

		<div class="popup" id="popup2">
			<h1 class="title">[이벤트 안내]</h1>
			<div class="cont">
				<p>
					<img src="./images/main/logo.png" width=250 height=250
						usemap="#popup" alt="popup">
				<h4>이벤트 안내입니다.</h4>
				<br>
				<h4>이벤트 안내 내용입니다.</h4>
				<br>
				<h4>자세한 사항은 공지사항에서 확인바랍니다.</h4>
				</p>
			</div>

			<form name="pop_form2">
				<div id="check2">
					<input type="checkbox" name="chkbox2" value="checkbox" id='chkbox2'>
					<label for="chkbox2">&nbsp&nbsp오늘 하루동안 보지 않기</label>
				</div>
				<div id="close2">
					<a href="javascript:closePop2();" id="close1">닫기</a>
				</div>
			</form>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script>
		// head 태그 안에 스크립트 선언
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + encodeURIComponent(value)
					+ "; path=/; expires=" + todayDate.toGMTString()
					+ "; secure; SameSite=Strict";
			console.log("Setting cookie:", name, value, "Expires:", todayDate);
		}
		
		function checkPopupsAndHideOverlay() {
			if (document.getElementById('popup1').style.display === 'none'
				&& document.getElementById('popup2').style.display === 'none') {
				document.getElementById('layer_popup').style.display = 'none'; // 모든 팝업이 닫혔을 때만 배경 숨김
			}
		}

		// 팝업을 닫는 함수
		function closePop1() {
			var chkbox1 = document.getElementById('chkbox1');
			if (chkbox1.checked) {
				setCookie("maindiv1", "done", 1);
			}
			document.getElementById('popup1').style.display = 'none';
			checkPopupsAndHideOverlay();
		}

		function closePop2() {
			var chkbox2 = document.getElementById('chkbox2');
			if (chkbox2.checked) {
				setCookie("maindiv2", "done", 1);
			}
			document.getElementById('popup2').style.display = 'none';
			checkPopupsAndHideOverlay();
		}

		document.addEventListener('DOMContentLoaded', function() {
		    var cookiedata = document.cookie;
		    if (!cookiedata.includes("maindiv1=done")) {
		        document.getElementById('popup1').style.display = "block";
		    } else {
		        document.getElementById('popup1').style.display = "none";
		    }
		    if (!cookiedata.includes("maindiv2=done")) {
		        document.getElementById('popup2').style.display = "block";
		    } else {
		        document.getElementById('popup2').style.display = "none";
		    }
		    // 모든 팝업이 숨겨져 있다면 layer_popup도 숨김
		    if (document.getElementById('popup1').style.display === 'none' && document.getElementById('popup2').style.display === 'none') {
		        document.getElementById('layer_popup').style.display = 'none';
		    } else {
		        document.getElementById('layer_popup').style.display = 'flex';
		    }
		});

		document.body.addEventListener('click', function(event) {
		    if (!event.target.closest('.popup') && document.getElementById('layer_popup').style.visibility === 'visible') {
		        if (document.getElementById('popup1').style.display === 'none' &&
		            document.getElementById('popup2').style.display === 'none') {
		            document.getElementById('layer_popup').style.display = 'none';
		        }
		    }
		});
	    
		function showPop() {
			var layerPopup = document.getElementById('layer_popup');
			layerPopup.classList.add('active'); // 활성화 상태 추가
			layerPopup.style.visibility = 'visible';
		}
				
	</script>
</body>
</html>