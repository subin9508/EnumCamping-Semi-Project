<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>결제 성공 페이지</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />

<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />

<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />


</head>
<body>
    <div class="wrapper">
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
        <%@ include file="../fragments/header.jspf"%>
        <div class="footer-main-content">

            <main
                style="width: 70%; margin-left: auto; margin-right: auto; margin-bottom: 5%; margin-top: 5%">
                <div class="mt-2 card">
                    
                    <div class="card-body">
                    <div>
                        <h1>예약내역</h1>
                    </div>
                    <br />
                        <form>
                            <div class="d-flex">
                                <div class="mt-2 flex-fill me-2">
                                    <label for="resCheckIn" class="form-label" style="font-size: 21px; font-weight: bold;">체크인 날짜</label>
                                    <input id="resCheckIn"
                                        class="form-control" type="text"
                                        value="${resMaster.resCheckIn}"
                                        readonly />
                                </div>
                                <br />
                                <br />~
                                <div></div>
                                <div class="mt-2 flex-fill ms-2">
                                    <label for="resCheckOut"
                                        class="form-label" style="font-size: 21px; font-weight: bold;">체크아웃
                                        날짜</label> <input id="resCheckOut"
                                        class="form-control" type="text"
                                        value="${resMaster.resCheckOut}"
                                        readonly />
                                </div>
                            </div>
                            <br/>
                            
                            <div class="mt-2">
                        <label for="resArea" class="form-label" style="font-size: 21px; font-weight: bold;">예약 구역</label>
                        <c:forEach items="${resDetail}" var="item">
                            <c:choose>
                                <c:when test="${item.itemId ge 1 and item.itemId le 4}">
                                    <c:set var="area" value="1구역" />
                                    
                                </c:when>
                                <c:when test="${item.itemId ge 5 and item.itemId le 8}">
                                    <c:set var="area" value="2구역" />
                                   
                                </c:when>
                                <c:when test="${item.itemId ge 9 and item.itemId le 12}">
                                    <c:set var="area" value="3구역" />
                                   
                                </c:when>
                                <c:when test="${item.itemId ge 13 and item.itemId le 16}">
                                    <c:set var="area" value="4구역" />
                                   
                                </c:when>
                                <c:when test="${item.itemId ge 17 and item.itemId le 20}">
                                    <c:set var="area" value="5구역" />
                                    
                                </c:when>
                            </c:choose>
                        </c:forEach>
                            <input readonly class="form-control" type="text" name="resArea" value="${area}" />
                    </div>
                    <br/>

                            <div class="mt-2">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="font-size: 21px; font-weight: bold; background-color: #7C9C63; color: white;">물품 이름</th>
                                            <th scope="col" style="font-size: 21px; font-weight: bold; background-color: #7C9C63; color: white;">물품 수량</th>
                                            <th scope="col" style="font-size: 21px; font-weight: bold; background-color: #7C9C63; color: white;">물품 가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="hasItems"
                                            value="false" />
                                        <c:forEach var="rs"
                                            items="${resDetail}">
                                            <c:if
                                                test="${rs.itemId gt 20}">
                                                <c:set var="hasItems"
                                                    value="true" />
                                                <tr>
                                                    <td>${rs.itemName}</td>
                                                    <td>${rs.itemQuantity}</td>
                                                    <td>${rs.itemAmount}원</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${!hasItems}">
                                            <tr>
                                                <td colspan="4"
                                                    style="text-align: center;">선택하신
                                                    구매/대여물품이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <br/>
                            
                            <div class="mt-2">
                                <label for="resTotalPrice"
                                    class="form-label" style="font-size: 21px; font-weight: bold;">총 가격</label> <input
                                    id="resTotalPrice"
                                    class="form-control" type="text"
                                    value="${resMaster.resTotalPrice}"
                                    readonly />
                            </div>
                            <br/>
                            
                             <div class="mt-2">
                                <label for="resCreatedTime"
                                    class="form-label" style="font-size: 21px; font-weight: bold;">예약 일시</label> <input
                                    id="resCreatedTime"
                                    class="form-control" type="text"
                                    value="${resMaster.resCreatedTime}"
                                    readonly />
                            </div>
                            
                        </form>

                    </div>

                </div>
                <div
                    class="container-fluid d-flex justify-content-center">
                    <!-- 결제 완료 메시지 -->
                    <div class="text-center mt-5">
                        <h2>예약 및 결제가 완료되었습니다</h2>
                        <p>이용해 주셔서 감사합니다.</p>
<!--                         <a  href="../../user/reservation_list?userId=${userId}" class="btn btn-primary mt-3">예약 상세내역으로 가기</a> -->
                        <a href="/semiproject/" class="btn btn-outline-success mt-3">홈으로 가기</a>
                    </div>
                </div>
            </main>
 <%@ include file="../fragments/footer.jspf"%>

        </div>


        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>