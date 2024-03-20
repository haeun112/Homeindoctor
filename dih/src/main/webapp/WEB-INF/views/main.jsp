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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2cb40f952bbcf1f74c918696ae147297"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
<style>
    .contentW {
        max-width: 45.667rem;
    }

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

    .main_menu{
    text-align: center;
    margin: 2.167rem auto 0;
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

    button:hover {
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* 호버 시 그림자 효과 추가 */
    color: #262621;
    border-color: white;
}

    .button-container button:nth-of-type(2) {
        margin-right: 10px;
    }

    .right-align {
            margin-left: auto; /* 왼쪽 여백을 auto로 설정하여 오른쪽으로 밀어줌 */
    }

    .center-button button {
        font-family: 'GongGothicMedium', sans-serif;
            font-size: 1.4rem;
            text-align: center;
            color: #FFCDD2;
            display: block;
            width: 100%;
            height: auto;
            box-sizing: border-box;
            border-style: none;
            padding: 1.675rem 0;
            background-color: #757575;
            border-radius: 1rem;
    }

    .center-button button:hover {
        color: white;
    }

    .main1 {
        margin-left: 21.5rem;
        position: absolute;
        top: 0;
        left: 100%; /* 텍스트의 오른쪽에 배치 */
        margin-left: 10px; /* 이미지와 텍스트 간의 간격 조정 */
        opacity: 0.7;
        width: 15.25rem;
        height: auto;
    }

    .main2 {
        opacity: 0.7; /* 이미지의 투명도를 70%로 조절 */
        position: absolute;
        bottom: 0;
        right: 100%; /* 텍스트의 오른쪽에 배치 */
        margin-right: 10px;
        width: 12.25rem;
        height: auto;
    }

    .head-title-wrap {
        position: relative;
        display: inline-block;
    }

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
                <a href="">스마트 체온계</a>
                <a href="">닥터인홈</a>
                <a href="">A/S</a>
                <a href="">컨텐츠</a>
            </div>
            <!-- <span class="right-align"></span> -->
            <button onclick="loginFuction()">로그인</button>
        </div>
    </header>
    <main>
        <section class="contentW">
            <div class="head-title-wrap">
                <h2 class="hh">우리 아이 <span class="aa">진단</span></h2>
                <img src="img/main_img11.png" alt="메인이미지1" class="main1">
                <h2 class="hh"><span class="aa">집</span>에서 <span class="aa">정기적</span>으로 <span class="aa">손쉽게</span> 해보세요</h2>
                <h2 class="bb">중이염 후두염 발열</h2>
                <img src="img/main_img111.png" alt="메인이미지2" class="main2">
            </div>
            <div class="center-button">
                <button onclick="loginFuction()">확인하러 가기</button>
            </div>
        </section>
        <section class="contentM">
            <div class="middle-title-wrap">
                <div id="map" class="k-map" style="width: 31.25rem; height: 25rem;"></div>
            </div>
        </section>
    </main>
</body>
<script>
    function loginFuction(){
        let url = "/Doctorinhome/login";
        window.location.href = url;
    }

    //지도 api
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.4799665, 126.8826362),
        level: 3
    };
    //지도 생성
    var map = new kakao.maps.Map(container, options);
    //마커 표시될 위치
    var markerPosition = new kakao.maps.LatLng(37.4799665, 126.8826362);
    //마커 생성
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    //마커 표시
    marker.setMap(map);
</script>
</html>