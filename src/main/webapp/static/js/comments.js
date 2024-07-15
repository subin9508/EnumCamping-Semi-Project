document.addEventListener('DOMContentLoaded', () => {
    const btnToggleComment = document.querySelector('button#btnToggleComment'); 
    const bsCollapse = new bootstrap.Collapse('div#collapseComments', {toggle: false});
    
    btnToggleComment.addEventListener('click', () => {
        bsCollapse.toggle();
        
        if (btnToggleComment.innerHTML === '댓글 보기') {
            btnToggleComment.innerHTML = '댓글 감추기 ';
            getAllComments();
        } else {
            btnToggleComment.innerHTML = '댓글 보기';
        }
    });
    
    const btnRegisterComment = document.querySelector('button#btnRegisterComment');
    if (btnRegisterComment) {
        btnRegisterComment.addEventListener('click', registerComment);
    }
    
    const commentModal = new bootstrap.Modal('div#commentModal', {backdrop: true});
    const btnUpdateComment = document.querySelector('button#btnUpdateComment');
    if (btnUpdateComment) {
        btnUpdateComment.addEventListener('click', updateComment);
    }
    
    function registerComment() {
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        const qcContent = document.querySelector('textarea#qcContent').value;
        const qcUserId = document.querySelector('input#qcUserId').value;
         
        if (qcContent === '' || qcUserId === '') {
            alert('댓글 내용과 작성자는 반드시 입력하세요');
            return;
        }
        
        const data = {qcPostId: qnaPostId, qcContent, qcUserId};
        
        axios.post('/semiproject/api/comment', data)
            .then((response) => {
                if (response.data === 1) {
                    alert('댓글 1개 등록 성공');
                    document.querySelector('textarea#qcContent').value = '';
                    document.querySelector('input#qcUserId').value = '';
                    getAllComments();
                }
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    function getAllComments() {
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        if (!qnaPostId) {
            console.error('qnaPostId input element not found');
            return;
        }
        
        const uri = `/semiproject/api/comment/all/${qnaPostId}`;
        
        axios.get(uri)
            .then((response) => {
                makeCommentElements(response.data);
            })
            .catch((error) => {
                console.log(error);
            });
    }    
    
    function makeCommentElements(data) {
        const divComments = document.querySelector('div#QnAComment');
        if (!divComments) {
            console.error('div#QnAComment element not found');
            return;
        }
        
        let htmlStr = '';
        for (let comment of data) {
            const qcModifiedTime = new Date(comment.qcModifiedTime).toLocaleString();
            
            htmlStr += `
                <div class="card card-body my-1">
                    <div style="font-size: 0.825rem;">
                        <span>${comment.qcComId}</span>
                        <span class="fw-bold">${comment.qcUserId}</span>
                        <span class="text-secondary">${qcModifiedTime}</span>
                    </div>
                    <div>${comment.qcContent}</div>`;
                        
            if (comment.qcUserId === signedInUser) {    
                htmlStr += `
                    <div>
                        <button class="btnDeleteComment btn btn-outline-danger btn-sm"
                            data-id="${comment.qcComId}">삭제</button>
                        <button class="btnModifyComment btn btn-outline-primary btn-sm"
                            data-id="${comment.qcComId}">수정</button>
                    </div>
                </div>`;
            }
            
            htmlStr += '</div>';
        }
        
        divComments.innerHTML = htmlStr;
        
        const btnDeletes = document.querySelectorAll('button.btnDeleteComment');
        for (let btn of btnDeletes) {
            btn.addEventListener('click', deleteComment);
        }
        
        const btnModifies = document.querySelectorAll('button.btnModifyComment');
        for (let btn of btnModifies) {
            btn.addEventListener('click', showCommentModal);
        }
    }
    
    function deleteComment(event) {
        const qcComId = event.target.getAttribute('data-id');
        
        const result = confirm('댓글을 정말 삭제할까요?');
        if (!result) {
            return;
        }
        
        const uri = `/semiproject/api/comment/${qcComId}`;
        
        axios.delete(uri)
            .then((response) => {
                if (response.data === 1) {
                    alert(`댓글(${qcComId}) 삭제 성공`);
                    getAllComments();
                }
            })
            .catch((error) => {
                console.log(error);
            });      
    }
    
    function showCommentModal(event) {
        const qcComId = event.target.getAttribute('data-id');
        
        const uri = `/semiproject/api/comment/${qcComId}`;
        
        axios.get(uri)
            .then((response) => {
                const qcContent = response.data.qcContent;
                
                document.querySelector('input#modalCommentId').value = qcComId;
                document.querySelector('textarea#modalCommentText').value = qcContent;
                
                commentModal.show();
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    function updateComment() {
        const qcComId = document.querySelector('input#modalCommentId').value;
        const qcContent = document.querySelector('textarea#modalCommentText').value;
        if (qcContent === '') {
            alert('업데이트할 댓글 내용을 입력하세요.');
            return;
        }
        
        const uri = `/semiproject/api/comment/${qcComId}`;
        
        axios.put(uri, {qcContent})
            .then((response) => {
                getAllComments();
                commentModal.hide();
            })
            .catch((error) => console.log(error));
    }
});
