<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
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

        .info-find {
            text-align: center;
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 16px;
            color: #F2F2F2;
            margin: 0.725rem;
        }

        .info-find a:hover{
            color: white;
            text-decoration: underline;
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

        .lgbutton-container button{
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

        .lgbutton-container button:hover{
            box-shadow:none;
        }
    </style>
</head>
<body>
    <main>
        <section class="contentW">
    <div class="head-title-wrap">
        <h3 class="head-title">닥터인홈 ID 로그인</h3>
    </div>
    <form action="/Doctorinhome/DIH" method="post" class="loginForm">
        <div>
            <label for="user_id" class="input-layout">
                <input type="text" id="id" name="user_id" required placeholder="아이디" autocomplete="off">
            </label>
        </div>
        <div>
            <label for="user_pwd" class="input-layout">
                <input type="password" id="pwd" name="user_pwd" required placeholder="비밀번호" autocomplete="off">
            </label>
        </div>
        <div class="lgbutton-container">
            <button type="submit">로그인하기</button>
        </div>
    </form>
    <div class="info-find">
        <a href="/Doctorinhome/find/id">아이디 찾기</a>
        <a href="/Doctorinhome/find/pwd">비밀번호 찾기</a>
    </div>
    <div class="info-find">
        아직 계정이 없으신가요?
        <a href="/Doctorinhome/dihJoin">회원가입</a>
    </div>
</section>
</main>
</body>
<script>
</script>
</html>