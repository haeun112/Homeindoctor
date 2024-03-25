<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트 체온계</title>
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
    </style>
</head>
<body>
    <header class="mainP">
        <div class="button-container">
            <a href="/Doctorinhome/main" class="logo">
                <img src="img/logo.png" alt="닥터인홈로고" width="85.25rem" height="auto" >
            </a>
            <div class="main_menu">
                <a href="/Doctorinhome/smart">스마트 체온계</a>
                <a href="/Doctorinhome/app">닥터인홈</a>
                <a href="">A/S</a>
                <a href="">컨텐츠</a>
            </div>
            <button onclick="loginFuction()">로그인</button>
        </div>
    </header>
</body>
<script>
    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }
</script>
</html>