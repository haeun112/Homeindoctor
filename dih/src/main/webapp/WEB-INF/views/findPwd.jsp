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
        
        .input-layout input{
            text-indent: 1.333rem;
            width: 100%;
            height: 100%;
            border-style: solid;
            border-width: 1px;
            border-color: #FFEBEE;
            box-sizing: border-box;
            background-color: #FFEBEE;
            font-size: inherit;
            font-weight: 300;
            color: #F48FB1;
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
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 1.4rem;
            text-align: center;
            color: #FFCDD2;
            display: block;
            width: 100%;
            height: auto;
            box-sizing: border-box;
            border-style: none;
            padding: 1.675rem 0;
            background-color: #757575;
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
    </style>
</head>
<body>
    <header class="mainP">
        <div class="button-container">
            <button onclick="mainFuction()">홈</button>
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
    function mainFuction(){
        let url = "/Doctorinhome/main";
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