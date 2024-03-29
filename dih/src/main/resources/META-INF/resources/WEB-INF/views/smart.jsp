<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.DecimalFormat" %>
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
        text-align: left;
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
            <!-- 검색어 입력 -->
            <form action="/Doctorinhome/smart" method="get" style="text-align: right;">
                <div class="form-group">
                    <label for="text" id="keyword" name="keyword">
                        <input type="text" id="keyword" name="keyword" required autocomplete="off" placeholder="검색">
                        <input type="submit" value="검색">
                    </label>
                </div>
            </form>
            <br>
            <hr>
            <br>
                <div class="goods-container">
                    <table>
                        <div class="goods-list">
                            <div class="goods-info">
                                <c:forEach var="goods" items="${goodsDtoList}">
                                        <!-- 상품 정보 표시 -->
                                            <tr>
                                                <td>
                                                    <a href="/Doctorinhome/goodsDetail?goods_id=${goods.goods_id}">
                                                        <img src="${path}/upload/${goods.goods_imgName}" alt="Goods Img" style="width: 20%; height: 20%;">
                                                    </a>
                                                </td>
                                                <td><h5 class="card-title">${goods.goods_name}</h5></td>
                                                <td>가격: <fmt:formatNumber value="${goods.goods_price}" pattern="###,### 원"/></td>
                                            </tr>
                                </c:forEach>
                            </div>
                        </div>
                    </table>
                </div>

                <div class="page">
                    <!-- 처음 버튼 -->
                    <a href="/Doctorinhome/smart?keyword=${keyword}&pageNum=1" class="page-link">처음</a>

                    <!-- 이전 버튼 -->
                    <c:if test="${currentPage > 1}">
                        <a href="/Doctorinhome/smart?keyword=${keyword}&pageNum=${currentPage - 1}" class="page-link"></a>
                    </c:if>

                    <!-- 페이지 번호 5개씩 표시 -->
                    <c:forEach var="i"
                        begin="${currentPage - 1 > 0 ? currentPage - 1 : 1}"
                        end="${currentPage + 1 < goodsList.size() ? currentPage + 1 : goodsList.size()}">
                        <c:choose>
                            <c:when test="${i eq currentPage}">
                                <span class="page-link">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/Doctorinhome/smart?keyword=${keyword}&pageNum=${i}" class="page-link">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- 다음 버튼 -->
                    <c:if test="${currentPage + 1 < goodsList.size()}">
                        <a href="/Doctorinhome/smart?keyword=${keyword}&pageNum=${currentPageNum} + 1" class="page-link">다음</a>
                    </c:if>

                    <!-- 마지막 버튼 -->
                    <a href="/Doctorinhome/smart?keyword=${keyword}&pageNum=${goodsList.size()}" class="page-link">마지막</a>
                </div>
            
        </section>
    </main>
</body>
<script>
    function itemUpload(){
        let url = "/Doctorinhome/goodsUpload";
        window.location.href = url;
    }

    let goodsId = "$goods.goods_id";

    function moerInfo(){
        let url = '/Doctorinhome/goodsDetail?goodsId=${goods.goods_id}';
        windos.location.href = url;
    }

    function updatePageLink(keyword, pageNum){
        var link = document.getElementById("pageLink");
        if(link){
            var updatedHref = "Doctorinhome" + "smart" + "?keyword=" + encodeURIComponent(keyword) + "&pageNum=" + pageNum;
            link.setAttribute("href", updatedHref);
        }
    }
</script>
</html>
