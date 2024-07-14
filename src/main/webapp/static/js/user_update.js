/**
 * /user/update.jsp에 포함.
 */

 
 const updateForm = document.querySelector('form#updateForm');
 const inputUserId = document.querySelector('input#userId');
 const inputUserPassword = document.querySelector('input#userPassword');
 const inputUserPhone = document.querySelector('input#userPhone');
 const imageInput = document.getElementById('imageInput');
 const profileImage = document.getElementById('profileImage');
 const deleteImage = document.getElementById('deleteImage');
 

 
 // 업데이트 버튼의 클릭 이벤트 리스너:
 updateForm.addEventListener('submit', (event) => {
		event.preventDefault(); // 폼의 기본 제출 동작을 막음.
	// 비밀번호와 전화번호 칸이 비어있는 지 체크:
	if(inputUserPassword.value === '' || inputUserPhone.value === '') {
		alert('비밀번호와 전화번호는 반드시 입력하세요.');
		return;
	}
	
	// 비밀번호 길이 검사
	if(inputUserPassword.value.length < 8) {
		alert('비밀번호는 8자리 이상이어야 합니다.');
		return;
	}
	
	
 imageInput.addEventListener('change', function(e) {
	const file = e.target.files[0];
	if(file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			profileImage.src = e.target.result;
		}
		reader.readAsDataURL(file);
	}
});	

deleteImage.addEventListener('click', function() {
	profileImage.src = '${pageContext.request.contextPath}/images/user/user.png';
	imageInput.value = '';
});
	
	// 업데이트 내용 저장 확인:
	const result = confirm('입력하신 내용으로 저장할까요?');
	if(result) {
		
		console.log("제대로 되는 지 테스트");
		updateForm.submit(); // 폼 양식 데이터 제출(서버로 요청 보냄).
	}
	
 });