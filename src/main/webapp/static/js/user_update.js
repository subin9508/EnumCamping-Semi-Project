document.addEventListener('DOMContentLoaded', () => {
    const updateForm = document.querySelector('form#updateForm');
    const inputUserPassword = document.querySelector('input#userPassword');
    const inputUserPhone = document.querySelector('input#userPhone');
    const imageInput = document.getElementById('imageInput');
    const profileImage = document.getElementById('profileImage');
    const deleteImage = document.getElementById('deleteImage');

    // 이미지 파일 선택 시 미리보기 기능
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

    // 이미지 삭제 기능
    deleteImage.addEventListener('click', function() {
        profileImage.src = `${contextPath}/static/images/user/user.png`;
        imageInput.value = '';
    });

    // 폼 제출 시 검증
    updateForm.addEventListener('submit', (event) => {
        event.preventDefault(); // 폼의 기본 제출 동작을 막음

        // 비밀번호와 전화번호 칸이 비어있는지 체크
        if(inputUserPassword.value === '' || inputUserPhone.value === '') {
            alert('비밀번호와 전화번호는 반드시 입력하세요.');
            return;
        }

        // 비밀번호 길이 검사
        if(inputUserPassword.value.length < 8) {
            alert('비밀번호는 8자리 이상이어야 합니다.');
            return;
        }

        // 업데이트 내용 저장 확인
        const result = confirm('입력하신 내용으로 저장할까요?');
        if(result) {
            updateForm.submit(); // 폼 양식 데이터 제출(서버로 요청 보냄)
        }
    });
});
