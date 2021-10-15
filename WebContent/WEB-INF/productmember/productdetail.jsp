<%@page import="com.petmaru.member.write.model.vo.WriteMemberReviewVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
 	ArrayList<WriteMemberReviewVo> productMemberReview = (ArrayList<WriteMemberReviewVo>)request.getAttribute("productMemberReview");
	int totalPageLink = (int)request.getAttribute("totalPageLink");
	int startPageLink = (int)request.getAttribute("startPageLink");
	int endPageLink = (int)request.getAttribute("endPageLink");
	int selectPage = (int)request.getAttribute("selectPage"); 
	ProductMemberVo product = (ProductMemberVo)request.getAttribute("product");
%>
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
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/writememberupdate.css"/>
<script type="text/javascript" src="<%=context_root %>/js/productdetail.js" ></script>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Petmaru</title>
</head>
<body>

<%@ include file="../template_header.jsp" %>
       <section>
        <div id="product_img">
            <img src="<%=product.getProductImgUrl() %>">
        </div>

        <div id="product_write_icon">
            <div id="write">
                <h1><%=product.getProductName() %></h1>
                <h4><%=product.getCom() %></h4>
            </div>

            <div id="price">
                <h2><%=product.getPrice() %>원</h2>
                <button type="button">후기 작성</button>
            </div>

            <div id="icon">
                <a href="<%=context_root%>/productbuy?pno=<%=product.getProductNo() %>" id="purchase">BUY</a>
                <a href="#" id="cart">CART</a>
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
	                        <img src="${productMemberReview.reviewImageUrl}" class="img_same img_same_${k}">
	                    </div>
	
	                    <div id="review_box">
		                    <!-- 처음에 page load시 1page의 후기들이 보이도록 설정 -->
	                        <h5 class="review_title_same review_title_${k}">${productMemberReview.reviewTitle}</h5><br>
	                        <p class="review_write_content_same review_write_content_${k}">${productMemberReview.reviewContent}</p><br>
	                    
	                        <div class="review_write_info">
	                        	<div class="review_writer_date">
		                            <span class="review_writer_same review_writer_${k}">${productMemberReview.reviewWriter}</span>
		                            <span class="review_date_same review_date_${k}">${productMemberReview.reviewDate}</span>
	                            </div>
	                            <div class="btns">
	                            	<!-- 로그인한 회원의 id와 후기 작성자의 id가 일치할때만 수정 삭제 버튼이 보인다. -->
		                            <c:if test="${memberLoginInfo == productMemberReview.reviewWriter}">
			                            <a class="review_update_same review_update_${k}">수정</a>
			                            <a onclick="deleteAlert();" class="review_delete_same review_delete_${k}">삭제</a>
		                            </c:if>
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
						<a class="pageLink_same pageLink_${i}">${i}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	
	<%@ include file="../template_footer.jsp" %>
	
		<!-- 후기 수정 창(모달창 형식) -->
		<!-- 나중에  review_update_${k} 맞게 모달 팝업 이벤트 수정 필요 -->
       <div id="update_box">
               <table id="update_table">
                   <tr>
                       <td class="title_td">제목</td>
                       <td class="content_td"><input id="update_title" name="update_title" type="text"></td>
                   </tr>

                   <tr>
                       <td class="title_td">상세리뷰</td>
                       <td class="content_td" id="textarea_td"><textarea id="update_content" name="update_content" cols="80" rows="15"></textarea></td>
                   </tr>

                   <tr>
                       <td class="title_td">사진첨부</td>
                       <td class="content_td">
                           <label id="update_photo_label" for="update_photo">업로드</label>
                           <!-- <td class="content_td"><input type="file" name="photo_file" id="photo_file"></td> -->
                           <input type="file" id="update_photo" hidden>
                       </td>
                   </tr>

                   <tr>
                       <!-- 유효성 검사하기 -->
                       <td colspan="2" id="btn_td"><button type="button" id="update_btn">후기 수정</button></td>
                   </tr> 
               </table>
         </div>
	<script>
			
			// 후기 글을 가져오는 ajax
 			for (var i = "${startPageLink}"; i <= "${endPageLink}"; i++) {
 				console.log("pagelink 시작");
				$('.pageLink_' + i).on('click', function() {
					console.log("ajax시작");
					$.ajax({
		                type : "POST",
		                url : "productdetail",
		                data : {
		                	cateGory : "<%=product.getProductCategory()%>",
		                    reviewpage : $(this).text()
		                },
		                dataType : "json",
		                success : function (data) {
		                	console.log("success 시작");
		                	if (data != null) {
		                		console.log("if 시작");
									// 기존의 내용을 지워야 하니 empty() function을 사용
		                			$('.review_title_same').empty();
		                			$('.review_write_content_same').empty();
		                			$('.review_writer_same').empty();
		                			$('.review_date_same').empty();
		                			// 이미지 속성 제거
		                			$('.img_same').removeAttr("src");
		                		for (let i = 0; i < data.reviewInfo.length; i++) {
		                			console.log("for 시작 : " + data.reviewInfo.length);
		                			
		                			$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);
		                			$('.review_title_' + (i + 1)).text(data.reviewInfo[i].reviewTitle);
		                			$('.review_write_content_' + (i + 1)).text(data.reviewInfo[i].reviewContent);
		                			$('.review_writer_' + (i + 1)).text(data.reviewInfo[i].reviewWriter);
		                			$('.review_date_' + (i + 1)).text(data.reviewInfo[i].reviewDate);
		                		}
							}
						},
						error : function(request,status,error) {
		                	console.log("false")
		                    alert('후기가 없습니다.');
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
					})
				})
			}
			
			// 삭제 팝업 띄우는 fnuction
 			function deleteAlert() { alert('정말 삭제하시겠습니까?'); }
			
			// 후기 글을 삭제하는 ajax
			console.log("ajax 삭제 for 시작");
			$('.review_delete_same').on('click',function() {
				console.log("ajax 삭제 시작");
				$.ajax({
	                type : "POST",
	                url : "writememberdelete",
	                data : {
	                	title : $(this).parents('#review_box').find(".review_title_same").text(),
	                	writer : $(this).parents('#review_box').find(".review_writer_same").text()
	                },
	                dataType : "json",
	                success : function (data) {
	                	console.log("success 진입");
	                	console.log(data);
	                	console.log(data.result);
						if (data.result == 1) {
							alert('삭제가 왼료되었습니다.');
							window.location.reload();
							// 새로 고침 이벤트
						} else {
							alert('삭제가 실패');
						}
					},
					error : function(request,status,error) {
	                	console.log("false 진입")
	                    alert('삭제 실패');
	                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                }
				})
			})
			// ======================================================================
			// update 팝업 이벤트 및 수정
			let updateTitle = document.getElementById('update_title');
			let updateContent = document.getElementById('update_content');
			let updateBox = document.getElementById('update_box');
			
			document.querySelector('.review_update_same').addEventListener('click', function () {
				updateTitle.value = $(this).parents('#review_box').find(".review_title_same").text();
				updateContent.value = $(this).parents('#review_box').find(".review_write_content_same").text();
				updateBox.style.display = "block";
				
				// ajax용 기존 후기글 제목
				var originTitle = $(this).parents('#review_box').find(".review_title_same").text();
				
				$('#update_btn').on('click', function () {
					console.log("update 시작");
					$.ajax({
						type : "post",
						url : "writememberupdate",
						data : {
							title : originTitle,
							update_title : updateTitle.value,
							update_content : updateContent.value,
							id : "${memberLoginInfo}"
						},
						dataType : "json",
						success : function (data) {
							console.log("success 시작");
							if (data.result == 1) {
								alert('수정을 완료했습니다.');
								window.location.reload();
								// document.getElementById('update_box').style.display = "none";
							} else {
								alert('수정이 되지 않았습니다.');
							}
						},
						error : function(request,status,error) {
		                	console.log("false 진입")
		                    alert('수정 실패');
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                }
					})
				})
			})

			
   			// ======================================================================
	        // update 창 닫는 이벤트
	        var modal = document.getElementById('update_box');
	        window.onclick = function(event) {
                if (event.target == modal) {
                	var bool = confirm('후기 작성을 취소하시곘습니까?');
                	if (bool == true) {
                		modal.style.display = "none";	
					}
	            }
	        }
    </script>
</body>
</html>