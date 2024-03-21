<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        p {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 22px;
            color: white;
        }

        .area {
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

        .btn-long.active {
            background-color: aqua;
        }

        .btn-long {
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


        .btn-long:disabled {
            background-color: #B0BEC5;
            color: #CFD8DC;
            pointer-events: none;
        }

        .btn-long:hover {
            background-color: #616161;
            color: #F48FB1;
        }

        a {
            margin: 0 1.25rem;
            font-size: 1.32rem;
        }

        a:hover {
            color: aquamarine;
        }

        .btn-wrap {
            text-align: center;
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
                <h3 class="head-title">비밀번호 찾기</h3>
            </div>
            <form action="/Doctorinhome/find/pwd" method="post">
                <p>아이디와 가입 시 등록한 이메일을 입력해주세요.</p>
                <div class="area">
                <label for="user_id" class="input-layout">
                    <input type="text" id="user_id" name="user_id" class="in-close" required autocomplete="off" placeholder="아이디">
                </label>
                </div>
                <div class="area">
                <label for="user_email" class="input-layout">
                    <input type="email" id="user_email" name="user_email" class="in-close" required autocomplete="off" placeholder="이메일">
                </label>
                </div>
                <div class="btn-wrap">
                    <button id="btnSubmit" type="submit" class="btn-long" disabled="disabled">비밀번호 찾기</button>
                </div>
            </form>
        </section>
    </main>
</body>
<script>
    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }

    //아이디 이메일 입력란 텍스트 확인 후 버튼 활성화
    const emailInput = document.getElementById('user_email');
    const idInput = document.getElementById('user_id');
    const submitButton = document.getElementById('btnSubmit');

    //이벤트 핸들러
    emailInput.addEventListener('input', validateInputs);
    idInput.addEventListener('input', validateInputs);

    function validateInputs() {
        const emailValue = emailInput.value.trim();
        const idValue = idInput.value.trim();

        if (emailValue !== '' && idValue !== '') {
            submitButton.removeAttribute('disabled');
        } else {
            submitButton.setAttribute('disabled', true);
        }
    }
    
</script>
</html>