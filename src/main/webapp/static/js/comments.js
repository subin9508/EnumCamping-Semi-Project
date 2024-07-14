/**
 *  /post/details/jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
    const btnToggleComment = document.querySelector('button#btnToggleComment'); 
    const bsCollapse = new bootstrap.Collapse('div#collapseComments', {toggle: false});
    
    // 댓글 토글버튼에 클릭 이벤트 리스너를 등록.
    btnToggleComment.addEventListener('click', () => {
        bsCollapse.toggle();
        
        // innerHTML 버튼과 버튼안에있는 text 
        if (btnToggleComment.innerHTML === '댓글 보기') {
            btnToggleComment.innerHTML = '댓글 감추기 ';
            
            // 포스트에 달려 있는 모든 댓글 목록 보여줌.
            getAllComments();
            
        } else {
            btnToggleComment.innerHTML = '댓글 보기';
        }
    });
    
    // 버튼 btnRegisterComment 요소를 찾음.
    const btnRegisterComment = document.querySelector('button#btnRegisterComment');
    
    // 버튼의 클릭 이벤트 리스너 등록.
    // 버튼이벤트 처리하는 registerComment를 실행.
 if (btnRegisterComment) {
        btnRegisterComment.addEventListener('click', registerComment);
    }
    
    // 부트스트랩 모달(다이얼로그) 객체 생성.
    const commentModal = new bootstrap.Modal('div#commentModal', {backdrop: true});
    
    // 모달의 저장 버튼을 찾고, 클릭 이벤트 리스너를 설정.
    const btnUpdateComment = document.querySelector('button#btnUpdateComment');
    if (btnUpdateComment) {
        btnUpdateComment.addEventListener('click', updateComment);
    }
    
    /*------------------ 상단: 버튼 찾기, collapse 객체 생성, 이벤트 리스너, 모달 // 하단은: 함수 --------------------------*/
    
    
    // 댓글 등록 이벤트 리스너 콜백(함수):
    // 함수 만들 때의 위치는 중요하지 않음.
    function registerComment() {
        // 댓글이 달릴 포스트 번호를 찾기
        const qnaPostId = document.querySelector('input#qnaPostId').value;
        
        // 댓글의 내용을 찾기
        const qcContent = document.querySelector('textarea#qcContent').value;
        
        // 댓글 작성자 아이디를 찾기
        const qcUserId = document.querySelector('input#qcUserId').value;
         
        // 댓글 내용, 댓글 작성자가 비어 있는 지 체크
        if (qcContent === '' || qcUserId === '') {
            alert('댓글 내용과 작성자는 반드시 입력하세요');
            return; // 이벤트 리스너를 종료 
        }
        
        // Ajax 요청에서 보낼 데이터 객체를 생성.
        // 객체의 필드: 윗 쪽 선언된 변수
        /* const data = {
            postId: postId,
            ctext: ctext,
            username: username
        }; */
        const data = {qcPostId: qnaPostId, qcContent, qcUserId};
        console.log(data);
        
        // POST 방식의 Ajax 요청을 서버로 보냄. 요청에 대한 응답 성공/실패 콜백을 등록.
        // JS에서의 괄호 주의할 것.
        // .. -> 현재요청주소 post에서 하나 올라가면 spring2 에서 api/comment 라고 사용 /contextRoot  
        // 같이 보낼 데이터(유저가 작성한 데이터)를 주소 옆에 나열 해줌.
        axios
            .post('/semiproject/api/comment', data) // -> 컨트롤러에게 요청을 보낸다
            .then((response) => {
                //console.log(response);
                console.log('Comment registered, response:', response.data); //RestController에서 보낸 응답 데이터
                if (response.data === 1) { //-> Controller 에서 result를 리턴해서. 댓글 1개인 경우 1개 리턴이라서 1로 비교.
                    alert('댓글 1개 등록 성공');
                    // 댓글 입력 후 , 입력하는 곳 비우기 
                    document.querySelector('textarea#qcContent').value = '';
                    document.querySelector('input#qcUserId').value = '';
                    // 댓글 목록 갱신
                    getAllComments();
                    
                }
            }) // -> 컨트롤러에게 응답이 오면, 성공했을 때의 함수 (콜백)
            .catch((error) => {
                console.log('Error registering comment:', error);
            }); //-> 실패했을 때의 함수 (콜백)
        }
        
        // 포스트에 달려 있는 모든 댓글 목록 가져오기
        // 함수를 선언하고 무슨일을 할지 작성함.
        // 어디서 이 함수를 불러주면 좋을까? 댓글 보기 클릭 이벤트 핸들러에서.
    function getAllComments() {
            // 댓글 목록을 요청하기 위한 포스트 번호
            const qnaPostId = document.querySelector('input#qnaPostId').value;
            if (!qnaPostId) {
            	console.error('qnaPostId input element not found');
            	return;
    	    }
        
            // 댓글 목록을 요청하기 위한 REST API URI
            const uri = `/semiproject/api/comment/all/${qnaPostId}`;
            
            // Ajax 요청을 보냄
            axios.get(uri)
                .then((response) => {
                    console.log('getAllComments response:', response.data); //-> response 객체가 전달. 그 객체에는 data 속성이 있어서. 
                    // 댓글 목록을 HTML로 작성 -> div#comments 영역에 출력.
                    makeCommentElements(response.data);
                })
                .catch((error) => {
                    console.log('Error fetching comments:', error);
                });
        }    
        
        // 댓글 목록(댓글 객체들의 배열)을 아규먼트로 전달받아서 HTML을 작성.
    function makeCommentElements(data) {
            // 댓글 목록 HTML이 삽입될 div 찾기
            const divComments = document.querySelector('div#QnAComment');
            
            if (!divComments) {
          	  console.error('div#QnAComment element not found');
          	  return;
        	}
        
            // 댓글 목록 HTML 코드 
            // js의 for문은  (1) let i ; i < 10; i++ , (2) let x of array -> 원소, (3) let i in array -> 인덱스)
            let htmlStr = '';
            for (let comment of data) { // comment 배열에서 객체들을 하나씩 꺼낸다.
                // 댓글 최종 수정 시간
                const qcModifiedTime = new Date(comment.qcModifiedTime).toLocaleString(); // Date 객체 생성한 후 문자열로 만들어줌
                
                // data-id : 우리가 만든 속성이름
                htmlStr += `
                    <div class = "card card-body my-1">
                        <div style="font-size: 0.825rem;">
                            <sapn>${comment.qcComId}</span>
                            <span class="fw-bold">${comment.qcUserId}</span>
                            <span class="text-secondary">${qcModifiedTime}</spnan> 
                        </div>
                        <div>${comment.qcContent}</div>`;
                        
                // 댓글 작성자와 로그인 사용자 아이디가 같은 경우에만 삭제/수정 버튼을 추가.
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
            
            htmlStr += '</div>'; // <div class="card card-body my-1">의 종료 태그!!
        }
            console.log('Generated comment HTML:', htmlStr);
            // 작성된 HTML 코드를 div 영역에 삽입.
            divComments.innerHTML = htmlStr;
            
            // 모든 삭제 버튼들을 찾아서 클릭 이벤트 리스너를 설정.
            // divComments 밑에 위치해야 함. -> why? 버튼이라는 HTML 코드를 가지고 있는 div라서. 삽입후 이벤트 리스너 설정 *****
            // 태그에 달려있는 속성은 .(온점)사용.
            const btnDeletes = document.querySelectorAll('button.btnDeleteComment');
            for (let btn of btnDeletes) { //각각의 버튼들마다 이벤트 설정하겠다
                btn.addEventListener('click', deleteComment); // 함수로 사용
            }
            
            // 모든 수정 버튼들을 찾아서 클릭 이벤트 리스너를 설정.
            const btnModifies = document.querySelectorAll('button.btnModifyComment');
            for (let btn of btnModifies) {
                btn.addEventListener('click', showCommentModal);
            }
        }
        
    function deleteComment(event) { // 브라우저가 클릭하면 등록된 함수 호출하면서 아규먼트 event 객체를 넘김. event 변수 선언.
            // 이벤트 리스너 콜백의 아규먼트 event 객체는 target 속성을 가지고 있음.
            console.log(event.target); //-> 이벤트가 발생한 요소(타겟) - 디버그를 위해 남겨둠.
            // 모든 요소는 getAttribute 메소드를 가지고있음. 리턴은 설정된 값.
            const qcComId = event.target.getAttribute('data-id'); // HTML 요소의 속성 값 찾기.
            
            // 삭제 여부 확인
            // 확인 - true: 1이면 그냥 하단 코드 실행됨
            const result = confirm('댓글을 정말 삭제할까요?');
            if (!result) { // 사용자가 [취소]를 선택했을 때
                return; // 함수 종료
            }
            
            // Ajax로 삭제 요청을 보낼 REST API URI
            const uri = `/semiproject/api/comment/${qcComId}`;
            
            // Ajax delete 방식의 요청을 보냄.
            axios.delete(uri)
                .then((response) => {
                    console.log('Comment deleted, response:', response.data); //삭제 성공시 1.
                    if (response.data === 1) {
                        alert(`댓글(${qcComId}) 삭제 성공`);
                        getAllComments(); // 댓글 목록 갱신
                    }
                })
                .catch((error) => {
                    console.log('Error deleting comment:', error);
                });      
        }
        
        // comment id랑 data id랑 같아야만 함.
    function showCommentModal(event) {
            // 이벤트 발생한 타켓(수정 버튼)의 data-id 속성 값을 읽음. -> 읽는이유? 몇번째 댓글을 클릭했는지 알기 위해
            const qcComId = event.target.getAttribute('data-id');
            
            // Ajax 요청을 보내서 댓글 id로 검색.
            const uri = `/semiproject/api/comment/${qcComId}`;
            
            axios.get(uri)
                .then((response) => { // 응답이 옴.
                //  console.log(response);
                    console.log(response.data); // axios 요청 보내면 reaponse 객체가 data 속성을 가지게 됨.
                // console.log(response.data.id);
                // const commentId = response.data.id; //-> 객체가 가지고있는 id 속성을 접근하기 위해.
                   const qcContent = response.data.qcContent;
                
                    // 모달의 input(댓글 번호), textarea(댓글 내용)의 value를 채움.
                    document.querySelector('input#modalCommentId').value = qcComId; //상단 const id로 
                    document.querySelector('textarea#modalCommentText').value = qcContent; // response.data.ctext;
                    
                    // 모달을 보여줌.
                    commentModal.show();

                })
                .catch((error) => {
                    console.log('Error fetching comment:', error);
                });  
    }
    
    // 댓글 업데이트 모달 창의 [저장] 버튼의 클릭 이벤트 리스너 
    function updateComment() {
            // 업데이트할 댓글 번호
            const qcComId = document.querySelector('input#modalCommentId').value;
            
            // 업데이트할 댓글 내용
            const qcContent = document.querySelector('textarea#modalCommentText').value;
            if (qcContent === '') {
                alert('업데이트할 댓글 내용을 입력하세요.');
                return; // 이벤트 리스너를 종료
            }
            
            // 댓글 업데이트 요청 REST API URI
            // 업데이트 모달에서 찾은 값. 변수를 찾아서 uri 만듦
            const uri = `/semiproject/api/comment/${qcComId}`;
            
            // Ajax 요청
            // {id, ctext} 하면 controller에서 dto 강제로 dto.setId(id); 안해도 된다
            // {id, ctext} = {id: id, ctext: ctext}
            axios.put(uri, {qcContent}) // { ctext } = {ctext: ctext} -> js 객체 변수이름: 지역 변수이름
                .then((response) => {
                    console.log('Comment updated, response:', response);
                    getAllComments(); // 댓글 목록 갱신
                    commentModal.hide(); // 모달 숨김 -> textarea 남아있음. (다시 읽어와서 문제없음?)
                    
                })
                .catch((error) => console.log('Error updating comment:', error));
    }
    
 });