<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ENUM CAMPING - 예약 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">
    <c:url value="../css/reservation_details.css" var="reservationDetailsCss" />
    <link rel="stylesheet" href="${reservationDetailsCss}">
</head>
<body>
    <div class="wrapper">
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">
            <%@ include file="../fragments/mypage-sidebar.jspf"%>
            <main>
                <div class="card">
                    <h2>상세 예약내역</h2>
                    <form>
                        <input id="resId" name="resId" type="hidden" value="${resMaster.resId}">
                        <input id="userId" name="userId" type="hidden" value="${resMaster.userId}">
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="resCheckIn" class="form-label">체크인 날짜</label>
                                    <input id="resCheckIn" class="form-control" type="text" value="${resMaster.resCheckIn}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="resCheckOut" class="form-label">체크아웃 날짜</label>
                                    <input id="resCheckOut" class="form-control" type="text" value="${resMaster.resCheckOut}" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="resArea" class="form-label">예약 구역, 금액</label>
                            <c:forEach items="${resDetail}" var="item">
                                <c:choose>
                                    <c:when test="${item.itemId ge 1 and item.itemId le 4}">
                                        <c:set var="area" value="1구역" />
                                        <c:set var="price" value="${item.itemAmount}" />
                                    </c:when>
                                    <c:when test="${item.itemId ge 5 and item.itemId le 8}">
                                        <c:set var="area" value="2구역" />
                                        <c:set var="price" value="${item.itemAmount}" />
                                    </c:when>
                                    <c:when test="${item.itemId ge 9 and item.itemId le 12}">
                                        <c:set var="area" value="3구역" />
                                        <c:set var="price" value="${item.itemAmount}" />
                                    </c:when>
                                    <c:when test="${item.itemId ge 13 and item.itemId le 16}">
                                        <c:set var="area" value="4구역" />
                                        <c:set var="price" value="${item.itemAmount}" />
                                    </c:when>
                                    <c:when test="${item.itemId ge 17 and item.itemId le 20}">
                                        <c:set var="area" value="5구역" />
                                        <c:set var="price" value="${item.itemAmount}" />
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <input readonly class="form-control" type="text" name="resArea" value="${area}, ${price}원">
                        </div>
                            <div class="mt-2">
                            <!-- 
                                <label for="resItems" class="form-label">구매/대여 물품</label> -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">물품 이름</th>
                                            <th scope="col">물품 수량</th>
                                            <th scope="col">물품 가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="hasItems" value="false" />
                                        <c:forEach var="rs" items="${resDetail}">
                                            <c:if test="${rs.itemId gt 20}">
                                                <c:set var="hasItems" value="true" />
                                                <tr>
                                                    <td>${rs.itemName}</td>
                                                    <td>${rs.itemQuantity}</td>
                                                    <td>${rs.itemAmount}원</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${!hasItems}">
                                            <tr>
                                                <td>${rs.itemName}</td>
                                                <td>${rs.itemQuantity}</td>
                                                <td>${rs.itemAmount}원</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${!hasItems}">
                                        <tr>
                                            <td colspan="3" class="text-center">선택하신 구매/대여물품이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                            <div class="mt-2">
                                <label for="resTotalPrice"
                                    class="form-label fs-5">총 가격</label> <input
                                    id="resTotalPrice"
                                    class="form-control fs-5" type="text"
                                    value="${resMaster.resTotalPrice}원"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="requirement" class="form-label">요청사항</label>
                                <textarea id="requirement" class="form-control" rows="5" readonly><c:set var="requirementValue" value="${empty resMaster.requirement ? '요청없음' : resMaster.requirement}" />
                                ${requirementValue}
                                </textarea>
                            </div>
                            <div class="mt-2">
                                <label for="resCreatedTime" class="form-label">예약 일시</label>
                                <input id="resCreatedTime"
                                    class="form-control" type="text"
                                    value="${resMaster.resCreatedTime}"
                                    readonly />
                            </div>
                            <div class="mt-2">
                                <label for="resState" class="form-label">예약
                                    상태</label>
                                <c:set var="resStateText">
                                    <c:choose>
                                        <c:when
                                            test="${resMaster.resState == 0}">예약대기</c:when>
                                        <c:when
                                            test="${resMaster.resState == 1}">예약완료</c:when>
                                        <c:when
                                            test="${resMaster.resState == 2}">예약취소</c:when>
                                        <c:otherwise>알 수 없음</c:otherwise>
                                    </c:choose>
                                </c:set>
                                <input id="resState"
                                    class="form-control" type="text"
                                    value="${resStateText}" readonly />
                            </div>
                    </form>

                    <c:if test="${resMaster.resState == 1}">
                        <div class="card-footer">
                            <button id="btnPayCancel" class="btn btn-danger">예약취소</button>
                        </div>
                    </c:if>
                </div>
            </main>
        </div>
        <%@ include file="../fragments/footer.jspf"%>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <c:url var="payment_js" value="/js/payment.js" />
    <script src="${payment_js}"></script>

    <c:url var="payment_cancle_js" value="/js/paymentCancel.js" />
    <script src="${payment_cancle_js}"></script>
</body>
</html>
