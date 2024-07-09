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
                
                <div id="price" style="">
                    <span id="price-label">가격: </span>
                    <span id="price-value"></span>원
                </div>
            </div>
        </div>
        
        <div class="container-fluid d-flex justify-content-center">
                    <h3>대여 및 판매 물품</h3>
                </div>
        <div class="container-fluid d-flex justify-content-center">
            <table class="table" style="width: 70%;">
                <tbody>
                    <c:forEach var="i" items="${items}">
                        <tr>
                            <td class="img-container"
                                style="width: 20%;"><c:url
                                    value="${i.itemImg}"
                                    var="itemImgUrl" /> <img
                                alt="${i.itemName}" src="${itemImgUrl}"
                                class="img" id="itemImg-${i.itemId}"
                                style="height: 150px; width: 150px;" />
                            </td>
                            <td style="width: 20%; height: 10%;">
                                <h5>${i.itemName}</h5>
                            </td>
                            <td style="width: 20%; height: 10%;">${i.itemDesc}</td>
                            <td
                                style="width: 20%; height: 10%; text-align: center;">${i.itemPrice}원</td>
                            <td class="narrow"
                                style="width: 20%; height: 10%; text-align: center;">
                                <div class="quantity-controls">
                                    <select id="quantity-${i.itemId}"
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

       
        <!-- 전체 총 가격을 표시할 공간 -->
         <div id="totalAllItems" style="display: flex; justify-content: center; align-items: center; font-size: 24px; font-weight: bold; text-align: center;"></div>

        
        <!-- 선택된 아이템들 리스트를 표시할 공간 -->
        <div id="selectedItemsList" style="display: none;"></div>

        <div class="container-fluid d-flex justify-content-center mt-3">
            <button onclick="submitReservationDetails()"
                class="btn btn-primary">다음 단계</button>
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
    var selectedItems = [];

    function updateQuantity(itemId, itemPrice) {
        var quantity = document.getElementById('quantity-' + itemId).value;
        var totalPrice = quantity * itemPrice;

        document.getElementById('total-' + itemId).textContent = totalPrice + '원';

        var selectedItem = {
            itemId: itemId,
            itemQuantity: quantity,
            itemAmount: totalPrice
        };

        var existingIndex = selectedItems.findIndex(item => item.itemId === itemId);
        if (existingIndex !== -1) {
            if (quantity > 0) {
                selectedItems[existingIndex] = selectedItem;
            } else {
                selectedItems.splice(existingIndex, 1);
            }
        } else {
            if (quantity > 0) {
                selectedItems.push(selectedItem);
            }
        }

        updateTotalAllItems();
    }

    function updateTotalAllItems() {
        var total = selectedItems.reduce(function(sum, item) {
            return sum + item.itemAmount;
        }, 0);
        var totalAllItemsElement = document.getElementById('totalAllItems');
        totalAllItemsElement.textContent = '전체 총 가격: ' + total + '원';
    }

    function submitReservationDetails() {
        var dtos = selectedItems.map(function(item) {
            return {
                itemId: parseInt(item.itemId),
                itemQuantity: parseInt(item.itemQuantity),
                itemAmount: parseInt(item.itemAmount)
            };
        });

        axios.post('../reservation/calendar', dtos)
            .then(function(response) {
                if (response.data === "success") {
                    window.location.href = '../reservation/order';
                } else {
                    alert('예약에 실패하였습니다.');
                }
            })
            .catch(function(error) {
                console.error('Error:', error);
                alert('예약 처리 중 오류가 발생하였습니다.');
            });
    }
    </script>
    
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