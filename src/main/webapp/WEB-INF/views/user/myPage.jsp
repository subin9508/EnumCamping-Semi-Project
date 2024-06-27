<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    <title>정보 수정 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
</head>
<body>
<div class="wrapper">
    <div class="container-fluid no-padding">
        <c:set var="pageTitle" value="User Profile" scope="page" />
        <%@ include file="../fragments/header.jspf" %>
    </div>

    <main class="container-fluid no-padding content">
        <div class="row">
            <div class="col-md-3 mypage-sidebar">
                <c:set var="pageTitle" value="Home" scope="page" />
                <%@ include file="../fragments/mypage-sidebar.jspf" %>
            </div>
            <div class="col-md-9 main-content">
                <div class="card mt-2">
                    <div class="card-header">
                        <h2>내 정보 수정</h2>
                    </div>
                    <div class="card-body">
                        <form action="/user/user_update" method="post">
                         <input type="hidden" name="userid" value="${user.userid}" />
                            <div class="mb-3 row">
                                <label for="username" class="col-sm-2 col-form-label">이름</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="username" name="username" value="${user.username}" readonly >
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userid" class="col-sm-2 col-form-label">아이디</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="userid" name="userid" value="${user.userid}" readonly>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userpassword" class="col-sm-2 col-form-label">비밀번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="userpassword" value="${user.userpassword}" readonly>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="useremail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="useremail" value="${user.useremail}" readonly>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userphone" class="col-sm-2 col-form-label">전화번호</label>
                                <div class="col-sm-10">
                                    <input type="userphone" class="form-control" id="userphone" name="userphone" value="${user.userphone}" readonly>
                                </div>
                            </div>
                        </form>
                          </div>
                    
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </main>

    <footer class="container-fluid no-padding" id="wrap">
        <%@ include file="../fragments/footer.jspf" %>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
    crossorigin="anonymous"></script>
</body>
</html>