<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대여 및 물품 선택</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />

<c:url value="../css/header.css" var="headerCss" />
<link rel="stylesheet" href="${headerCss}">
<c:url value="../css/footer.css" var="footerCss" />
<link rel="stylesheet" href="${footerCss}">

<style>
table {
    width: 70%;
    table-layout: fixed;
    border-collapse: collapse;
}

th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
    width: 20%; /* 셀 너비를 20%로 설정하여 5개의 열이 동일한 너비를 갖도록 설정 */
}

.img-container img {
    width: 150px;
    height: 150px;
}
.quantity-controls {
    margin-bottom: 5px; /* 원하는 간격 조정 */
}

.total-price {
    margin-top: 10px; /* 총 가격 위쪽 여백 설정 */
}

#totalAllItems {
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px; /* 원하는 크기로 조정 */
    font-weight: bold; /* 두껍게 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
}
</style>

</head>

<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">
            <main style="margin-bottom: 5%; margin-top: 5%">
                <div class="container-fluid d-flex justify-content-center">
                    <h1>대여 및 판매 물품</h1>
                </div>
                <div class="container-fluid d-flex justify-content-center">
                    <table>
                        <tbody>
                            <c:forEach var="i" items="${items}">
                                <tr>
                                    <td class="img-container"><c:url value="${i.itemImg}" var="itemImgUrl" /> <img alt="${i.itemName}" src="${itemImgUrl}" class="img" id="itemImg-${i.itemId}" /></td>
                                    <td>
                                        <h5>${i.itemName}</h5>
                                    </td>
                                    <td>${i.itemDesc}</td>
                                    <td>${i.itemPrice}원</td>
                                    <td class="narrow">
                                        <div class="quantity-controls">
                                            <select id="quantity-${i.itemId}" onchange="updateQuantity('${i.itemId}', ${i.itemPrice})">
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <!-- 필요한 경우 수량 옵션을 더 추가 -->
                                            </select>
                                        </div>
                                        <div id="total-${i.itemId}" class="total-price">0원</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- 전체 총 가격을 표시할 공간 -->
                <div id="totalAllItems"></div>

                <!-- 선택된 아이템들 리스트를 표시할 공간 -->
                <div id="selectedItemsList"></div>

                <div class="container-fluid d-flex justify-content-center mt-3">
                    <button onclick="submitReservationDetails()" class="btn btn-primary">다음 단계</button>
                </div>
            </main>

            <div class="container-fluid" id="wrap">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
    
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

        updateSelectedItemsList();
        updateTotalAllItems();
    }

    function updateSelectedItemsList() {
        var tableHtml = '<table class="table table-bordered"><thead><tr><th>아이템 ID</th><th>수량</th><th>총 가격</th></tr></thead><tbody>';
        selectedItems.forEach(function(item) {
            tableHtml += '<tr><td>' + item.itemId + '</td><td>' + item.itemQuantity + '</td><td>' + item.itemAmount + '원</td></tr>';
        });
        tableHtml += '</tbody></table>';

        var selectedItemsElement = document.getElementById('selectedItemsList');
        selectedItemsElement.innerHTML = tableHtml;
    }

    function updateTotalAllItems() {
        var total = selectedItems.reduce(function(sum, item) {
            return sum + item.itemAmount;
        }, 0);
        var totalAllItemsElement = document.getElementById('totalAllItems');
        totalAllItemsElement.textContent = '전체 총 가격: ' + total + '원';
    }

    function submitReservationDetails() {
        axios.post('/api/reservationDetail', selectedItems)
            .then(function(response) {
                if (response.data > 0) {
                    alert('예약이 성공적으로 완료되었습니다.');
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
</body>
</html>