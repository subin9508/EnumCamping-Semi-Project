/**
 * /user/update.jsp에 포함.
 */

 const updateForm = document.querySelector('form#updateForm');
 const inputUserId = document.querySelector('input#userid');
 const inputUserPassword = document.querySelector('input#userpassword');
 const inputUserPhone = document.querySelector('input#userphone');
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
		updateForm.action = '/update'; // 요청 주소
		updateForm.method = 'POST' // 요청 방식
		updateForm.submit(); // 폼 양식 데이터 제출(서버로 요청 보냄).
	}
	
 });