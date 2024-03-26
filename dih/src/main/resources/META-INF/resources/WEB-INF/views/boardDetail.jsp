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
    <title>컨텐츠 상세보기</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <link rel="stylesheet" href="${path}/css/board.css">
</head>
<body>
    <main>
        <section class="contentA">
            <div class="board-container">
                <c:if test="${not empty board}">
                    <div class="pu">
                        <table>
                            <tr>
                                <th>게시글 번호 ${board.post_id}</th>
                                <th>작성자 ${board.admin_id}</th>
                                <th>작성일 ${board.create_date}</th>
                            </tr>
                        </table>
                    </div>
                    <div class="titi">
                        <table>
                            <tr>
                                <th>제목 ${board.post_title}</th>
                            </tr>
                        </table>
                    </div>
                    <div class="wiwi">
                        <table>
                            <tr>
                                <th>${board.post_content}</th>
                            </tr>
                        </table>
                    </div>
                    <div class="mimi">
                        <table>
                            <c:if test="${loggedInAdminId eq board.admin_id}">
                                <a href="/Doctorinhome/contents/edit?post_id=${board.post_id}">수정</a>
                                <a href="#" onclick="confirmDelete('${board.post_id}')">삭제</a>
                            </c:if>
                        </table>
                    </div>
                </c:if>
                <!--  댓글 -->
                <h2>댓글</h2>
                <table class="riri">
                    <thead style="text-align: center;">
                        <tr>
                            <th>작성자</th>
                            <th>내용</th>
                            <th>작성일</th>
                            <th>수정</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody id="comments">
                        <!-- 댓글에 이곳에 동적으로 추가됨 -->
                    </tbody>
                </table>
                <button id="loadMoreButton">더보기</button>

                <!-- 댓글 입력 -->
                <h3>댓글 작성</h3>
                <form id="commentForm">
                    <input type="hidden" name="post_id" value="${board.post_id}">
                    <textarea name="comment_content" id="comment_content" cols="30" rows="10"></textarea>
                    <br>
                    <div class="didi">
                        <input type="button" value="댓글 작성" onclick="addComment()">
                    </div>
                </form>

                <!-- 댓글 수정 -->
                <form id="editCommentForm" style="display: none;">
                    <input type="hidden" id="editCommentId" name="comment_id">
                    <textarea name="comment_content" id="editCommentContent" cols="30" rows="10" required autocomplete="off" placeholder="내용을 작성하세요."></textarea>
                    <br>
                    <input type="button" value="댓글 수정" onclick="editComment()">
                </form>
                <div class="mama">
                    <a href="/Doctorinhome/contents">목록으로 돌아가기</a>
                </div>
            </div>
        </section>
    </main>
</body>
<script>
    //댓글 로드
    function loadComments(page){
        let postId = "${board.post_id}";

        $.ajax({
            type: "GET",
            url: "/Doctorinhome/comments/getByPostId/" + postId + "?page=" + page + "&pageSize=" + pageSize,
            contentType: "application/json",
            dataType: "json",
            success: function(data){
                //서버에서 가져온 댓글을 화면에 추가
                for(let i=0; i<data.length; i++){
                    let commentHtml = "<tr>" + 
                        "<td>" + data[i].read_id + "</td>" +
                        "<td>" + data[i].comment_content + "</td>" +
                        "<td>" + data[i].create_date + "</td>" +
                        "<td><a href='#' onclick='openEdiForm(" + data[i].comment_id + ", \"" + data[i].comment_content + "\")'>수정</a></td>" + "</tr>";
                        $("#comments").append(commenthtml);
                }

                //가져온 댓글의 개수가 pageSize 미만이면 더보기 버튼 숨김
                if(data.length < pageSize){
                    $("#loadMoreButton").hide();
                }else{
                    $("#loadMoreButton").show();
                }
            },
            error: function(){
                alert("댓글 불러오기 실패");
            }
        });
    }

    //ajax로 댓글 작성
    function addComment(){
        let commentContent = $("#comment_content").val();

        $.ajax({
            type: "POST",
            url: "/Doctorinhome/comments/add",
            data: JSON.stringify({
                post_id: postId,
                comment_content: commentContent
            }),
            contentType: "application/json",
            dataType: "json",
            success: function(){
                //댓글 작성시 화면 갱신(입력 폼 초기화)
                $("#comment_content").val("");
                loadComments(1);
            },
            error: function(){
                alert("댓글 작성 실패");
            }
        });
    }
</script>
</html>