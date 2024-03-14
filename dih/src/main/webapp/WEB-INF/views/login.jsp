<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>닥터인홈</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            background-color: lightpink;
        }

        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        h2 {
            font-family: 'SBAggroB', sans-serif; /* 사용할 폰트 지정 */
            font-size: 32px; /* 원하는 폰트 크기 지정 */
            text-align: center;
            color: white;
        }

        .lgbutton-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="button-container">
        <button onclick="mainFuction()">홈</button>
    </div>
    <div>
        <h2>계정을 선택해주세요.</h2>
    </div>
    <div class="lgbutton-container">
        <div>
            <button class="dih-email" onclick="dihFunction()">닥터인홈으로 로그인</button>
        </div>
        <div>
            <button class="naver-email">네이버로 로그인</button>
        </div>
        <div>
            <button class="talk-email">카카오톡으로 로그인</button>
        </div>
        <div>
            <button class="google-email">구글로 로그인</button>
        </div>
    </div>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }

    function dihFunction(){
        let url = "/Doctorinhome/DIH";
        window.location.href= url;
    }
</script>
</html>