<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        .lgbutton-container {
            text-align: center;
        }

        .info-find {
            text-align: center;
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 16px;
            color: #F2F2F2;
        }

        .head-title-wrap {
            position: relative;
            display: inline-block;
        }

        a {
            margin: 0 1.25rem;
            font-size: 1.32rem;
        }

        a:hover {
            color: aquamarine;
        }

        .main_menu {
            text-align: center;
            margin: 2.167rem auto 0;
        }

        .contentW {
            text-align: center;
        }
        
        .kakao {
            width: 28.125rem; /* 원하는 너비 값으로 조정 */
            height: auto; /* 이미지의 가로 세로 비율을 유지하려면 height를 auto로 설정 */
        }

        .lgbutton-container button{
            display: inline-block;
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 1.25rem;
            text-align: center;
            color: #575750;
            width: 28.125rem;
            height: 3.875rem;
            box-sizing: border-box;
            border-style: solid;
            border-color: #575750;
            padding: 0.65rem 0.8rem;
            background-color: #96f0f2;
            border-radius: 1rem;
            margin: 1.25rem;
        }

        .lgbutton-container button:hover{
            box-shadow:none;
        }

        .info-find a:hover{
            color: white;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header class="mainP">
        <div class="button-container">
            <a href="/Doctorinhome/main" class="logo">
                <img src="img/logo.png" alt="닥터인홈로고" width="85.25rem" height="auto" >
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
        <h3 class="head-title">계정을 선택해주세요.</h3>
    </div>
    <div class="lgbutton-container">
        <div>
            <button class="dih-email" onclick="dihFunction()">닥터인홈으로 로그인</button>
        </div>
        <div>
            <button class="naver-email">네이버로 로그인</button>
        </div>
        <div>
            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7673beed665d61d57a23ae475c5d4113&redirect_uri=http%3A%2F%2Flocalhost%3A8000%2FDoctorinhome%2Flogin%2Fkakao">
                <img src="img/kakao_login_medium_wide.png" alt="카카오 로그인" class="kakao">
            </a>
        </div>
        <div>
            <button class="google-email">구글로 로그인</button>
        </div>
    </div>
    <div class="info-find">
        <a href="/Doctorinhome/find/id">아이디 찾기</a>
    </div>
</section>
</main>
</body>
<script>
    function dihFunction(){
        let url = "/Doctorinhome/DIH";
        window.location.href= url;
    }

    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }
</script>
</html>