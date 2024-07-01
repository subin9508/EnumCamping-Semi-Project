<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>대여 및 물품 선택</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <c:url value="../css/header.css" var="headerCss" />
    <link rel="stylesheet" href="${headerCss}">
    <c:url value="../css/footer.css" var="footerCss" />
    <link rel="stylesheet" href="${footerCss}">

      <style>
        table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
            border: 2px solid black;
        }
        caption {
            caption-side: top;
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        th, td {
            text-align: center;
            padding: 8px;
            border: none;
        }
        th, td:not(:last-child) {
            border-right: none;
        }
        tr:not(:last-child) th, tr:not(:last-child) td {
            border-bottom: 1px solid black; /* 각 행의 아래쪽 테두리 설정 */
        }
        th {
            vertical-align: top;
        }
        .img-container img {
            width: 150px;
            height: 150px;
        }
        .wide {
            width: 60%;
        }
        .narrow {
            width: 20%;
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
                    <table>
                        <caption>대여 및 판매 물품</caption>
                        
                        <tr>
                            <th class="img-container">
                                <c:url value="/images/info/burnerset.png" var="burnerset" />
                                <img alt="burnerset" src="${burnerset}" class="img" id="burnerset" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>그리들&버너 세트</h2>
                            <br />
                            이소가스 불포함
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                                             
                        <tr>
                            <th class="img-container">
                                <c:url  value="/images/info/lantern.jpg" var="lantern" /> <img
                                alt="lantern" src="${lantern}"
                                class="img" id="lantern" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>랜턴</h2>
                            <br />
                            다양한 랜턴이 있습니다
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/electricreelwire.png"
                                    var="electricreelwire" /> <img
                                alt="electricreelwire" src="${electricreelwire}"
                                class="img" id="electricreelwire" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>전기릴선</h2>
                            <br />
                            20m
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/fireplace.png"
                                    var="fireplace" /> <img
                                alt="fireplace" src="${fireplace}"
                                class="img" id="fireplace" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>10L 난로</h2>
                            <br />
                            기름 불포함
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/electricblanket.png"
                                    var="electricblanket" /> <img
                                alt="electricblanket" src="${electricblanket}"
                                class="img" id="electricblanket" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>전기장판</h2>
                            <br />
                            2인용
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                         <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/chair.png"
                                    var="chair" /> <img
                                alt="chair" src="${chair}"
                                class="img" id="chair" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>캠핑 의자</h2>
                            <br />
                            2캠핑계 에르** 캠핑 의자 입니다
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th class="img-container">
                                <c:url value="/images/info/bbqset.png"
                                    var="bbqset" /> <img alt="bbqset"
                                src="${bbqset}" class="img" id="bbqset" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>바베큐 세트</h2>
                            <br />
                            삼겹살(200g)+상추+버섯+파채+파채소스+쌈장+허브맛 솔트
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/sweetpotato.png"
                                    var="sweetpotato" /> <img
                                alt="sweetpotato" src="${sweetpotato}"
                                class="img" id="sweetpotato" />
                            </th>
                           <td class="wide" style="text-align: left;">
                           <h2>고구마</h2>
                            <br />
                            고구마(200g)
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/marshmallow.png"
                                    var="marshmallow" /> <img
                                alt="marshmallow" src="${marshmallow}"
                                class="img" id="marshmallow" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>마시멜로우</h2>
                            <br />
                            1봉지-10개입 + 꼬치 5개
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="img-container">
                                <c:url value="/images/info/firewood.png"
                                    var="firewood" /> <img
                                alt="firewood" src="${firewood}"
                                class="img" id="firewood" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>장작</h2>
                            <br />
                            1kg
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th class="img-container">
                                <c:url value="/images/info/butangas.png"
                                    var="butangas" /> <img
                                alt="butangas" src="${butangas}"
                                class="img" id="butangas" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>부탄가스</h2>
                            <br />
                            1개
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="img-container">
                                <c:url
                                    value="/images/info/aurorapowder.png"
                                    var="aurorapowder" /> <img
                                alt="aurorapowder" src="${aurorapowder}"
                                class="img" id="aurorapowder" />
                            </th>
                            <td class="wide" style="text-align: left;">
                            <h2>오로라 가루</h2>
                            <br />
                            불에 뿌리면 멋진 오로라를 볼 수 있어요(1개)
                            </td>
                            <td class="narrow">
                                <div class="quantity-controls">
                                    <button
                                        onclick="decreaseQuantity('quantity1')">-</button>
                                    <span id="quantity1">0</span>
                                    <button
                                        onclick="increaseQuantity('quantity1')">+</button>
                                </div>
                            </td>
                        </tr>

                    </table>
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
        function decreaseQuantity(id) {
            const quantityElement = document.getElementById(id);
            let quantity = parseInt(quantityElement.textContent);
            if (quantity > 0) {
                quantityElement.textContent = --quantity;
            }
        }

        function increaseQuantity(id) {
            const quantityElement = document.getElementById(id);
            let quantity = parseInt(quantityElement.textContent);
            quantityElement.textContent = ++quantity;
        }
    </script>
</body>
</html>