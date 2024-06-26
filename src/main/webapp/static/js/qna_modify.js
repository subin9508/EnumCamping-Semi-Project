/**
 * /qna/modify.jsp 에 포함시킴.
 */

document.addEventListener('DOMContentLoaded', () => {
        // 변수 생성 (필요한 엘리먼트 찾기) - 작성자는 수정, 삭제할 때 사용안함
        const modifyForm = document.querySelector('form#modifyForm');
        const inputQnAPostId = document.querySelector('input#q_post_id');
        const inputQnATitle = document.querySelector('input#q_title');
        const textQnAContent = document.querySelector('textarea#q_content');
        const btnDelete = document.querySelector('button#btnDelete');
        const btnupdate =document.querySelector('button#btnUpdate');
        
        // 삭제 버튼의 클릭 이벤트 리스너 생성:
        btnDelete.addEventListener('click', () => {
            // 정말 삭제할건지 확인
            const result = confirm('정말 삭제할까요?');
            if (result) { // 사용자가 [확인]을 선택했을 때
                // GET 방식의 delete 요청을 서버로 보냄.  (물음표 뒤는 쿼리스트링)
                // 백킷 주의`` 
                location.href=`delete?q_post_id=${inputQnAPostId.value}`; 
            }
        });
        
        // 업데이트 버튼의 클릭 이벤트 리스너 생성:
        btnupdate.addEventListener('click', () => {
            // 제목과 내용이 비어있는지 체크
            if (inputQnATitle.value === '' || textQnAContent.value === '') {
                alert('제목과 내용은 반드시 입력하세요.');
                return; // 콜백 함수 종료(아래쪽 진행 안함)
            }
    
            // 제목과 내용이 전부다 채워져 있을 때 업데이트 내용을 저장할지 확인
            const result = confirm('변경 내용을 저장할까요?');
            if (result) {
                modifyForm.action = 'update'; // 요청 주소 호출
                modifyForm.method = 'POST'; // 요청 방식 호출
                modifyForm.submit(); //폼 양식 데이터 제출(서버로 요청 보냄)
            }
            
        });
        
});