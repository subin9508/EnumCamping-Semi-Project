<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>

    <c:url value="/css/signin.css" var="signinCSS" />
    <link rel="stylesheet" href="${signinCSS}" />

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Enum Semi-Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    
    <c:url value="../css/header.css" var="headerCss"/>
    <link rel="stylesheet" href="${headerCss}">
    
    <c:url value="../css/footer.css" var="footerCss"/>
    <link rel="stylesheet" href="${footerCss}">
</head>
<body>
    <div class="wrapper">
            <%@ include file="../fragments/header.jspf"%>
    <div class="container-fluid">
        <main>
            <div class="row">
            <div class="col-4"></div>
            <div class="mt-2 col-4 mb-5" style="border: 1px solid black">
                <div class="card-header">
                    <h2>로그인</h2>                
                </div>
                <div class="card-body">
                            <form method="post">
                                <c:if
                                    test="${not empty param.result && param.result eq 'f'}">
                                    <div class="text-danger">아이디와
                                        패스워드를 확인하세요.</div>
                                </c:if>

                                <div class="mt-2">
                                    <input type="text" name="userid"
                                        placeholder="아이디"
                                        class="form-control" id="userid"
                                        required autofocus />
                                </div>
                                <div class="mt-2">
                                    <input type="password"
                                        name="password"
                                        placeholder="비밀번호"
                                        class="form-control"
                                        id="password" required />
                                </div>
                                <div class="d-none">
                                    <input name="target"
                                        value="${param.target}" readonly />
                                </div>
                                <div class="mt-2">
                                    <input
                                        class="form-control btn btn-outline-success"
                                        id="btnSignIn" type="submit"
                                        value="로그인" />
                                </div>
                                <div class="m-2 center"
                                    style="text-align: center;">
                                    <button id="btnDelete" class="btn"
                                        style="display: inline-block;">아이디
                                        찾기</button>
                                    <button id="btnUpdate" class="btn"
                                        style="display: inline-block;">비밀번호
                                        찾기</button>
                                </div>
                                <div class="mt-2"
                                    style="text-align: right;">
                                    <div class="m-3"
                                        style="display: inline-block;">
                                        <h6>계정이 없으신가요?</h6>
                                    </div>
                                    <button id="btnUpdate"
                                        class="btn btn-outline-success signup"
                                        style="display: inline-block;">회원가입</button>
                                </div>
                            </form>
                        </div>
            </div>
            </div>
        </main>
    </div>
    
    <%@ include file="../fragments/footer.jspf"%>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
</body>
</html>