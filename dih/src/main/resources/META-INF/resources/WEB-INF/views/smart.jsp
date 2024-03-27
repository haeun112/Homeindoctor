<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
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

    .line-border {
        &::before,
    &::after{
        content: "";
        display: block;
        width: 100%;
        height: 1px;
        border: none;
        background-color: #212121;
    }
    >p{
        min-width: 3rem;
        color: #424242;
        text-align: center;
    }
    }

    .item-upload {
        text-align: right;
        margin-bottom: -5.55rem;
    }
    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="item-upload">
                <button onclick="itemUpload()">등록</button>
            </div>
            <div class="line-border">
                <p>스마트 체온계</p>
            </div>
        </section>
    </main>
</body>
<script>
    function itemUpload(){
        let url = "/Doctorinhome/goodsUpload";
        window.location.href = url;
    }
</script>
</html>