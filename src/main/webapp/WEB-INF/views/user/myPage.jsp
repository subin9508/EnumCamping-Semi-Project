<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<c:url value="/css/myPage.css" var="myPageCSS" />
<link rel="stylesheet" href="${myPageCSS}" />

<c:url value="/css/header.css" var="headerCSS" />
<link rel="stylesheet" href="${headerCSS}" />

<c:url value="/css/footer.css" var="footerCSS" />
<link rel="stylesheet" href="${footerCSS}" />

<c:url var="sidebarCSS" value="/css/sidebar.css" />
<link rel="stylesheet" href="${sidebarCSS}">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>ENUM CAMPING</title>
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
                        </div>
                        <div class="card-reservation-body text-center">
                            <form id="updateForm" method="post"
                                action="<c:url value='/user/user_update' />"
                                enctype="multipart/form-data">

                                <!-- Profile Picture Upload Section -->
                                <div class="mb-3">
                                    <div class="profile-image-area">
                                        <c:choose>
                                            <c:when
                                                test="${empty user.profileImage}">
                                                <img
                                                    src="${pageContext.request.contextPath}/static/images/user/user.png"
                                                    id="profileImage"
                                                    alt="프로필 이미지">
                                            </c:when>
                                            <c:otherwise>
                                                <img
                                                    src="${user.profileImage}"
                                                    id="profileImage"
                                                    alt="프로필 이미지">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!-- End of Profile Picture Upload Section -->

                                <div class="mb-3 row">
                                    <label for="userName"
                                        class="col-sm-2 col-form-label">이름</label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                            class="form-control"
                                            id="userName"
                                            name="userName"
                                            value="${user.userName}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userId"
                                        class="col-sm-2 col-form-label">아이디</label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                            class="form-control"
                                            id="userId" name="userId"
                                            value="${user.userId}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userPassword"
                                        class="col-sm-2 col-form-label">비밀번호</label>
                                    <div class="col-sm-10">
                                        <input type="password"
                                            class="form-control"
                                            id="userPassword"
                                            name="userPassword"
                                            value="${user.userPassword}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userEmail"
                                        class="col-sm-2 col-form-label">이메일</label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                            class="form-control"
                                            id="userEmail"
                                            name="userEmail"
                                            value="${user.userEmail}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="userPhone"
                                        class="col-sm-2 col-form-label">전화번호</label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                            class="form-control"
                                            id="userPhone"
                                            name="userPhone"
                                            value="${user.userPhone}"
                                            readonly>
                                    </div>
                                </div>
                            </form>

                            <!-- 수정하기 버튼 추가 -->
                            <div class="mb-3 row">
                                <div class="col-sm-8 offset-sm-2">
                                    <a href="password_check"
                                        class="btn btn-outline-success btn-link-custom">수정하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <%@ include file="../fragments/footer.jspf"%>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script> var contextPath = "${pageContext.request.contextPath}";</script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="${weatherJS}"></script>
</body>
</html>
