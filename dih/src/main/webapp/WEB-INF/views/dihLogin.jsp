<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>닥터인홈ID로그인</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        .loginForm {
            text-align: center;
        }

        .info-find, .info-join {
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
        <h2>닥터인홈 ID 로그인</h2>
    </div>
    <form action="/Doctorinhome/DIH" method="post" class="loginForm">
        <div>
            <input type="text" id="id" name="user_id" required placeholder="아이디">
        </div>
        <div>
            <input type="password" id="pwd" name="user_pwd" required placeholder="비밀번호">
        </div>
        <div>
            <button type="submit">로그인하기</button>
        </div>
    </form>
    <div class="info-find">
        <a href="/Doctorinhome/find/id">아이디 찾기</a>
        <a href="/Doctorinhome/find/pwd">비밀번호 찾기</a>
    </div>
    <div class="info-join">
        아직 계정이 없으신가요?
        <a href="/Doctorinhome/dihJoin">회원가입</a>
    </div>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }
</script>
</html>