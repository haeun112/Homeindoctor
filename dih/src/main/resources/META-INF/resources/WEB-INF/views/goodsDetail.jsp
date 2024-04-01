<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
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

        .row {
            display: flex;
            flex: 1;
        }

        .col {
            flex: 1;
            margin: 0.3125rem; /* 5px를 rem으로 변환 */
            background-color: inherit;
            padding: 0.625rem; /* 10px를 rem으로 변환 */
            box-sizing: border-box;
        }

        .row.content-center {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="board-container">
                <div class="line-border">
                    <p>스마트 체온계</p>
                </div>
                <c:if test="${not empty goods}">
                    <div class="detail">
                        <div class="row content-center">
                            <div class="col-6">
                                <div class="row mb-3"></div>
                                <div class="row mb-3">
                                    <div class="col" style="background-color: beige;">
                                        <img src="${path}/upload/${goods.goods_imgName}" alt="Goods Img" style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="col">
                                        <div class="row mb-3">
                                            <label for="" col-3>상품명</label>
                                            <label for="" col-9>${goods.goods_name}</label>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="" col-3>가격</label>
                                            <label for="" col-9><fmt:formatNumber value="${goods.goods_price}" pattern="###,### 원"/></label>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="" col-3>수량</label>
                                            <div class="col-9">
                                                <input type="number" class="form-control" id="quantityInput" value="1" onchange="calculateTotalPrice()">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="" col-3>총가격</label>
                                            <label for="" class="col-9" id="totalPriceLabel"></label>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="d-grid"><a href="#" class="btn-primary">바로구매</a></div>
                                            <div class="d-grid"><a href="#" class="btn-cart">장바구니</a></div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <hr>
                                <br>
                                <div class="row mb-3" style="background-color: bisque;">
                                    <div class="col">
                                        ${goods.goods_intro}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>
    </main>
</body>
<script>
    window.onload = function() {
        calculateTotalPrice(); // 페이지가 로드될 때 총가격 계산 함수 호출
    };

    function calculateTotalPrice() {
        // 가격 가져오기
        var price = "${goods.goods_price}";
        // 수량 가져오기
        var quantity = document.getElementById('quantityInput').value;
        // 총가격 계산
        var totalPrice = price * quantity;
        // 총가격을 출력할 레이블에 설정
        document.getElementById('totalPriceLabel').innerHTML = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalPrice);
    }
</script>
</html>