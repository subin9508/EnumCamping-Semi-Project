document.addEventListener('DOMContentLoaded', () => {
    const btnRegisterAnswer = document.querySelector('button#btnRegisterAnswer');
    if (btnRegisterAnswer) {
        btnRegisterAnswer.addEventListener('click', registerAnswer);
    }
    
    function registerAnswer() {
		const userRole = document.querySelector('input#userRole').value;
		console.log('User Role:', userRole); // 디버깅을 위해 콘솔에 출력
        if (userRole !== '0') {
            alert('답변 등록은 관리자만 가능합니다.');
            return;
        }
        
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        const content = document.querySelector('textarea#answerContent').value;
        const userId = signedInUser;
        
        if (content === '' || userId === '') {
            alert('답변 내용을 입력하세요.');
            return;
        }
        
        const data = { qnaPostId, content, userId };
        
        axios.post('/semiproject/api/answers', data)
            .then((response) => {
                if (response.data === 1) {
                    alert('답변이 등록되었습니다.');
                    document.querySelector('textarea#answerContent').value = '';
                    getAllAnswers();
                }
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    function getAllAnswers() {
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        if (!qnaPostId) {
            console.error('qnaPostId input element not found');
            return;
        }
        
        const uri = `/semiproject/api/answers/qna/${qnaPostId}`;
        
        axios.get(uri)
            .then((response) => {
                makeAnswerElements(response.data);
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    function makeAnswerElements(data) {
        const divAnswers = document.querySelector('div#answersContainer');
        if (!divAnswers) {
            console.error('div#answersContainer element not found');
            return;
        }
        
        let htmlStr = '';
        for (let answer of data) {
            const modifiedTime = new Date(answer.modifiedTime).toLocaleString();
            
            htmlStr += `
                <div class="card card-body my-1">
                    <div style="font-size: 0.825rem;">
                        <span>${answer.id}</span>
                        <span class="fw-bold">${answer.userId}</span>
                        <span class="text-secondary">${modifiedTime}</span>
                    </div>
                    <div>${answer.content}</div>`;
                        
//            if (answer.userId === signedInUser) {    
//                htmlStr += `
//                    <div>
//                        <button class="btnDeleteAnswer btn btn-outline-danger btn-sm"
//                            data-id="${answer.id}">삭제</button>
//                        <button class="btnModifyAnswer btn btn-outline-primary btn-sm"
//                            data-id="${answer.id}">수정</button>
//                    </div>
//                </div>`;
//            }
            
            htmlStr += '</div>';
        }
        
        divAnswers.innerHTML = htmlStr;
        
        const btnDeletes = document.querySelectorAll('button.btnDeleteAnswer');
        for (let btn of btnDeletes) {
            btn.addEventListener('click', deleteAnswer);
        }
        
        const btnModifies = document.querySelectorAll('button.btnModifyAnswer');
        for (let btn of btnModifies) {
            btn.addEventListener('click', showAnswerModal);
        }
    }
    
    function deleteAnswer(event) {
        const id = event.target.getAttribute('data-id');
        
        const result = confirm('답변을 정말 삭제할까요?');
        if (!result) {
            return;
        }
        
        const uri = `/semiproject/api/answers/${id}`;
        
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
    
    function showAnswerModal(event) {
        const id = event.target.getAttribute('data-id');
        
        const uri = `/semiproject/api/answers/${id}`;
        
        axios.get(uri)
            .then((response) => {
                const content = response.data.content;
                
                document.querySelector('input#modalAnswerId').value = id;
                document.querySelector('textarea#modalAnswerText').value = content;
                
                answerModal.show();
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    function updateAnswer() {
        const id = document.querySelector('input#modalAnswerId').value;
        const content = document.querySelector('textarea#modalAnswerText').value;
        if (content === '') {
            alert('업데이트할 답변 내용을 입력하세요.');
            return;
        }
        
        const uri = `/semiproject/api/answers/${id}`;
        
        axios.put(uri, { content })
            .then((response) => {
                getAllAnswers();
                answerModal.hide();
            })
            .catch((error) => console.log(error));
    }
    
    getAllAnswers(); // 페이지가 로드될 때 답변 목록을 가져옴
});
