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
        .main_menu{
            text-align: center;
            margin: 2.167rem auto 0;
        }

        a {
        margin: 0 1.25rem;
        font-size: 1.32rem;
        }

        a:hover {
            color: aquamarine !important;
            }

        .button-container {
            display: flex;
            justify-content: center; 
        }

        .button-container button {
            display: block;
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 1.4rem;
            text-align: center;
            color: #575750;
            display: block;
            /* width: 100%; */
            height: auto;
            box-sizing: border-box;
            border-style: solid;
            border-color: #575750;
            padding: 0.65rem 0.8rem;
            background-color: inherit;
            border-radius: 1rem;
            margin: 1.25rem;
        }

        .text-light {
            font-family: 'GongGothicMedium', sans-serif;
            margin-top: 2.25rem;
        }
    </style>
</head>
<body>
    <main>
        <div class="button-container">
            <a href="/Doctorinhome/main" class="logo">
                <img src="img/logo.png" alt="닥터인홈로고" width="85.25rem" height="auto" >
            </a>
            <div class="main_menu">
                <a href="/Doctorinhome/smart">스마트 체온계</a>
                <a href="/Doctorinhome/app">닥터인홈</a>
                <a href="/Doctorinhome/as">A/S</a>
                <a href="/Doctorinhome/contents">컨텐츠</a>
            </div>
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUserId or not empty sessionScope.loggedInAdminId}">
                    <span class="text-light">
                        환영합니다, 
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUserId}">
                                ${sessionScope.loggedInUserId} 님
                            </c:when>
                            <c:otherwise>
                                관리자 님
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <button onclick="logoutFuction()">로그아웃</button>
                </c:when>
                <c:otherwise>
                    <button onclick="loginFuction()">로그인</button>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
<script>
    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }

    function logoutFuction(){
        //로그아웃을 위한 AJAX 요청 / 비동기
        $.ajax({
            url: '/Doctorinhome/logout', //로그아웃을 처리하는 엔드포인트 url
            type: 'POST',
            success: function(response){
                console.log('로그아웃 성공');
                window.location.href = '/Doctorinhome/main';
            },
            error: function(xhr, status, error){
                console.error('로그아웃 실패:', error);
            }
        });
    }
</script>
</html>