<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ENUM CAMP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
<div  class="wrapper">


        <c:set value="ENUM CAMPING" var="pageTitle" scope="page"/> 
        <%@ include file="./fragments/header.jspf" %>

         
    <div class="footer-main-content">
    <p class="mt-50">중간 내용들</p>
    <p class="mt-50">중간 내용들</p>
    <p class="mt-50">중간 내용들</p>
    <p class="mt-50">중간 내용들</p>
    <!-- <p>상단 및 하단바, 배너 구현(날씨 api)
배경 및 바디 구현<br/>
팝업창 구현<br/>
캠핑장 설명 및 시설배치도<br/>
편의시설 및 주변관광지<br/>
위치(지도 api)<br/>
이용안내 페이지 구현<br/>
회원가입 페이지 구현<br/>
이메일인증(인증 api) 구현<br/>
로그인/로그아웃 페이지 구현<br/>
아이디 찾기 페이지 구현<br/>
이메일 기반 비밀번호 찾기 구현<br/>
정보수정 페이지 구현<br/>
내 문의내역&상세페이지 구현<br/>
회원탈퇴 페이지 구현(이메일 인증)<br/>
내 예약내역&상세페이지 구현<br/>
공지사항 페이지 구현<br/>
Q&A 페이지 구현(게시판,검색)<br/>
Q&A 페이지 구현(댓글, 답변상태, 비밀글)<br/>
FAQ 페이지 구현<br/>
이용후기 페이지 구현(조회수)<br/>
이용후기 페이지 구현(comment&filter)<br/>
이용후기 페이지 구현(home&post)<br/>
캘린더 구현(프론트&DB)<br/>
캘린더 구현(백엔드)<br/>
예약페이지 구현(예약자 정보&대여 및 판매 물품<br/> 선택&약관 동의&요금 안내)<br/>
요금 결제 기능 구현(api key, 서버 코드)<br/>
요금 결제 기능 구현(클라이언트 코드)<br/>
요금 결제 취소 기능 구현<br/>
요금 결제 응답 처리 구현<br/>
예약확인 페이지 구현<br/>
전반적 수정 및 보완<br/>
발표자료 ppt 작성<br/>
발표<br/>
설치 및 환경 설정<br/>
데이터 베이스 생성 및 권한 부여<br/>
외부 연동 확인<br/>
서버 포트 설정</p>
     -->
    </div>    
        <%@ include file="./fragments/footer.jspf" %>
</div>
         


    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>