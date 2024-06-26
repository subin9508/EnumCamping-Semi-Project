<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous" />

        <c:url value="../css/header.css" var="headerCss" />
        <link rel="stylesheet" href="${headerCss}">

        <c:url value="../css/footer.css" var="footerCss" />
        <link rel="stylesheet" href="${footerCss}">
    </head>

    <body>
        <c:set value="ENUM CAMPING" var="pageTitle" scope="page" />
            <%@ include file="../fragments/header.jspf"%>
        <div class="container-fluid">
        
        <main>
            <div class="container-fluid">
                <div class="my-2 card card-body">
                    <c:url var="signUpPage" value="/user/signup" />
                    <form action="${signUpPage}" method="post">
                        <div class="my-2 row">
                            <div class="col-9">
                                <input type="text" class="form-control"
                                    id="user_id" name="userId"
                                    placeholder="아이디" required autofocus />
                            </div>

                            <div class="col-3">
                                <button type="button" id="checkUseridbutton"
                                    class="form-control btn btn-outline-success">중복
                                    확인</button>
                            </div>
                            
                            <!-- userid 중복 체크 결과 표시할 영역 -->
                            <div id="checkUseridResult"></div>


                            <div class="my-2">
                                <input type="password"
                                    class="form-control"
                                    id="user_password"
                                    name="userPassword"
                                    placeholder="비밀번호" required />
                            </div>

                            <div class="my-2">
                                <input type="password"
                                    class="form-control"
                                    id="user_confirmpassword"
                                    name="confirmpassword"
                                    placeholder="비밀번호 확인" required />
                            </div>

                            <div class="my-2">
                                <input type="text" class="form-control"
                                    id="user_name" name="userName"
                                    placeholder="이름" required />
                            </div>

                            <div class="my-2">
                                <input type="text" class="form-control"
                                    id="user_phone" name="userPhone"
                                    placeholder="핸드폰 번호" required />
                            </div>

                            <div class="my-2">
                                <input type="email" class="form-control"
                                    id="user_email" name="userEmail"
                                    placeholder="이메일" required />

                            </div>
                            <!--  <button id="btnsendemail" class="btn btn-outline-success" style="display: inline-block;">인증하기</button>-->


                            <!--
                    <div class="my-2">
                        <input type="text" class="form-control" id="verification code"
                            name="verification code" placeholder="인증번호" required />
                       <button id="btncode" class="btn btn-outline-success" style="display: inline-block;">인증완료</button>
                    </div>
                    -->
                            <div class="my-2">
                                <button id="btnSignUp"
                                    class="form-control btn btn-outline-success disabled">가입하기</button>
                            </div>
                            <div class="mt-2"
                                style="text-align: center;">
                                <div class="m-3"
                                    style="display: inline-block;">
                                    <h6>이미 계정이 있으신가요?</h6>
                                </div>
                                <a href="signin"
                                    class="btn btn-outline-success"
                                    style="display: inline-block;">로그인</a>
                            </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
        
        
    <%@ include file="../fragments/footer.jspf"%>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
        </script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="weatherJS" value="/js/weather.js" />
    <script src="${weatherJS}"></script>

    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

   <!--  우리가 만드는 JS 파일 -->
    <c:url var="userSignUpJS" value="/js/user_signup.js" />
    <script src="${userSignUpJS}"></script>
    
    <!--
    <script>
    document
            .addEventListener(
                    "DOMContentLoaded",
                    function() {
                        var submitBtn = document.getElementById("submitBtn");
                        var nameInput = document.getElementById("user_name");
                        var emailInput = document.getElementById("user_email");
                        var messageContainer = document
                                .getElementById("messageContainer");

                        function validateInputs() {
                            if (nameInput.value.trim() !== ""
                                    && emailInput.value.trim() !== "") {
                                submitBtn.disabled = false;
                            } else {
                                submitBtn.disabled = true;
                            }
                        }

                        nameInput.addEventListener("input", validateInputs);
                        emailInput.addEventListener("input", validateInputs);
<%if (request.getAttribute("message") != null && request.getAttribute("userId") == null) {%>
    messageContainer.innerHTML = "<div class='alert alert-danger'>${message}</div>";
                        setTimeout(function() {
                            messageContainer.innerHTML = "";
                        }, 3000);
<%}%>
    });
    
    -->
</script>
</body>
</html>