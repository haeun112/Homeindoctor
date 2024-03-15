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
    </style>
</head>
<body>
    <div>
        <button onclick="mainFuction()">홈</button>
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
</script>
</html>