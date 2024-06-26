<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<c:url value="/css/intro.css" var="introCSS" />
<link rel="stylesheet" href="${introCSS}" />

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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>
<body>
<div class="wrapper">
    <div class="container-fluid">
        <c:set var="pageTitle" value="User Profile" scope="page" />
        <%@ include file="../fragments/header.jspf" %>
        
        <main>
            <div class="card mt-2">
                <div class="card-header">
                    <h2>내 정보</h2>
                </div>
                <div class="card-body">
                    <form>
                        <div class="mt-2">
                            <label class="form-label" for="userid">아이디</label>
                            <input class="form-control" id="userid"
                                type="text" name="userid" value="${user.userid}" readonly />
                        </div>
                        <div class="mt-2">
                            <label class="form-label" for="password">비밀번호</label>
                            <input class="form-control" id="password"
                                type="text" name="password" value="${user.password}" readonly />
                        </div>
                        <div class="mt-2">
                            <label class="form-label" for="name">이름</label>
                            <input class="form-control" id="name"
                                type="text" value="${user.name}" readonly />
                        </div>
                        <div class="mt-2">
                            <label class="form-label" for="phone">핸드폰 번호</label>
                            <input class="form-control" id="phone"
                                type="text" value="${user.phone}" readonly />
                        </div>
                        <div class="mt-2">
                            <label class="form-label" for="email">이메일</label>
                            <input class="form-control" id="email"
                                type="email" name="email" value="${user.email}" readonly />
                        </div>
                        
                    </form>
                </div>
                <div class="card-footer"></div>
            </div>
        </main>
        <footer>
			<div class="container-fluid" id="wrap">
				<%@ include file="../fragments/footer.jspf"%>
			</div>
		</footer>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
</body>
</html>