document.addEventListener('DOMContentLoaded', () => {
    const btnRegisterAnswer = document.querySelector('button#btnRegisterAnswer');
    if (btnRegisterAnswer) {
        btnRegisterAnswer.addEventListener('click', registerAnswer); // 버튼 클릭시 registerAnswer 함수 호출
    }
    
    // 답변 등록 함수
    function registerAnswer() {
		const userRole = document.querySelector('input#userRole').value; // 사용자 역할
		console.log('User Role:', userRole); // 디버깅을 위해 콘솔에 출력
        if (userRole !== '0') { // 사용자가 0이 아닌경우
            alert('답변 등록은 관리자만 가능합니다.'); // 알림 메세지 표시
            return; // 함수 종료
        }
        
        const qnaPostId = document.querySelector('input#qnaPostId').value; // QnA 게시글 ID 가져오기
        const content = document.querySelector('textarea#answerContent').value; // 답변 애용 가져오기
        const userId = signedInUser; // 현재 로그인한 사용자 ID
       
        if (content === '' || userId === '') { // 답변 내용이 비어있거나 사용자 ID가 없는경우
            alert('답변 내용을 입력하세요.'); // 알림
            return; // 종료
        }
        
        const data = { qnaPostId, content, userId }; // 서버에 보낼 데이터 객체
        
        // 답변 등록을 위한 POST 요청
        axios.post('/semiproject/api/answers', data)
            .then((response) => {
                if (response.data === 1) { // 서버에서 성공 응답 받은 경우
                    alert('답변이 등록되었습니다.'); // 성공 알림
                    document.querySelector('textarea#answerContent').value = ''; // 텍스트 영역 초기화
                    getAllAnswers(); // 모든 답변 목록을 다시 가져옴
                }
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    // 모든 답변을 가져오는 함수
    function getAllAnswers() {
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        if (!qnaPostId) { // 게시글 ID 없는 경우
            console.error('qnaPostId input element not found');
            return;
        }
        
        const uri = `/semiproject/api/answers/qna/${qnaPostId}`; // API 요청 URI
        
        // 모든 답변을 가져오기 위한 GET 요청
        axios.get(uri)
            .then((response) => {
                makeAnswerElements(response.data); // 응답 데이터로 답변 요소 생성
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    // 답변 요소를 생성하는 함수
    function makeAnswerElements(data) {
        const divAnswers = document.querySelector('div#answersContainer');
        if (!divAnswers) {
            console.error('div#answersContainer element not found');
            return;
        }
        
        let htmlStr = ''; // HTML 문자열 초기화
        for (let answer of data) { // 각 답변 데이터에 대해
            const modifiedTime = new Date(answer.modifiedTime).toLocaleString(); // 수정시간 포맷팅
            
            htmlStr += `
                <div class="card card-body my-1">
                    <div style="font-size: 0.825rem;">
                        <span>${answer.id}</span>
                        <span class="fw-bold">${answer.userId}</span>
                        <span class="text-secondary">${modifiedTime}</span>
                    </div>
                    <div>${answer.content}</div>`;
                                    
            htmlStr += '</div>';
        }
        
        divAnswers.innerHTML = htmlStr; // 답변 컨테이너에 HTML 내용 삽입
        
        // 삭제 버튼 클릭 이벤트 리스너 추가 
        const btnDeletes = document.querySelectorAll('button.btnDeleteAnswer');
        for (let btn of btnDeletes) {
            btn.addEventListener('click', deleteAnswer);  // 삭제 버튼 클릭 시 deleteAnswer 함수 호출
        }
        
        // 수정 버튼 클릭 이벤트 리스너 추가
        const btnModifies = document.querySelectorAll('button.btnModifyAnswer');
        for (let btn of btnModifies) {
            btn.addEventListener('click', showAnswerModal); // 수정 버튼 클릭 시 showAnswerModal 함수 호출
        }
    }
    
    // 답변 삭제 함수
    function deleteAnswer(event) {
        const id = event.target.getAttribute('data-id');
        
        const result = confirm('답변을 정말 삭제할까요?');
        if (!result) {
            return;
        }
        
        const uri = `/semiproject/api/answers/${id}`;
        
        // 답변 삭제를 위한 DELETE 요청
        axios.delete(uri)
            .then((response) => {
                if (response.data === 1) {
                    alert(`답변(${id}) 삭제 성공`);
                    getAllAnswers();
                }
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    // 답변 수정 모달 표시 함수
    function showAnswerModal(event) {
        const id = event.target.getAttribute('data-id');
        
        const uri = `/semiproject/api/answers/${id}`;
        
        // 수정할 답변을 가져오기 위한 GET 요청
        axios.get(uri)
            .then((response) => {
                const content = response.data.content; // 답변 내용 가져오기 
                
                document.querySelector('input#modalAnswerId').value = id; // 모달에 답변 ID 설정
                document.querySelector('textarea#modalAnswerText').value = content; // 모달에 답변 내용 설정
                
                answerModal.show(); // 답변 수정 모달 표시
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    // 답변 업데이트 함수
    function updateAnswer() {
        const id = document.querySelector('input#modalAnswerId').value;
        const content = document.querySelector('textarea#modalAnswerText').value;
        if (content === '') {
            alert('업데이트할 답변 내용을 입력하세요.');
            return;
        }
        
        const uri = `/semiproject/api/answers/${id}`;
        
        // 답변 업데이트를 위한 PUT 요청
        axios.put(uri, { content })
            .then((response) => {
                getAllAnswers(); // 모든 답변 목록 다시 가져옴
                answerModal.hide(); // 답변 수정 모달 숨기기
            })
            .catch((error) => console.log(error));
    }
    
    getAllAnswers(); // 페이지가 로드될 때 답변 목록을 가져옴
});
