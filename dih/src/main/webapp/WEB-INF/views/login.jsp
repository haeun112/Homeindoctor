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
    <div class="info-find">
        <a href="/Doctorinhome/find/id">아이디 찾기</a>
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