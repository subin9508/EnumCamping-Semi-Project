<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>semiproject</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
    
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
    
</head>

<body>
            <%@ include file="../fragments/header.jspf"%>

            <%@ include file="../fragments/info-sidebar.jspf"%>
        
        <div class="content">
            <main class="main-content"><br>
                <div class="slider">
           
                <div class="content-1">
                <br>
                <h1><strong>[이용준수사항]</strong></h1>
                <br>
                </div>
                
                <div class="info-text"><br>
                    <h5>
                        <strong>입장</strong>
                    </h5>
                    <p>- 캠핑장의 출입은 반드시 출입구의 게이트를 이용하여야하며, 관리자의 안내를 따라야 합니다.</p>
                    <p>- 본인 확인을 위해 반드시 신분증을 지참하셔야 하며, 예약자 본인이 아니거나 신분증 제시를 거부할 경우
                        입장할 수 없습니다.</p>
                    <p>- 오후 14시부터 입장가능하며, 오후 21시 이후에는 입장하실 수 없습니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>퇴장</strong>
                    </h5>
                    <p>- 쓰레기는 규격봉투에 담아 분리수거함에 분리 배출합니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>자동차</strong>
                    </h5>
                    <p>- 장내에서의 차량통행은 서행이며, 불필요한 자동차 사용을 삼가하여 주시기 바랍니다.</p>
                    <p>- 캠핑장 내에서 자동차를 세차할 수 없습니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>소음</strong>
                    </h5>
                    <p>- 심한 소음은 항상 주의하여야 합니다.</p>
                    <p>- 정숙 시간은 22:00 부터 06:00까지 입니다</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>동물</strong>
                    </h5>
                    <p>- 반려동물 등 모든 동물의 출입을 금지합니다.</p>
                    <p>- 단, 장애인 보호견은 예외로 합니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>금연</strong>
                    </h5>
                    <p>- 캠핑장은 금역구역입니다. 캠핑장내에서 흡연을 삼가 주시기 바랍니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>화재와 신고</strong>
                    </h5>
                    <p>- 음식의 조리 및 불 사용은 지정된 곳에서만 할 수 있습니다.</p>
                    <p>- 캠핑장내 불꽃놀이 등은 전면 금지되어 있습니다.</p>
                    <p>- 허가된 전열기 이외에 사용은 삼가해 주시기 바랍니다.</p>
                    <p>- 화재예방 및 자연보호에 최대한 협조해 주시기 바랍니다.</p>
                </div>

                <div class="info-text"><br>
                    <h5>
                        <strong>유실 또는 피해</strong>
                    </h5>
                    <p>- 관리자는 이용자의 소유물에 대한 유실 또는 피해에 대하여 책임을 지지 않습니다.</p>
                    <p>- 시설에 대한 피해에 대해서는 피해를 입힌 사람들에게 비용이 청구됩니다.</p>
                    <p>- 캠핑장에서의 안전사고에 대한 책임은 이용자에게 있습니다.</p>
                </div>
                <br><br>
                </div>
            </main>
        </div>

            <%@ include file="../fragments/footer.jspf"%>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
           <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>