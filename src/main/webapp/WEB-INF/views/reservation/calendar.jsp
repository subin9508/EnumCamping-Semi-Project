<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ENUM CAMPING</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/calendar.css">
</head>
<body>
    <div class="wrapper">
    <%@ include file="../fragments/header.jspf"%>
    <div class="footer-main-content">
    <%@ include file="../fragments/community-sidebar.jspf"%>
        
<div class="cal-container">


    

    
    <div class="calendar-container">
        <div class="calendar-header">
        <button id="prevBtn">이전</button>
        <h2 id="currentMonth"></h2>
        <button id="nextBtn">다음</button>
    </div>
    <div class="calendar-days">
        <div class="day">일</div>
        <div class="day">월</div>
        <div class="day">화</div>
        <div class="day">수</div>
        <div class="day">목</div>
        <div class="day">금</div>
        <div class="day">토</div>
    </div>
    <div class="calendar-dates" id="calendarDates"></div>
    </div>
    
   </div> 

    
    
    
    </div>
    <%@ include file="../fragments/footer.jspf"%>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
    <c:url var="calendarJS" value="/js/calendar.js" />
    <script src="${calendarJS}"></script>
</body>
</html>