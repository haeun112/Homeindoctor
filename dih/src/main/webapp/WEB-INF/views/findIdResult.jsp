<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디확인</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        .idp {
            font-family: 'GongGothicMedium', sans-serif;
            font-size: 24px;
        }

        .content-wrap {
            text-align: center;
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
                <h3 class="head-title">아이디 찾기 결과</h3>
            </div>
            <c:if test="${notFound}">
                <div class="content-wrap">
                    <p class="idp">일치하는 아이디가 없습니다.</p>
                    <a href="/Doctorinhome/join">가입 하러 가기</a>
                </div>
            </c:if>
            <c:if test="${!notFound}">
                <div class="content-wrap">
                    <p class="idp">일치하는 아이디</p>
                    <c:forEach items="${foundId}" var="id">
                        <p>${id}</p>
                    </c:forEach>
                    <a href="/Doctorinhome/login">로그인 하러 가기</a>
                    <a href="/Doctorinhome/find/pwd">비밀번호 찾기</a>
                </div>
            </c:if>
        </section>
    </main>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }
</script>
</html>