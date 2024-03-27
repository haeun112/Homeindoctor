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
    <title>컨텐츠 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <link rel="stylesheet" href="${path}/css/board.css">
    <style>
        .board-container{
            text-align: center;
            margin-left: 14%;
            margin-top: 9%;
        }

form {
    max-width: 600px; 
    margin: 0 auto; 
}


form input[type="text"], form textarea {
    width: 100%;
    padding: 10px; 
    margin-bottom: 10px;
}

form textarea {
            height: 300px;
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="board-container">
                <form action="/Doctorinhome/contents/update" method="post">
                    <input type="hidden" name="post_id" value="${board.post_id}">
                    <label for="post_title">
                        <input type="text" id="post_title" name="post_title" value="${board.post_title}" required autocomplete="off">
                    </label>
                    <br>
                    <label for="post_content">
                        <textarea name="post_content" id="post_content" cols="30" rows="10">${board.post_content}</textarea>
                    </label>
                    <br>
                    <input type="submit" value="수정">
                </form>
            </div>
            <div class="returnB">
                <a href="/Doctorinhome/contents/detial?post_id=${board.post_id}">게시글로 돌아가기</a>
            </div>
        </section>
    </main>
</body>
</html>