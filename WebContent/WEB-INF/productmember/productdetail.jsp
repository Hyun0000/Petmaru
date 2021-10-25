<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/writememberupdate.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@page import="com.petmaru.member.write.model.vo.WriteMemberReviewVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
 	ArrayList<WriteMemberReviewVo> productMemberReview = (ArrayList<WriteMemberReviewVo>)request.getAttribute("productMemberReview");
	ProductMemberVo product = (ProductMemberVo)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="<%=context_root %>/js/productmember/productdetail.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Petmaru</title>
</head>
<body>
<%-- ${memberLoginInfo} --%>
<%@ include file="../template_header.jsp" %>
       <section id="detail_section">
       	<div id="detail_div_box">
	        <div id="product_img">
	            <img src="<%=product.getProductImgUrl() %>">
	        </div>
	
	        <div id="product_write_icon">
	            <div id="write">
	                <h1><%=product.getProductName() %></h1>
	                <h4><%=product.getCom() %></h4>
	            </div>
	            
	            <c:if test="${product.productCategory == 'C' }">
	            <div id="option">
                    <div id="size_div">
                        <select name="size" id="size_select">
                            <option value="">Select Option</option>
                            <option value="">------------------------</option>
                            <option value="SM">SM</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                        </select>
                    </div>

                    <!-- 색깔 & 수량을 담는 div -->
                    <div id="color_div"></div>
                    
                    <!-- 선택완료된 전체 옵션을 담는 table -->
                    <table id="productChoiceTable">
                    	<tr id="option_introduce"><td>옵션을 선택해주세요</td></tr>
                    </table>
                </div>
				</c:if>
				
                <div id="price_div">
	              <c:if test="${product.productCategory != 'C' }">
	                    <div id="other_category_count_div">
	                        <img src="/Petmaru/image/count_plus.png" alt="" class="count_icon" id="count_increase">
	                        <input type="text" id="other_category_count_input" value="1" readonly>
	                        <img src="/Petmaru/image/count_minus.png" alt="" class="count_icon" id="count_decrease">
	                    </div>
				  </c:if>
                    <h3 id="price"><%=product.getPrice() %></h3><span id="price-span">원</span>
                    <c:if test="${payYN == 'Y'}">
		                <!-- JSON을 이용해 data 전송 -->
		                <form id="insertForm">
		                <input type="hidden" id="test" name="test">
		                <button id="insertA">후기작성</button>
		              	</form>
	              	</c:if>
                </div>
                
	            <div id="buy_cart_btn">
	                <form id="buy_form">
	                <button id="purchase">BUY</button>
	                <input type="hidden" id="buy_json" name="buy_json">
	                </form>
	                <a href="#" id="cart">CART</a>
	            </div>
	        </div>
        </div>
    </section>
    
	<section id="review_sec">
       <div id="review_top_line"><h1>Review</h1></div>
		<div id="review_content">
	         <ul id="review_list">
	         	<c:forEach var="productMemberReview" items="${productMemberReview}">
						<c:set var="k" value="${1+k}"></c:set>
		                <li class="review_li_same review_li_${k}">
		                    <div class="review_img_same review_img_${k}">
		                        <img src="#" class="img_same img_same_${k}">
		                    </div>
		
		                    <div id="review_box">
		                        <h5 class="review_title_same review_title_${k}"></h5><br>
		                        <p class="review_write_content_same review_write_content_${k}"></p><br>
		                    
		                        <div class="review_write_info">
		                        	<div class="review_writer_date">
			                            <span class="review_writer_same review_writer_${k}"></span>
			                            <span class="review_date_same review_date_${k}"></span>
		                            </div>
		                            <div class="btns btns_${k}" style="display: none;">
				                            	<button class="review_update_same review_update_${k}">수정</button>
				                            	<button class="review_delete_same review_delete_${k}">삭제</button>
		                            </div>
		                        </div>
		                    </div>
		                </li>
	                </c:forEach>
	            </ul>
		</div>
		
		<div id="page">
			<c:choose>
				<c:when test="${selectPage > endPageLink }">리뷰가 존재하지 않습니다.</c:when>
				<c:when test="${selectPage < startPageLink }">리뷰가 존재하지 않습니다.</c:when>
				<c:when test="${selectPage != 0 }">
					<c:forEach begin="${startPageLink}" end="${endPageLink}" step="1" var="i">
						<button class="pageLink_same pageLink_${i}">${i}</button>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	
	<%@ include file="../template_footer.jsp" %>
	
		<!-- 후기 수정 창(모달창 형식) -->
       <div id="update_box">
       		<form enctype="multipart/form-data" id="update_form">
               <table id="update_table">
                   <tr>
                       <td class="title_td">제목</td>
                       <td class="content_td">
                       <input id="update_title" name="update_title" type="text">
                       <input id="update_title_origin" name="update_title_origin" type="hidden">
                       <input type="hidden" value="${memberLoginInfo}" id="update_id" name="update_id"> <!-- 조건으로 보낼 id -->
                       <input type="hidden" value="${product.productCategory}" id="update_category" name="update_category">
                       <input type="hidden" value="${product.productNo}" id="update_productNo" name="update_pno">
                       <input type="hidden" id="update_imgUrl" name="update_imgUrl"> <!-- js를 이용해 value 설정 -->
                       </td>
                   </tr>

                   <tr>
                       <td class="title_td">상세리뷰</td>
                       <td class="content_td" id="textarea_td"><textarea id="update_content" name="update_content" cols="80" rows="15"></textarea></td>
                   </tr>

                   <tr>
                       <td class="title_td">사진첨부</td>
                       <td class="content_td">
                           <label id="update_photo_label" for="update_photo">업로드</label>
                           <input type="file" id="update_photo" hidden="hidden" name="update_photo">
                       </td>
                   </tr>

                   <tr>
                       <td colspan="2" id="btn_td"><button type="button" id="update_btn">후기 수정</button></td>
                   </tr> 
               </table>
             </form>
         </div>

<!-- js 데이터 전달용 input 태그들 -->         
<input type="hidden" value="${product.productCategory}" id="category_js">
<input type="hidden" value="${product.productNo}" id="productNo_js">
<input type="hidden" value="${product.productImgUrl}" id="productImgUrl_js">
<input type="hidden" value="${product.productName}" id="productName_js">
<input type="hidden" value="${startPageLink}" id="startPageLink_js">
<input type="hidden" value="${endPageLink}" id="endPageLink_js">
<input type="hidden" value="${memberLoginInfo}" id="memberLoginInfo_js">
<input type="hidden" value="${PAGE_SIZE}" id="PAGE_SIZE_js">
<input type="hidden" value="${payYN}" id="payYN_js">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="<%=context_root %>/js/productmember/productdetail.js"></script>
</body>
</html>