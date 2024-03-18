<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>닥터인홈</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        .join-form {
            text-align: center;
        }

        .head-title {
            font-size: 32px;
            color: white;
        }

        p {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 22px;
            color: #F2F2F2;
        }

        .input-info {
            font-size: 16px;
            color: red;
        }
    </style>
</head>
<body>
    <div class="button-container">
        <button onclick="mainFuction()">홈</button>
    </div>
    <section class="join-form">
        <div class="join-content">
            <div class="head-title-wrap">
                <h3 class="head-title">
                    닥터인홈 회원가입
                    <p>아이디와 이메일로 간편하게 닥터인홈을 시작하세요!</p>
                </h3>
            </div>
        </div>
        <form id="dihForm" name="dihForm">
            <div class="login_id">
                <label for="user_id" class="input-layout">
                    <input type="text" name="user_id" id="user_id" class="in-close" required="required" placeholder="아이디" tabindex="1" autocomplete="off">
                </label>
                <p class="input-info" id="user_idMsg">입력한 내용이 없어요.</p>
            </div>
            <div class="login_pwd">
                <label for="user_pwd" class="input-layout">
                    <input type="password" name="user_pwd" id="user_pwd" class="in-close" required="required" placeholder="비밀번호" maxlength="15" tabindex="2" autocomplete="off">
                </label>
                <p class="input-info" id="pwdMsg">입력한 내용이 없어요.</p>
            </div>
            <div class="login_pwd">
                <label for="pwdConfirm" class="input-layout">
                    <input type="password" id="pwdConfirm" name="pwdConfirm" class="in-close" required maxlength="15" placeholder="비밀번호 확인" tabindex="3" autocomplete="off">
                </label>
                <p class="input-info" id="pwdConfirmMsg">입력한 내용이 없어요.</p>
            </div>
            <div class="login_email">
                <label for="user_email" class="input-layout">
                    <input type="text" id="user_email" name="user_email" required maxlength="50" placeholder="이메일" tabindex="4" autocomplete="off">
                </label>
                <p class="input-info" id="emailMsg">입력한 내용이 없어요.</p>
            </div>
        </form>
        <div class="btn-wrap">
            <button id="joinBtn" class="joinBtn" onclick="join()">
            가입하기
            </button>
        </div>
    </section>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }


    function checkUserId() {
    var userIdInput = $('#user_id');
    var userIdMsg = $('#user_idMsg');

    // 입력된 아이디 값
    var user_id = userIdInput.val();

    // 아이디가 비어있는지 확인
    if (user_id.trim() === "") {
        userIdMsg.text('입력한 내용이 없어요.');
        return; // 빈 아이디인 경우 추가적인 처리를 하지 않고 함수 종료
    }

    // 아이디의 형식을 확인 (영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리)
    if (!/^[a-zA-Z0-9]{6,12}$/.test(user_id)) {
        userIdMsg.text('영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리로 입력해주세요.');
        return; // 형식에 맞지 않는 경우 추가적인 처리를 하지 않고 함수 종료
    }

    // AJAX를 통해 아이디 중복 확인 요청을 보냄
    $.ajax({
        url: '/Doctorinhome/check/id',
        type: 'GET',
        data: { user_id: user_id }, // 'user_id' 파라미터를 포함하여 요청을 보냄
        success: function (response) {
            if (response === "exists") {
                // 중복일 경우
                userIdMsg.html('이미 사용 중인 아이디입니다.');
            } else {
                // 중복이 아닐 경우 메시지 초기화
                userIdMsg.html('');
            }
        },
        error: function (xhr, status, error) {
            console.error('서버 오류:', error);
            alert('서버에서 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.');
        }
    });
}

// 아이디 입력란의 입력 상태를 모니터링하여 중복 확인 요청을 보내는 이벤트 핸들러
$('#user_id').on('input', checkUserId);


//비밀번호 입력 상태에 따라 메시지를 표시
function checkUserPwd() {
    var userPwdInput = $('#user_pwd');
    var userPwdMsg = $('#pwdMsg');

    // 입력된 비밀번호 값
    var user_pwd = userPwdInput.val();

    // 비밀번호가 비어있는지 확인
    if(user_pwd.trim() === ""){
        userPwdMsg.text('입력한 내용이 없어요.');
        return;
    }

    //비밀번호의 형식을 확인
    if(!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{8,15}$/.test(user_pwd)){
        userPwdMsg.text('영문, 숫자, 특수문자 (~!@#$%^&*) 조합 8~15 자리로 입력해주세요.');
    } else {
        userPwdMsg.text('');
    }
}
//비밀번호 입력 상태 확인하는 이벤트 핸들러(없으면 안됨)
$('#user_pwd').on('input', checkUserPwd);


//비밀번호 확인
function checkUserPwdConfirm() {
    var userPwdInput = $('#user_pwd');
    var userConfirmInput = $('#pwdConfirm');
    var userConfirmMsg = $('#pwdConfirmMsg');

    var user_pwd = userPwdInput.val();
    var pwdConfirm = userConfirmInput.val();

    if(pwdConfirm.trim() === ""){
        userConfirmMsg.text('입력한 내용이 없어요.');
        return;
    }

    if(!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{8,15}$/.test(pwdConfirm)){
        userConfirmMsg.text('영문, 숫자, 특수문자 (~!@#$%^&*) 조합 8~15 자리로 입력해주세요.');
    } else if(user_pwd !== pwdConfirm) {
        userConfirmMsg.text('일치하지 않습니다. 다시 입력해주세요.');   
    } else {
        userConfirmMsg.text('');
    }
}

$('#pwdConfirm').on('input', checkUserPwdConfirm);


//이메일
function checkUserEmail() {
    var userEmailInput = $('#user_email');
    var userEmailMsg = $('#emailMsg');

    var user_email = userEmailInput.val();

    if(user_email.trim() === ""){
        userEmailMsg.text('입력한 내용이 없어요.');
        return;
    }

    // 이메일 형식을 확인하는 정규 표현식
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if(!emailRegex.test(user_email)){
        userEmailMsg.text('올바른 이메일 형식이 아닙니다.');
    }else{
        userEmailMsg.text('');
    }

}

$('#user_email').on('input', checkUserEmail);



// 필드 유효성을 확인하고 가입하기 버튼을 활성화 또는 비활성화합니다.
function checkFields() {
    var userId = $('#user_id').val();
    var userEmail = $('#user_email').val();
    var userPwd = $('#user_pwd').val();
    var userPwdConfirm = $('#pwdConfirm').val();
    var userEmailMsg = $('#emailMsg');
    var userPwdMsg = $('#pwdMsg');
    var joinBtn = $('#joinBtn');

    // 이메일과 비밀번호의 유효성을 확인합니다.
    var isEmailValid = validateEmail(userEmail, userEmailMsg);
    var isPwdValid = validatePassword(userPwd, userPwdMsg);

    // 모든 필드가 유효한 경우 버튼을 활성화합니다.
    if (userId.trim() !== "" && isEmailValid && isPwdValid && userPwd === userPwdConfirm) {
        joinBtn.prop('disabled', false); // 버튼 활성화
    } else {
        joinBtn.prop('disabled', true); // 버튼 비활성화
    }
}

// 이메일 형식을 확인하고 메시지를 업데이트합니다.
function validateEmail(email, emailMsg) {
    if (email.trim() === "") {
        emailMsg.text('입력한 내용이 없어요.');
        return false;
    }

    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(email)) {
        emailMsg.text('올바른 이메일 형식이 아닙니다.');
        return false;
    } else {
        emailMsg.text('');
        return true;
    }
}

// 비밀번호 형식을 확인하고 메시지를 업데이트합니다.
function validatePassword(password, passwordMsg) {
    if (password.trim() === "") {
        passwordMsg.text('입력한 내용이 없어요.');
        return false;
    }

    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{8,15}$/;
    if (!passwordRegex.test(password)) {
        passwordMsg.text('영문, 숫자, 특수문자 (~!@#$%^&*) 조합 8~15 자리로 입력해주세요.');
        return false;
    } else {
        passwordMsg.text('');
        return true;
    }
}

// 필드 입력 이벤트에 대한 핸들러를 추가하여 필드의 입력 상태를 확인합니다.
$('#user_id, #user_email, #user_pwd, #pwdConfirm').on('input', checkFields);

// 페이지 로드 시 초기 상태를 확인합니다.
$(document).ready(function() {
    checkFields();
});
        
    
</script>
</html>