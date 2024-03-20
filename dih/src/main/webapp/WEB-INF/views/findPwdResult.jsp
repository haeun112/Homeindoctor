<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 확인</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
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
                <h3 class="head-title">비밀번호 재설정</h3>
            </div>
            <c:choose>
                <c:when test="${updatePassword}">
                    <div class="content-wrap">
                        <p class="idp">비밀번호를 재설정합니다.</p>
                        <form action="/Doctorinhome/update/password" method="post" id="pwdUd" name="pwdUd">
                            <div class="update-pwd">
                                <label for="user_pwd" class="input-layout">
                                    <input type="password" name="user_pwd" id="user_pwd" class="in-close" required="required" placeholder="새로운 비밀번호" maxlength="15" autocomplete="off">
                                </label>
                                <p class="input-info" id="pwdMsg">입력한 내용이 없어요.</p>
                            </div>
                            <div class="update-pwd">
                                <label for="pwdConfirm" class="input-layout">
                                    <input type="password" id="pwdConfirm" name="pwdConfirm" class="in-close" required="required" maxlength="15" placeholder="새로운 비밀번호 확인" autocomplete="off">
                                </label>
                                <p class="input-info" id="pwdConfirmMsg">입력한 내용이 없어요.</p>
                            </div>
                            <div class="btn-wrap">
                                <button id="updateBtn" class="updateBtn" onclick="update()">설정하기</button>
                            </div>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- 아이디와 비밀번호가 일치하지 않는 경우에 대한 처리 -->
                    <div class="content-wrap">
                        <p class="idp">일치하는 아이디나 이메일이 없습니다.</p>
                        <a href="/Doctorinhome/join">가입 하러 가기</a>
                    </div>
                </c:otherwise>
            </c:choose>
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