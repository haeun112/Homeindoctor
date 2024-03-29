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
    <title>컨텐츠</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <link rel="stylesheet" href="${path}/css/board.css">
    <style>
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

    
    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="line-border">
                <p>게시판</p>
            </div>
            <div class="board-container">
                <div class="row">
                    <div class="col-md-offset-1 col-md-10">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col col-sm-3 col-xs-12">
                                        <form action="/Doctorinhome/contents" method="get" style="text-align: right;">
                                            <label for="text" id="keyword" name="keyword">
                                                <input type="text" id="keyword" name="keyword" required autocomplete="off" placeholder="검색어">
                                                <input type="submit" value="검색">
                                            </label>
                                        </form>
                                        <c:if test="${not empty sessionScope.loggedInAdminId}">
                                            <a href="/Doctorinhome/contents/write" class="rrr">작성하기</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="pannel-bady table-responsive">
                                 <table>
                                    <thead>
                                        <tr>
                                            <th>작성자</th>
                                            <th>제목</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <thead>
                                            <c:forEach var="board" items="${boardDtoList}">
                                                <tr>
                                                    <td>${board.admin_id}</td>
                                                    <td><a href="/Doctorinhome/contents/detail?post_id=${board.post_id}">${board.post_title}</a></td>
                                                    <td>${board.read_cnt}</td>
                                                    <td>${board.create_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </thead>
                                    </tbody>
                                 </table>
                                 <div class="paging">
                                    <c:if test="${totalPages > 1}">
                                        <c:choose>
                                            <c:when test="$currentPage > 1">
                                                <a href="/Doctorinhome/contents?page=1&pageSize=${pageSize}&keyword=${keyword}">처음</a>
                                                <a href="/Doctorinhome/contents?page=${currentPage - 1}&pageSize=${pageSize}&keyword=${keyword}">이전</a>
                                            </c:when>
                                            <c:otherwise>
                                                <span>처음</span>
                                                <span>이전</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <c:choose>
                                                <c:when test="${i eq crrentPage}">
                                                    <span>${i}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/Doctorinhome/contents?page=${i}&pageSize=${pageSize}&keyword=${keyword}">${i}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${currentPage < totalPages}">
                                                <a href="/Doctorinhome/contents?page=${currentPage +1}&pageSize=${pageSize}&keyword=${keyword}">다음</a>
                                                <a href="/Doctorinhome/contents?page=${totalPages}&pageSize=${pageSize}&keyword=${keyword}">마지막</a>
                                            </c:when>
                                            <c:otherwise>
                                                <span>다음</span>
                                                <span>마지막</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>