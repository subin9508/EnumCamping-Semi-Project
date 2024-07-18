<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/css/user_update.css" var="user_updateCSS" />
<link rel="stylesheet" href="${user_updateCSS}" />

<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />

<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />

<c:url var="sidebarCSS" value="/css/sidebar.css" />
<link rel="stylesheet" href="${sidebarCSS}">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>정보 수정 페이지</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
      
      
       <style>
        .btn-outline-success {
            border: 1px solid green;
            background-color: white;
            color: green;
            padding: 0.375rem 0.75rem; /* 기본 패딩 */
            font-size: 1rem; /* 글자 크기 */
            border-radius: 0.25rem; /* 테두리 둥글게 */
            cursor: pointer; /* 마우스 커서 포인터로 변경 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        .btn-outline-success:hover {
            background-color: green; /* 마우스 오버 시 배경색 초록색 */
            color: white; /* 마우스 오버 시 글자색 흰색 */
        }

        .btn-link-custom {
            text-decoration: none; /* 링크의 기본 밑줄 제거 */
            color: green; /* 링크 글자 색 초록색 */
        }

        .btn-link-custom:hover {
            color: white; /* 링크 마우스 오버 시 색상 변경 */
        }

       
    </style>
    
    
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid no-padding">
            <c:set var="pageTitle" value="User Profile" scope="page" />
            <%@ include file="../fragments/header.jspf"%>
        </div>

        <main class="container-fluid no-padding content">
            <div class="row">
                <div class="col-md-3 mypage-sidebar">
                    <c:set var="pageTitle" value="Home" scope="page" />
                    <%@ include file="../fragments/mypage-sidebar.jspf"%>
                </div>
                <div class="col-md-9 main-content">
                    <div class="card card-reservation mt-2">
                        <div class="card-reservation-header">내 정보
                            수정</div>
                        <div class="card-reservation-body text-center">
                            <form id="updateForm" method="post"
                                action="${pageContext.request.contextPath}/user/user_update"
                                enctype="multipart/form-data">
                               
                                <div class="mb-3 row">
                                    <label for="userName"
                                        class="col-sm-2 col-form-label">이름</label>
                                    <div class="col-sm-10">
                                        <input id="userName" type="text"
                                            class="form-control readonly-input"
                                            name="userName"
                                            value="${user.userName}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userId"
                                        class="col-sm-2 col-form-label">아이디</label>
                                    <div class="col-sm-10">
                                        <input id="userId" type="text"
                                            class="form-control readonly-input"
                                            name="userId"
                                            value="${user.userId}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userPassword"
                                        class="col-sm-2 col-form-label">PW</label>
                                    <div class="col-sm-10">
                                        <c:if
                                            test="${not empty message}">
                                            <div
                                                class="alert alert-success">${message}</div>
                                        </c:if>
                                        <c:if test="${not empty error}">
                                            <div
                                                class="alert alert-danger">${error}</div>
                                        </c:if>
                                        <input id="userPassword"
                                            type="password"
                                            class="form-control"
                                            name="userPassword"
                                            value="${user.userPassword}">
                                    </div>
                                </div>
                                <!-- 비밀번호 확인 필드 추가 -->
                                <div class="mb-3 row">
                                    <label for="userPasswordConfirm"
                                        class="col-sm-2 col-form-label">PW
                                        확인</label>
                                    <div class="col-sm-10">
                                        <input id="userPasswordConfirm"
                                            type="password"
                                            class="form-control"
                                            name="userPasswordConfirm">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userEmail"
                                        class="col-sm-2 col-form-label">이메일</label>
                                    <div class="col-sm-10">
                                        <input id="userEmail"
                                            type="text"
                                            class="form-control readonly-input"
                                            name="userEmail"
                                            value="${user.userEmail}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userPhone"
                                        class="col-sm-2 col-form-label">전화번호</label>
                                    <div class="col-sm-10">
                                        <input id="userPhone"
                                            type="text"
                                            class="form-control"
                                            name="userPhone"
                                            value="${user.userPhone}">
                                    </div>
                                </div>
                             <button type="submit" class="btn btn-outline-success">수정 완료</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%@ include file="../fragments/footer.jspf"%>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script type="text/javascript"
        src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script> var contextPath = "${pageContext.request.contextPath}";</script>

    <c:url var="user_update_js" value="/js/user_update.js" />
    <script src="${user_update_js}"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
</body>
</html>
