<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        h4 {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 26px;
            color: white;
        }

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

        .line-border {
            margin: 4rem auto;
        }

        .line-border::before,.line-border::after {
            content: "";
            display: block;
            width: 100%;
            height: 1px;
            border: none;
            background-color: #FFEBEE;
        }

        .line-border::before {
            left: 0;
        }

        .line-border::after {
            right: 0;
        }

        .line-border > p {
            min-width: 3rem;
            text-align: center;
        }

        .line-border p{
            display: block;
            font-size: 16px;
            color: #FFEBEE;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .layout__flex {
            display: flex;
            align-items: center;
            justify-content: center;
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
                <h3 class="head-title">아이디 찾기</h3>
            </div>
            <form class="emailForm" name="user_email" action="/Doctorinhome/find/id" method="post">
                <h4>이메일로 찾기</h4>
                <p>가입 시 등록한 이메일을 입력해주세요.</p>
                <label for="user_email" class="input-layout">
                    <input type="text" id="user_email" name="user_email" class="in-close" required autocomplete="off" placeholder="이메일">
                </label>
                <div class="btn-wrap">
                    <button id="btnSubmit" type="submit" class="btn-long" disabled="disabled">확인</button>
                </div>
            </form>
            <div class="layout__flex line-border">
                <p>또는</p>
            </div>
        </section>
    </main>

</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }

    //이메일 입력란 텍스트 확인하고 버튼 활성화
    const emailInput = document.getElementById('user_email');
    const submitButton = document.getElementById('btnSubmit');

    //이벤트 핸들러
    emailInput.addEventListener('input', function(){
        const emailValue = emailInput.value.trim();

        if(emailValue !== ''){
            submitButton.removeAttribute('disabled');
        }else{
            submitButton.setAttribute('disabled', true);
        }
    });

    document.querySelector('.emailForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 기본 동작(폼 제출)을 막습니다.
    
    // 이메일 입력값 가져오기
    const emailValue = this.querySelector('#user_email').value.trim();

    // 이메일이 유효하면 폼 제출
    if (emailValue !== '') {
        this.submit(); // 폼 제출
    }
});

</script>
</html>