<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
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

                        </tbody>
                    </table>
                    <button id="loadMoreButton">더보기</button>

                    <!-- 댓글 입력 -->
                    <h3>댓글 작성</h3>
                    <form id="commentForm">
                        <input type="hidden" name="post_id" value="${board.post_id}">
                        <textarea name="comment_content" id="comment_content" cols="30"
                            rows="10"></textarea>
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
    // 초기화
    // $(document).ready(function () {
        
        let lastCommentId = null; // 마지막 댓글의 ID 초기화
        let page = 1; // 초기 페이지 번호
        const pageSize = 5; // 페이지당 댓글 수
        let postId = "${board.post_id}"; // 게시물 ID

        // 페이지 로드 시 댓글 로드
        loadComments(page);


        // 댓글 로드 함수
        function loadComments(page) {
            $.ajax({
                type: "GET",
                url: "/Doctorinhome/comments/getByPostId/" + postId + "?page=" + page,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].read_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].create_date + "</td>" +
                            "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i].comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id + ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }

        // 더보기 버튼 클릭 시 추가 댓글 로드
        $("#loadMoreButton").click(function () {
            page++; // 다음 페이지로 이동
            getComments();
        });

        // 추가 댓글 로드 함수
        function getComments() {
            $.ajax({
                type: "GET",
                url: "/Doctorinhome/comments/getByPostId/" + postId + "?page=" + page + "&pageSize=" + pageSize,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].read_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].create_date + "</td>" +
                            "<td><a href='#' onclick='editComment(" + data[i].comment_id + ", \"" + data[i].comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id + ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }

                    // 가져온 댓글의 개수가 pageSize 미만이면 더보기 버튼 숨김
                    if (data.length < pageSize) {
                        $("#loadMoreButton").hide();
                    } else {
                        $("#loadMoreButton").show();
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }



    // });

    // 댓글 작성 함수
    function addComment() {
        let commentContent = $("#comment_content").val();
        let postId = "${board.post_id}"; // 게시물 ID

        $.ajax({
            type: "POST",
            url: "/Doctorinhome/comments/add",
            data: JSON.stringify({
                post_id: postId,
                comment_content: commentContent
        }),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                // 반환된 댓글 데이터를 사용하여 화면에 추가
                let newComment = response;
                let serverTime = new Date(newComment.serverTime).toLocaleString(); // 서버 시간을 날짜와 시간 형식으로 변환

                let commentHtml = "<tr>" +
                    "<td>" + newComment.read_id + "</td>" +
                    "<td>" + newComment.comment_content + "</td>" +
                    "<td>" + serverTime + "</td>" + // 클라이언트 및 서버 시간 표시
                    "<td><a href='#' onclick='editComment(" + newComment.comment_id + ", \"" + newComment.comment_content + "\")'>수정</a></td>" +
                    "<td><a href='#' onclick='deleteComment(" + newComment.comment_id + ")'>삭제</a></td>" +
                    "</tr>";
                $("#comments").prepend(commentHtml); // 새로운 댓글을 목록의 맨 위에 추가
                $("#comment_content").val(""); // 입력 폼 초기화
            },
            error: function () {
                alert("로그인이 필요합니다.");
        }
        });
    }

    //글 삭제
    function confirmDelete(postId) {
        if (confirm("게시글을 삭제하시겠습니까?")) {
            let form = document.createElement("form");
            form.method = "POST";
            form.action = "/Doctorinhome/contents/delete?post_id=" + postId;
            document.body.appendChild(form);
            form.submit();
        }


    }

    //글 수정
    function openEditForm(commentId, commentContent) {
    $("#editCommentId").val(commentId);
    $("#editComentContent").val(commentContent);
    $("#editCommentForm").show();
    }

    //댓글 삭제
    function deleteComment(commentId) {
        $.ajax({
            type: "DELETE",
            url: "/Doctorinhome/comments/" + commentId,
            success: function () {
                // loadComments(page);
                // 삭제된 댓글의 DOM 요소를 제거
            $("#comments").find("[data-comment-id='" + commentId + "']").remove();
        },
            error: function () {
                alert("댓글 삭제 실패");
            }
    });
    }


    //댓글 수정
    function editComment() {
        let commentId = $("#editCommentId").val();
        let editedContent = $("#editCommentContent").val();
        $.ajax({
            type: "PUT",
            url: "/Doctorinhome/comments/" + commentId,
            data: JSON.stringify({
                comment_content: editedContent
            }),
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
            
                // 수정된 댓글의 내용을 업데이트
            $("#comments").find("[data-comment-id='" + commentId + "']").find(".comment-content").text(editedContent);
                $("#editCommentId").val("");
                $("#editCommentContent").val("");
                $("#editCommentForm").hide();
            },
        error: function () {
                alert("댓글 수정 실패");
            }
        });
    }


</script>
</html>