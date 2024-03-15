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
            <input type="text" id="username" name="username" required placeholder="아이디">
        </div>
        <div>
            <input type="password" id="password" name="password" required placeholder="비밀번호">
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