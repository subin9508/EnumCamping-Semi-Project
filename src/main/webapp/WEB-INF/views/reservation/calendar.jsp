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

            <div>
                <table class="scriptCalendar">
                    <thead>
                        <tr>
                            <td class="calendarBtn" id="btnPrevCalendar">&#60;&#60;</td>
                            <td colspan="5"><span id="calYear">YYYY</span>년
                                <span id="calMonth">MM</span>월</td>
                            <td class="calendarBtn"
                                id="nextNextCalendar">&#62;&#62;</td>
                        </tr>
                        <tr>
                            <td>일</td>
                            <td>월</td>
                            <td>화</td>
                            <td>수</td>
                            <td>목</td>
                            <td>금</td>
                            <td>토</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

                <div id="date"></div>
                
                <!-- radio -->
                <div class="area-card" style="display:none;">
                <div class="card mt-2 p-2" id="area1">
                    <label class="radio_label"> 
                        <input class="area-radio" type="radio" id="area1_radio" name="area" value="1"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">구역1</span>
                    </label>
                </div>
                <div class="card mt-2 p-2" id="area2">
                    <label class="radio_label"> 
                        <input class="area-radio" type="radio" id="area2_radio" name="area" value="2">
                        <span class="radio_icon"></span> 
                        <span class="radio_text">구역2</span>
                    </label>
                </div>
                <div class="card mt-2 p-2" id="area3">
                    <label class="radio_label"> 
                        <input class="area-radio" type="radio" id="area3_radio" name="area" value="3"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">구역3</span>
                    </label>
                </div>
                <div class="card mt-2 p-2">
                    <label class="radio_label" id="area4"> 
                        <input class="area-radio" type="radio" id="area4_radio" name="area" value="4"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">구역4</span>
                    </label>
                </div>
                <div class="card mt-2 p-2" id="area5">
                    <label class="radio_label"> 
                        <input class="area-radio" type="radio" id="area5_radio" name="area" value="5"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">구역5</span>
                    </label>
                </div>
                </div>
                <div class="card mt-2 p-2" id="night-card" style="display:none;">
                    <label class="radio_label" id="night-radio-label"> 
                        <input class="night-radio" type="radio" name="night"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">1박</span>
                        <input class="night-radio" type="radio" name="night"> 
                        <span class="radio_icon"></span> 
                        <span class="radio_text">2박</span>
                    </label>
                </div>
                <!-- // radio -->
                <a href="/semiproject/reservation/item">다음 페이지</a>
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