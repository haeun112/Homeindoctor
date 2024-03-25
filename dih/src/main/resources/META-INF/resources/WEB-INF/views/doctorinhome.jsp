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
    <title>닥터인홈앱</title>
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

        .contentA {
            margin: 4.167rem auto 0;
            max-width: 70%;
        }

        p {
            /* font-family: 'GongGothicMedium', sans-serif; */
            font-size: 1.875rem;
            color: white;
            text-align: center;
        }

        .app1 {
            width: 16.167rem;
            height: auto;
        }

        .app2 {
            width: 15.7rem;
            height: auto;
        }

        .frs {
            margin-top: 5.875rem;
            display: flex;
        }

        .frs img {
        margin-right: 10px; /* 이미지 사이의 간격을 조절합니다. */
        }

        .frs h1 {
            margin-left: 7.578rem;
        }

    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="app-content">
                <div class="head-title-wrap">
                    <p>닥터인홈으로 우리 아이 관리 시작하세요</p>
                </div>
            </div>
            <div class="app-idc">
                <div class="frs">
                    <img src="img/app1.png" alt="앱소개1" class="app1">
                    <img src="img/app2.png" alt="앱소개2" class="app2">
                    <h1>체온재기와 중이염 진단을 한번에!</h1>
                </div>
            </div>
        </section>
    </main>
</body>
<script>

</script>
</html>