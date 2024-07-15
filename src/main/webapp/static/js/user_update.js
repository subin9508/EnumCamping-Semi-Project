document.addEventListener('DOMContentLoaded', () => {
    const updateForm = document.querySelector('form#updateForm');
    const inputUserPassword = document.querySelector('input#userPassword');
    const inputUserPhone = document.querySelector('input#userPhone');
    const imageInput = document.getElementById('imageInput');
    const profileImage = document.getElementById('profileImage');
    const deleteImage = document.getElementById('deleteImage');

    // 서버에서 반환된 에러 메시지 표시
    const errorMessage = document.querySelector('.alert-danger');
    if(errorMessage) {
        alert(errorMessage.textContent);
    }

    // 서버에서 반환된 성공 메시지 표시
    const successMessage = document.querySelector('.alert-success');
    if(successMessage) {
        alert(successMessage.textContent);
    }

    // 이미지 파일 선택 시 미리보기 기능
    imageInput.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if(file) {
            profileImage.src = URL.createObjectURL(file);
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
        if (result) {
            const formData = new FormData(updateForm);

            fetch(updateForm.action, {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    const contentType = response.headers.get("content-type");
                    if (contentType && contentType.indexOf("application/json") !== -1) {
                        return response.json();
                    } else {
                        return response.text().then(text => {
                            console.log("Server response:", text);
                            throw new Error("Server didn't return JSON");
                        });
                    }
                })
                .then(data => {
                    if (data.success) {
                        alert('프로필이 성공적으로 업데이트되었습니다.');
                        window.location.reload();
                    } else {
                        alert('프로필 업데이트에 실패했습니다: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('프로필 업데이트 중 오류가 발생했습니다.');
                });