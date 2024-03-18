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
        .box-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 70%;
            margin: 0 auto;
            height: 500px;
        }

        .button-container {
            display: flex; /* Flexbox 사용 */
            justify-content: space-between; /* 버튼 사이의 공간을 균등하게 배분하여 왼쪽과 오른쪽으로 정렬 */
        }
    </style>
</head>
<body>
    <div class="button-container">
        <button onclick="mainFuction()">홈</button>
        <span class="right-align"></span>
        <button onclick="logoutFuction()">로그아웃</button>
    </div>
    <div>
        <h2>건강 차트</h2>
    </div>
    <div class="box-container">

    </div>
</body>
<script>
    function mainFuction(){
        let url = "/Doctorinhome/main";
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