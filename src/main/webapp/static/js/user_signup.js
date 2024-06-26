/**
 * /user/signup.jsp 파일에 포함.
 */

document.addEventListener('DOMContentLoaded', () => {
    let useridChecked = false; // 사용자 아이디 중복 체크 결과. true: 사용할 수 있는 아이디.
    
    let passwordChecked = false; // 비밀번호 필드 작성 여부 체크.
    let confirmpasswordChecked = false; // 비밀번호 확인 필드 작성 여부 체크.
    let emailChecked = false; // 이메일 필드 작성 여부 체크.
    let usernameChecked = false; // 사용자 이름 필드 작성 여부 체크.
    let phoneChecked = false; // 휴대폰 번호 필드 작성 여부 체크.
    
    const inputUserid = document.querySelector('input#user_id');
    const checkUseridButton = document.querySelector('button#checkUseridbutton');
    const checkUseridResult = document.querySelector('div#checkUseridResult');

    checkUseridButton.addEventListener('click', checkUserid);
    
    
    const inputPassword = document.querySelector('input#user_password');
    inputPassword.addEventListener('change', checkPassword);
    
    const inputConfirmpassword = document.querySelector('input#user_confirmpassword');
    inputConfirmpassword.addEventListener('change', checkConfirmpassword);
    
    const inputEmail = document.querySelector('input#user_email');
    inputEmail.addEventListener('change', checkEmail);
    
    const inputUsername = document.querySelector('input#user_name');
    inputUsername.addEventListener('change', checkUsername);
    
    const inputPhone = document.querySelector('input#user_phone');
    inputPhone.addEventListener('change', checkPhone);
    
    /* -------------------- 함수 선언 -------------------- */
    
    // 회원 가입 버튼 활성화/비활성화
    function changeButtonState() {
        const btnSignUp = document.querySelector('button#btnSignUp');
    
        if (useridChecked && passwordChecked && confirmpasswordChecked && emailChecked && usernameChecked && phoneChecked) {
            console.log('check')
            console.log(''+useridChecked);
            console.log(''+passwordChecked);
            console.log(''+confirmpasswordChecked);
            console.log(''+emailChecked);
            console.log(''+usernameChecked);
            console.log(''+phoneChecked);
            // 버튼의 class 속성 값들 중 'disabled'를 제거 -> 버튼 활성화.
            btnSignUp.classList.remove('disabled');
        } else {
            // 버튼의 class 속성에 'disabled'를 추가 -> 버튼 비활성화.
            btnSignUp.classList.add('disabled');
             console.log('check')
        }
    }
    
    // userid 입력 필드의 change 이벤트 리스너
    // 중복 아이디 체크 Ajax 요청을 보내고, 응답을 받았을 때 처리.
    function checkUserid(event) {
        const userid = inputUserid.value; // imputUserid.value
        console.log(userid);
        
        const uri = `./checkid?userId=${userid}`; // 아이디 중복 체크 REST API URI
        axios
        .get(uri)
        .then((response) => {
            const checkUseridResult = document.querySelector('div#checkUseridResult');
            if (response.data === 'Y'){
                useridChecked = true;
                checkUseridResult.innerHTML = '사용 가능한 아이디입니다.';
                checkUseridResult.classList.add('text-success');
                checkUseridResult.classList.remove('text-danger');
            } else {
                useridChecked = false;
                checkUseridResult.innerHTML = '사용할 수 없는 아이디입니다.';
                checkUseridResult.classList.add('text-danger');
                checkUseridResult.classList.remove('text-success');
            }
            
            changeButtonState(); // 버튼 활성화 여부를 변경
        })
        .catch((error) => console.log(error));
        
    }
    
    // 비밀번호 입력 필드의 change 이벤트 리스너
    // input#password 비어 있는 지를 체크
    // TODO: 비밀번호 정규표현식도 추가 해야된다.
    function checkPassword(event) {
        if (event.target.value === ''){ // inputPassword.value
            passwordChecked = false;
        } else {
            passwordChecked = true;
        }
        
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
    // 비밀번호 확인 입력 필드의 change 이벤트 리스너
    // input#confirmpassword 비어 있는 지를 체크
    function checkConfirmpassword(event) {
        if (event.target.value === '') {
            confirmpasswordChecked = false;
        } else {
            confirmpasswordChecked = true;
        }
        
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
    // 유저 이름 입력 필드의 change 이벤트 리스너
    // input#username 비어 있는 지를 체크
    function checkUsername(event) {
        if (event.target.value === '') {
            usernameChecked = false;
        } else {
            usernameChecked = true;
        }
        
        changeButtonState();
    }
    
    // 이메일 입력 필드의 change 이벤트 리스너
    // input#email 비어 있는 지를 체크
    // TODO: 이메일 정규표현식도 추가 해야된다. 중복체크는 아이디 중복체크처럼 하면 된다.
    function checkEmail(event) {
        if (event.target.value === '') {
            emailChecked = false;
        } else {
            emailChecked = true;
        }
        
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
    // 전화번호 입력 필드의 change 이벤트 리스너
    // input#phone 비어 있는 지를 체크
    function checkPhone(event) {
        if (event.target.value === '') {
            phoneChecked = false;
        } else {
            phoneChecked = true;
        }
        
        changeButtonState(); // 버튼의 활성화/비활성화 상태를 변경
    }
    
    
    
});