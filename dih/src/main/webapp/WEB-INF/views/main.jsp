<%@ page pageEncoding="UTF-8" %>
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
    .center-button {
        text-align: center;
    }

    .hh {
        color: white;
    }

    .aa {
        color: brown;
    }

    .bb {
        color: red;
    }

    .button-container {
            display: flex; /* Flexbox 사용 */
            justify-content: space-between; /* 버튼 사이의 공간을 균등하게 배분하여 왼쪽과 오른쪽으로 정렬 */
    }

    .button-container button {
            display: block; /* 버튼 요소를 block으로 변경 */
    }

    .button-container button:nth-of-type(2) {
        margin-right: 10px;
    }

    .right-align {
            margin-left: auto; /* 왼쪽 여백을 auto로 설정하여 오른쪽으로 밀어줌 */
    }
</style>
</head>
<body>
    <div class="button-container">
        <button onclick="mainFuction()">홈</button>
        <span class="right-align"></span>
        <button onclick="loginFuction()">바로 가입</button>
        <button onclick="loginFuction()">로그인</button>
    </div>
    <div>
        <h2 class="hh">우리 아이 <span class="aa">진단</span></h2>
        <h2 class="hh"><span class="aa">집</span>에서 <span class="aa">정기정</span>으로 <span class="aa">손쉽게</span> 해보세요</h2>
        <h2 class="bb">중이염 후두염 발열</h2>
    </div>
    <div class="center-button">
        <button onclick="loginFuction()">확인하러 가기</button>
    </div>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
        window.location.href = url;
    }

    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }
</script>
</html>