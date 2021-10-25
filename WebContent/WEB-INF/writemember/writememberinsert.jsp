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
        <form id="review_insert_form" enctype="multipart/form-data">
            <table id="review_insert_table">
                <tr>
                    <td class="first_row">
                        <div class="first_div">
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
                            <textarea name="content" id="content" rows="20" placeholder="최소 1글자 이상 작성해주세요"></textarea>
                        </div>

                        <div id="file_div">
                            <label for="file" id="file_label">사진 올리기</label>
                            <input type="file" name="file" id="file" hidden>
                            <!-- 일단은 단일 파일 업로드만 진행 -->
                            
                            
                            <!-- <input type="file" id="file" name="file" hidden> -->
                            <!-- 다중 파일 업로드 -->
                            <!-- <input type="file" name="file"> -->
                            <!-- <input type="file" name="file"> -->
                            <!-- (name="file")은 동일하게 해서 받을때 배열(OR 컬랙션)형태로 받는다. -->
                        </div>
                    </td>
                </tr>
            </table>

            <div id="review_insert_div">
            	<input type="hidden" id="category" name="category">
            	<input type="hidden" id="pno" name="pno">
            	<input type="hidden" id="writer" name="writer">
                <button type="button" id="review_insert_btn">등록하기</button>
            </div>
        </form>
    </div>
<%@ include file="../template_footer.jsp" %>
<script type="text/javascript">
	// JSON 객체 저장
	// ex) data = {"pno":"1","pname":"MONCHOUCHOU 10yrs Young Dog Frill Top Violet","category":"C","url":"http:\/\/marlonshop.com\/web\/product\/medium\/202109\/8b850806cacbd1dc2bada8006c8a9394.jpg"}
  	let data = ${obj};
  	let memberLoginInfo = "${memberLoginInfo}";
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/template_header.js"></script>
<script src="<%=context_root %>/js/writemember/writememberinsert.js"></script>
</body>