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
                <div
                    class="container-fluid d-flex justify-content-center">
                    <h1>대여 및 판매 물품</h1>
                </div>
                <div
                    class="container-fluid d-flex justify-content-center">
                    <table>
                        <tbody>
                            <c:forEach var="i" items="${items}">
                                <tr>
                                    <td class="img-container"><c:url
                                            value="${i.itemImg}"
                                            var="itemImgUrl" /> <img
                                        alt="${i.itemName}"
                                        src="${itemImgUrl}" class="img"
                                        id="itemImg-${i.itemId}" /></td>
                                    <td>
                                        <h5>${i.itemName}</h5>
                                    </td>
                                    <td>${i.itemDesc}</td>
                                    <td>${i.itemPrice}원</td>
                                    <td class="narrow">
                                        <div class="quantity-controls">
                                            <select
                                                id="quantity-${i.itemId}"
                                                onchange="updateQuantity('${i.itemId}', ${i.itemPrice})">
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <!-- 필요한 경우 수량 옵션을 더 추가 -->
                                            </select>
                                        </div>
                                        <div id="total-${i.itemId}"
                                            class="total-price">0원</div>
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

                <div
                    class="container-fluid d-flex justify-content-center mt-3">
                    <a href="../reservation/order" class="btn btn-primary">다음
                        단계</a>
                </div>
            </main>

            <div class="container-fluid" id="wrap">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </div>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
    
    <script>
    // 전역 변수로 선택된 아이템 정보를 담을 배열 선언
    var selectedItems = [];

    // 수량 업데이트할 때 호출되는 함수
    function updateQuantity(itemId, itemPrice) {
        var quantity = document.getElementById('quantity-' + itemId).value;
        var totalPrice = quantity * itemPrice;

        // 총 가격 업데이트
        document.getElementById('total-' + itemId).textContent = totalPrice + '원';

        // 선택된 아이템 정보 업데이트
        var selectedItem = {
            itemId: itemId,
            quantity: quantity,
            totalPrice: totalPrice
        };

        // 이미 선택된 아이템인지 확인 후 업데이트 또는 제거
        var existingIndex = selectedItems.findIndex(item => item.itemId === itemId);
        if (existingIndex !== -1) {
            if (quantity > 0) {
                selectedItems[existingIndex] = selectedItem;
            } else {
                selectedItems.splice(existingIndex, 1); // quantity가 0인 경우 아이템 제거
            }
        } else {
            if (quantity > 0) {
                selectedItems.push(selectedItem);
            }
        }

        // 선택된 아이템들 리스트 업데이트
        updateSelectedItemsList();
        // 전체 총 가격 업데이트
        updateTotalAllItems();
    }

    // 선택된 아이템들 리스트 업데이트 함수
    function updateSelectedItemsList() {
        var tableHtml = '<table class="table table-bordered"><thead><tr><th>아이템 ID</th><th>수량</th><th>총 가격</th></tr></thead><tbody>';
        selectedItems.forEach(function(item) {
            tableHtml += '<tr><td>' + item.itemId + '</td><td>' + item.quantity + '</td><td>' + item.totalPrice + '원</td></tr>';
        });
        tableHtml += '</tbody></table>';

        // HTML에 선택된 아이템들 리스트 표시
        var selectedItemsElement = document.getElementById('selectedItemsList');
        selectedItemsElement.innerHTML = tableHtml;
    }

    // 전체 총 가격 업데이트 함수
    function updateTotalAllItems() {
        var total = selectedItems.reduce(function(sum, item) {
            return sum + item.totalPrice;
        }, 0);
        var totalAllItemsElement = document.getElementById('totalAllItems');
        totalAllItemsElement.textContent = '전체 총 가격: ' + total + '원';
    }
    </script>
    
</body>
</html>