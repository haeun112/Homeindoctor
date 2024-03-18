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
        .loginForm {
            text-align: center;
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
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }
</script>
</html>