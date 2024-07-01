/**
 * /user/update.jsp에 포함.
 */

 
 const updateForm = document.querySelector('form#updateForm');
 const inputUserId = document.querySelector('input#userId');
 const inputUserPassword = document.querySelector('input#userPassword');
 const inputUserPhone = document.querySelector('input#userPhone');
 const btnUpdate = document.querySelector('button#btnUpdate');
 
 // 업데이트 버튼의 클릭 이벤트 리스너:
 btnUpdate.addEventListener('click', () => {
	// 비밀번호와 전화번호 칸이 비어있는 지 체크:
	if(inputUserPassword.value === '' || inputUserPhone === '') {
		alert('비밀번호와 전화번호는 반드시 입력하세요.');
		return;
	}
	
	// 업데이트 내용 저장 확인:
	const result = confirm('입력하신 내용으로 저장할까요?');
	if(result) {
		
		console.log("제대로 되는 지 테스트");
		updateForm.action = 'user_update'; // 요청 주소
		updateForm.method = 'post'; // 요청 방식
		updateForm.submit(); // 폼 양식 데이터 제출(서버로 요청 보냄).
	}
	
 });