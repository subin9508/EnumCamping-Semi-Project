<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Enum camping</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" /> 
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
    
	</head>
	<body>
	<div class="wrapper">
            <c:set var="pageTitle" value="QnA Create" />
            <%@ include file="../../fragments/header.jspf" %>
 <div class="footer-main-content"> 
            <%@ include file="../../fragments/community-sidebar.jspf"%>
        <div class="container-fluid">
            
            <main>
                <div class="mt-2 card">
                    <div class="card-header">
                        <h3>새 글 작성</h3>
                    </div>
                    <div class="card-body">
                        <c:url var="qnaCreatePage" value="/community/qna/create" />
                        <form method="post" action="${qnaCreatePage}"> <!-- 같은주소는 action 안해도됨 -->
                        <!-- form에서 action 속성 값을 설정하지 않으면 현재 요청 주소로 다시 요청을 보냄. -->
                        
                            <div class="mt-2">
                                <input class="form-control" 
                                type="text" name="qnaTitle" placeholder="제목 입력" required autofocus/>
                            </div>
                            <div class="mt-2">
                                <textarea class="form-control" 
                                rows="5" name="qnaContent" placeholder="내용 입력" required></textarea>
                            </div>

    <!-- 비밀글 체크박스 -->
    <div class="mt-2 form-check">
        <input class="form-check-input" type="checkbox" id="qnaLock" name="qnaLock" value="1">
        <label class="form-check-label" for="qnaLock">비밀글로 설정</label>
    </div>

								<div class="mt-2">
                            <!-- 로그인 사용자 아이디를 author 입력 필드에 설정. -->
                            <input class="d-none" 
                                type="text" name="qnaUserId" value="${signedInUser}" readonly required />
                        </div>
                        <div class="mt-2">
                            <input class="form-control btn btn-outline-success" type="submit" value="저장" />
                            </div>
                        </form>
                    </div>
                </div>
            </main>
       
        </div>
    </div>
		<%@ include file="../../fragments/footer.jspf"%>
		</div>        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   		<c:url var="weatherJS" value="/js/weather.js" />
  		<script src="${weatherJS}"></script>
	</body>
</html>