<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/writemember/writememberinsert.css"/>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Petmaru</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
	    <div id="review_insert_box">
        <form id="review_insert_from">
            <table id="review_insert_table">
                <tr>
                    <td class="first_row">
                        <div class="first_div">
                            <img src="https://via.placeholder.com/250">
                        </div>
                        
                        <div class="second_div">
                            <p id="product_name">상품명(옵션 : 색상, 수량 등)</p>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="first_row">
                        <div class="first_div">
                            <p>제목</p>
                        </div>
                        
                        <div class="second_div">
                            <input type="text" name="title" id="title" placeholder="20자 이내로 입력해주세요">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="first_row">
                        <div class="first_div">
                            <p>상세리뷰</p>
                        </div>
                        
                        <div class="second_div">
                            <textarea name="contnet" id="contnet" rows="20" placeholder="최소 1글자 이상 작성해주세요"></textarea>
                        </div>

                        <div id="file_div">
                            <label for="file" id="file_label">사진 올리기</label>
                            <input type="file" id="file" hidden>
                        </div>
                    </td>
                </tr>
            </table>

            <div id="review_insert_div">
                <button type="button" id="review_insert_btn">등록하기</button>
            </div>
        </form>
    </div>
<%@ include file="../template_footer.jsp" %>
    <script>
        // 등록하기 버튼 이벤트 지정
        document.getElementById('review_insert_btn').onclick = insertReview;

        // 등록하기 버튼 이벤트 함수 생성
        function insertReview() {
            // 등록 버튼용 boolean 변수
            let insertBool = true;

            // 제목 유효성 검사
            // 1~20자 이상(공백 포함)
            var titleEle = document.getElementById('title');

            if (titleEle.value.length < 1 || titleEle.value.length > 20) {
                alert("제목을 글자 수에 맞게 입력해주세요");
                insertBool = false;
            }

            // 내용 유효성 검사
            // 최소 1글자 이상(공백 포함)
            var contnetEle = document.getElementById('contnet');

            if (contnetEle.value.length < 1) {
                alert("내용을 최소 1글자 이상 작성해주세요");
                insertBool = false;
            }

            // 모든 유효성 검사 통과하면 등록완료
            if (insertBool == true) {
                var frmEle = document.getElementById('review_insert_from');
                frmEle.action = "#";
                frmEle.method = "post";
                frmEle.submit();
                alert("등록되었습니다."); 
            }
        }
    </script>
</body>
</html>