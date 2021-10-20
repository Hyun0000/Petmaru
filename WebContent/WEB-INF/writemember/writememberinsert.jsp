<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/writememberinsert.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorpage.jsp" isErrorPage="false"%>
<!-- errorPage="errorpage.jsp" 에러가 발생했을때 보여질 에러페이지를 설정 -->
<!-- isErrorPage="false"로 설정해야 에러페이지로 이동(기본값이기에 굳이 작성하지 않아도 된다.) -->
<% String context_root = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <!-- <img src="#"> -->
                            <img src="#" id="review_img">
                        </div>
                        
                        <div class="second_div">
                            <p id="product_name"></p>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="first_row">
                        <div class="first_div">
                            <p>제목</p>
                        </div>
                        
                        <div class="second_div">
                            <!-- <input type="text" name="title" id="title" placeholder="20자 이내로 입력해주세요"> -->
                            <input type="text" id="title" placeholder="20자 이내로 입력해주세요">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="first_row">
                        <div class="first_div">
                            <p>상세리뷰</p>
                        </div>
                        
                        <div class="second_div">
                            <!-- <textarea name="contnet" id="contnet" rows="20" placeholder="최소 1글자 이상 작성해주세요"></textarea> -->
                            <textarea id="contnet" rows="20" placeholder="최소 1글자 이상 작성해주세요"></textarea>
                        </div>

                        <div id="file_div">
                            <label for="file" id="file_label">사진 올리기</label>
                            <input type="file" id="file" hidden>
                        </div>
                    </td>
                </tr>
            </table>

            <div id="review_insert_div">
            	<!-- JSON data담는 input -->
            	<input type="hidden" id="JSONData" name="JSONData">
                <button type="button" id="review_insert_btn">등록하기</button>
            </div>
        </form>
    </div>
<%@ include file="../template_footer.jsp" %>
    <script>
    	// JSON 객체 저장
    	// ex) data = {pno: '1', category: 'C', url: 'http://marlonshop.com/web/product/medium/202109/8b850806cacbd1dc2bada8006c8a9394.jpg'}
    	let data = ${obj};
    	
    	// JSON 객체 전체 읽는 예시
    	console.log(data);
    	
    	// JSON 객체 특정 key의 value 읽는 예시
    	console.log(data.pno);
    	
    	// 사진 경로 설정(사진 넣기)
    	let imgEle = document.getElementById('review_img');
    	imgEle.setAttribute("src", data.url);
    	
    	// 상품 이름 넣기
    	let pnameEle = document.getElementById('product_name');
    	pnameEle.innerText = data.pname;
    	
    	//==========================================================================================
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
                
            	// insert에 필요한 data 전달
            	let jsData = {
            		// 카테고리/상품번호/제목/내용/작성자/url
            		// category/pno/title/content/writer/url
           			category : data.category,
           			pno : data.pno,
           			title : titleEle.value,
           			content : contnetEle.value,
           			writer : "${memberLoginInfo}",
           			url : data.url
           			// 사진은 임시로 기존의 사진 그대로 업로드
            	}
            	
            	let jsonData = JSON.stringify(jsData);
            	document.getElementById('JSONData').value = jsonData;
            	console.log(document.getElementById('JSONData').value);
            	
                frmEle.action = "writememberinsert";
                frmEle.method = "post";
                frmEle.submit();
                alert("등록되었습니다."); 
            }
        }
    </script>
</body>
</html>