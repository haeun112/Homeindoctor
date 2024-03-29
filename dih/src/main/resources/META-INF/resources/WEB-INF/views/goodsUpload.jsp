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
    <title>상품 등록</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="icon" type="image/x-icon" href="${path}/img/home.ico">
    <link rel="stylesheet" href="${path}/css/styles.css">
    <style>
        .contentA {
            background-color: aliceblue;
            max-width: 50%;
        }

        .itup {
            color: rgb(0, 0, 0);
            font-size: 2rem;
            text-align: left;
        }

        .itemBox table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <main>
        <section class="contentA">
            <div class="item-upload">
                <h2 class="itup">상품 등록</h2>
            </div>
            <form action="/Doctorinhome/goodsUpload" id="insertForm" name="insertForm" method="POST" enctype="multipart/form-data">
                <div class="item_name">
                    <label for="goods_name" class="item-layout">상품 이름</label>
                    <input type="text" name="goods_name" id="goods_name" class="out-close" required autocomplete="off">
                </div>
                <div class="item_img">
                    <label for="goods_img" class="item-layout">상품 사진</label>
                    <input type="file" name="imgFile" id="imgFile" class="out-close" required autocomplete="off">
                </div>
                <div class="item_intro">
                    <label for="goods_intro" class="item-layout">상세 설명</label>
                    <textarea name="goods_intro" id="goods_intro" cols="30" rows="10" class="out-close" required autocomplete="off"></textarea>
                </div>
                <div class="item_price">
                    <label for="goods_price" class="item-layout">상품 가격</label>
                    <input type="number" name="goods_price" id="goods_price" class="out-close" required autocomplete="off">
                </div>
                <div class="item_stock">
                    <label for="stock" class="item-layout">상품 재고</label>
                    <input type="number" name="stock" id="stock" class="out-close" required autocomplete="off">
                </div>
            </form>
            <div class="btn-item"> 
                <button id="itemBtn" class="itemBtn" onclick="iInsert()">등록</button>
                <button id="itemBtn" class="itemBtn" onclick="iCancel()">취소</button>
            </div>
        </section>
    </main>
</body>
<script>
    //상품 등록 POST
    $('#insertForm').submit(function(event){
        event.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: '/Doctorinhome/goodsUpload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response){
                var goodsNmae = $('#goods_name').val();
                var goodsImg = $('#goods_img').val();
                var goodsIntro = $('#goods_intro').val();
                var goodsPrice = $('#goods_price').val();
                var stock = $('#stock').val();

                console.log('상품 등록 성공');
                console.log('상품명: ', goodsNmae);
                console.log('사진: ', goodsImg);
                console.log('설명: ', goodsIntro);
                console.log('가격: ', goodsPrice);
                console.log('재고: ', stock);

                window.location.href = '/Doctorinhome/smart';
            },
            error: function(xhr, status, error){
                console.error('오류: ', error);
                alert('상품을 등록하는 중에 문제가 발생했습니다.\n다시 시도해주세요.');
            }
        });
    });

    function iInsert(){
        $('#insertForm').submit();
    }

    function iCancel(){
        let url = "/Doctorinhome/smart";
        window.location.href = url;
    }

    
</script>
</html>