<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 확인</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        a {
            margin: 0 1.25rem;
            font-size: 1.32rem;
        }

        a:hover {
            color: aquamarine;
        }

        .idp {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 24px;
            color: white;
        }

        .input-info {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 18px;
            color: red;
        }

        .pwdForm {
            text-align: center;
        }

        .input-layout input{
            text-indent: 1.333rem;
            width: 80%;
            height: 4.165rem;
            border-style: solid;
            border-width: 1px;
            border-color: #FFEBEE;
            box-sizing: border-box;
            background-color: #FFEBEE;
            font-size: inherit;
            font-weight: 300;
            color: #F48FB1;
            margin: 1.167rem auto 0;
            border-radius: 1.125rem;
        }

        .input-layout input:hover {
            cursor: pointer;
        }

        .input-layout input:focus {
            border-color: #FFCDD2;
            color: #F48FB1;
        }

        .updateBtn {
            display: inline-block;
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 1.25rem;
            text-align: center;
            color: #575750;
            width: 19.125rem;
            height: 3.875rem;
            box-sizing: border-box;
            border-style: solid;
            border-color: #575750;
            padding: 0.65rem 0.8rem;
            background-color: #96f0f2;
            border-radius: 1rem;
            margin: 2.875rem;

        }


        /* .btn-long:disabled {
            background-color: #B0BEC5;
            color: #CFD8DC;
            pointer-events: none;
        } */

        .updateBtn:hover {
            background-color: #616161;
            color: #F48FB1;
        }
    </style>
</head>
<body>
    <header class="mainP">
        <div class="button-container">
            <a href="/Doctorinhome/main" class="logo">
                <img src="${path}/img/logo.png" alt="닥터인홈로고" width="85.25rem" height="auto" >
            </a>
            <div class="main_menu">
                <a href="">스마트 체온계</a>
                <a href="">닥터인홈</a>
                <a href="">A/S</a>
                <a href="">컨텐츠</a>
            </div>
            <button onclick="loginFuction()">로그인</button>
        </div>
    </header>
    <main>
        <section class="contentW">
            <div class="head-title-wrap">
                <h3 class="head-title">비밀번호 재설정</h3>
            </div>
            <c:choose>
                <c:when test="${not empty foundPwd}">
                    <div class="content-wrap">
                        <p class="idp">비밀번호를 재설정합니다.</p>
                        <form action="/Doctorinhome/update/password" method="post" id="pwdUd" name="pwdUd" class="pwdForm">
                            <input type="hidden" name="user_id" value="${user_id}">
                            <div class="update-pwd">
                                <label for="user_pwd" class="input-layout">
                                    <input type="password" name="user_pwd" id="user_pwd" class="in-close" required="required" placeholder="새로운 비밀번호" maxlength="15" autocomplete="off">
                                </label>
                                <p class="input-info" id="pwdMsg">입력한 내용이 없어요.</p>
                            </div>
                            <div class="update-pwd">
                                <label for="pwdConfirm" class="input-layout">
                                    <input type="password" id="pwdConfirm" name="pwdConfirm" class="in-close" required="required" maxlength="15" placeholder="새로운 비밀번호 확인" autocomplete="off">
                                </label>
                                <p class="input-info" id="pwdConfirmMsg">입력한 내용이 없어요.</p>
                            </div>
                            <div class="btn-wrap">
                                <button id="updateBtn" class="updateBtn" onclick="update()">설정하기</button>
                            </div>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- 아이디와 비밀번호가 일치하지 않는 경우에 대한 처리 -->
                    <div class="content-wrap">
                        <p class="idp">일치하는 아이디나 이메일이 없습니다.</p>
                        <a href="/Doctorinhome/join">가입 하러 가기</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>
    </main>
</body>
<script>
    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }
    

    //비밀번호 변경 요청
    $('#pwdUd').submit(function(event){
        event.preventDefault();

        var userId = $('#user_id').val();
        var userPwd = $('#user_pwd').val();

        $.ajax({
            url: '/Doctorinhome/update/password',
            type: 'POST',
            data: { user_id: userId, user_pwd: userPwd },
            success: function(response){
                console.log('비밀번호 재설정 성공');
                console.log('ID: ', userId);
                console.log('변경된 비밀번호: ', userPwd);
                window.location.href = '/Doctorinhome/main';
                alert('비밀번호 재설정에 성공했습니다.')
            },
            error: function(xhr, status, error){
                console.error('오류: ', error);
                alert('비밀번호 재설정에 실패했습니다.')
            }
        });
    });

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

        if(user_pwd !== pwdConfirm) {
            userConfirmMsg.text('일치하지 않습니다. 다시 입력해주세요.');   
        } else {
            userConfirmMsg.text('');
        }
    }

    $('#pwdConfirm').on('input', checkUserPwdConfirm);
</script>
</html>