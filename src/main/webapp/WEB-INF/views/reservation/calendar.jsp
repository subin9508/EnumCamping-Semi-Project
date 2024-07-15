<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
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

<style>

    .item-name {
        font-size: 24px; /* 원하는 크기로 조정 */
        font-weight: bold; /* 글씨 두껍게 설정 */
    }

    .item-description {
        font-size: 18px; /* 원하는 크기로 조정 */
    }

    .item-price {
        font-size: 20px; /* 원하는 크기로 조정 */
    }
    
    .total-price {
        font-size: 18px; /* 원하는 크기로 조정 */
    }
    
</style>
</head>

<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">

            <div>
                <table class="scriptCalendar">
                    <thead>
                        <tr id="trHead">
                            <td class="calendarBtn" id="btnPrevCalendar">&#60;&#60;</td>
                            <td colspan="5"><span id="calYear">YYYY</span>년
                                <span id="calMonth">MM</span>월</td>
                            <td class="calendarBtn"
                                id="nextNextCalendar">&#62;&#62;</td>
                        </tr>
                        <tr id="weekDays">
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

                <div id="date" style="display: none;"></div>

                <c:url
                    value="/images/calendar/calendar_campingzone1.gif"
                    var="calendar_campingzone1" />
                <c:url
                    value="/images/calendar/calendar_campingzone2.gif"
                    var="calendar_campingzone2" />
                <c:url
                    value="/images/calendar/calendar_campingzone3.gif"
                    var="calendar_campingzone3" />
                <!-- radio -->
                <div class="area-card" style="display: none;">
                    <div class="card p-2" id="area1">
                        <label class="radio_label"
                            style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
                            <input class="area-radio" type="radio"
                            id="area1_radio" name="area" value="1">
                            <span class="radio_icon"></span> <img
                            alt="campingzone1"
                            src="${calendar_campingzone1}"
                            height="150px" width="200px"
                            style="margin: 0 10px;"> <span
                            class="radio_text"
                            style="font-size: 18px; margin-right: auto;"><strong>캠핑존A-1</strong></span>
                            <span style="text-align: right;">40,000원~</span>
                        </label>
                    </div>
                    <div class="card p-2" id="area2">
                        <label class="radio_label"
                            style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
                            <input class="area-radio" type="radio"
                            id="area2_radio" name="area" value="2">
                            <span class="radio_icon"></span> <img
                            alt="campingzone2"
                            src="${calendar_campingzone1}"
                            height="150px" width="200px"
                            style="margin: 0 10px;"> <span
                            class="radio_text"
                            style="font-size: 18px; margin-right: auto;"><strong>캠핑존A-2</strong></span>
                            <span style="text-align: right;">40,000원~</span>
                        </label>
                    </div>
                    <div class="card p-2" id="area3">
                        <label class="radio_label"
                            style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
                            <input class="area-radio" type="radio"
                            id="area3_radio" name="area" value="3">
                            <span class="radio_icon"></span> <img
                            alt="campingzone3"
                            src="${calendar_campingzone2}"
                            height="150px" width="200px"
                            style="margin: 0 10px;"> <span
                            class="radio_text"
                            style="font-size: 18px; margin-right: auto;"><strong>캠핑존B-1</strong></span>
                            <span style="text-align: right;">40,000원~</span>
                        </label>
                    </div>
                    <div class="card p-2" id="area4">
                        <label class="radio_label"
                            style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
                            <input class="area-radio" type="radio"
                            id="area4_radio" name="area" value="4">
                            <span class="radio_icon"></span> <img
                            alt="campingzone4"
                            src="${calendar_campingzone2}"
                            height="150px" width="200px"
                            style="margin: 0 10px;"> <span
                            class="radio_text"
                            style="font-size: 18px; margin-right: auto;"><strong>캠핑존B-2</strong></span>
                            <span style="text-align: right;">40,000원~</span>
                        </label>
                    </div>
                    <div class="card p-2" id="area5">
                        <label class="radio_label"
                            style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
                            <input class="area-radio" type="radio"
                            id="area5_radio" name="area" value="5">
                            <span class="radio_icon"></span> <img
                            alt="campingzone5"
                            src="${calendar_campingzone3}"
                            height="150px" width="200px"
                            style="margin: 0 10px;"> <span
                            class="radio_text"
                            style="font-size: 18px; margin-right: auto;"><strong>캠핑존C</strong></span>
                            <span style="text-align: right;">40,000원~</span>
                        </label>
                    </div>
                </div>
                <div class="card mt-2 p-2" id="night-card"
                    style="display: none;">
                    <div class="night-radio_label"
                        id="night-radio_label">
                        <h3> <strong>체류기간<strong> </h3>
                        <div class="radio-options">
                        <label> <input class="night-radio"
                            type="radio" name="night" value="1">
                            <span class="night-radio_text">1박 2일</span>
                        </label> <label> <input class="night-radio"
                            type="radio" name="night" value="2">
                            <span class="night-radio_text">2박 3일</span>
                        </label>
                        </div>
                    </div>
                    <div id="price" style="text-align: right;">
                    <span id="price-label">캠핑존 가격: </span> <span
                        id="price-value"></span>원
                	</div>
                </div>
                <!-- // radio -->


                <div class="m-3" id="items-table" style="display: none;">
                    <div
                        class="container-fluid d-flex justify-content-center"
                        style="margin-bottom: 30px;">
                        <h3><strong>대여 및 판매 물품</strong></h3>
                    </div>
                    <div
                        class="container-fluid d-flex justify-content-center">
                        <table class="table">
                            <tbody>
                                <c:forEach var="i" items="${items}">
                                    <tr>
                                        <td class="img-container"
                                            style="width: 20%;"><c:url
                                                value="${i.itemImg}"
                                                var="itemImgUrl" /> <img
                                            alt="${i.itemName}"
                                            src="${itemImgUrl}"
                                            class="img"
                                            id="itemImg-${i.itemId}"
                                            style="height: 170px; width: 170px;" />
                                        </td>
                                        <td
                                            style="width: 20%; height: 10%;">
                                            <h5 class="item-name">${i.itemName}</h5>
                                            <!-- 여기서 클래스를 추가 -->
                                        </td>
                                        <td
                                            style="width: 20%; height: 10%;"
                                            class="item-description">${i.itemDesc}</td>
                                        <!-- 여기서 클래스를 추가 -->
                                        <td
                                            style="width: 20%; height: 10%; text-align: center;"
                                            class="item-price">${i.itemPrice}원</td>
                                        <!-- 여기서 클래스를 추가 -->
                                        <td class="narrow"
                                            style="width: 20%; height: 10%; text-align: center;">
                                            <div
                                                class="quantity-controls">
                                                <select
                                                    id="quantity-${i.itemId}"
                                                    onchange="updateQuantity('${i.itemId}', ${i.itemPrice})">
                                                    <option value="0">0</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <!-- 필요한 경우 수량 옵션을 더 추가 -->
                                                </select>
                                            </div>
                                            <p />
                                            <div id="total-${i.itemId}"
                                                class="total-price">0원</div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>
                    <!-- 요청사항 입력 -->
                    <div class="container-fluid d-flex justify-content-center mt-3 row" id="requirement">
                        <h3 class="col-2">요청사항</h3>
                        <textarea class="form-control col-10 m-3" id="special-requests" rows="3" placeholder="요청사항을 입력하세요"></textarea>
                    </div>

                    <!-- 전체 총 가격을 표시할 공간 -->
                    <div class="m-3" id="totalAllItems"
                        style="display: none; justify-content: center; align-items: center; font-size: 24px; 
                        font-weight: bold; text-align: center;"></div>
                </div>

                <!-- 선택된 아이템들 리스트를 표시할 공간 -->
                <div id="selectedItemsList" style="display: none;"></div>

                <div
                    class="container-fluid d-flex justify-content-center mt-3">
                    <button onclick="addNextPageEventListeners()"
                        class="btn btnNextPage">다음
                        단계</button>
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
    
    <script>
    // JavaScript를 사용하여 날짜 입력 형식 제어
    document.getElementById('reservationForm').addEventListener('submit', function(event) {
        // Prevent form submission if validation fails
        if (!validateDateInput('resCheckIn') || !validateDateInput('resCheckOut')) {
            event.preventDefault();
        }
    });

    function validateDateInput(inputId) {
        var input = document.getElementById(inputId);
        var pattern = /^\d{4}-\d{2}-\d{2}$/;
        var isValid = pattern.test(input.value);
        if (!isValid) {
            input.setCustomValidity('Please enter a date in yyyy-mm-dd format.');
        } else {
            input.setCustomValidity('');
        }
        return isValid;
    }
</script>
</body>
</html>