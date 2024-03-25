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
    <title>컨텐츠 작성</title>
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
                <form action="/Doctorinhome/contents/write" method="post">
                    <input type="text" id="post_title" name="post_title" placeholder="제목을 입력하세요" required>
                    <textarea name="post_content" id="post_content" cols="30" rows="10" placeholder="내용을 입력하세요" required></textarea>
                    <input type="submit" value="작성">
                </form>
            </div>
        </section>
    </main>
</body>
</html>