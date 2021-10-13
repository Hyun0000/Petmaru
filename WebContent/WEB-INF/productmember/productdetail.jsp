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
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
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
	                <li>
	                    <div class="review_img">
	                        <img src="https://via.placeholder.com/200">
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
		                            <a>수정</a>
		                            <a onclick="deleteAlert();" class="apple review_delete_${k}">삭제</a>
	                            </div>
	                        </div>
	                    </div>
	                </li>
	                </c:forEach>
	            </ul>
			</div>
		
		<div id="page">
			<c:choose>
				<c:when test="${selectPage > endPageLink }">마지막 보다 더 큰수</c:when>
				<c:when test="${selectPage < startPageLink }">처음보다 더 작은수</c:when>
				<c:when test="${selectPage != 0 }">
					<c:forEach begin="${startPageLink}" end="${endPageLink}" step="1" var="i">
						<a class="pageLink_${i}">${i}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	<%@ include file="../template_footer.jsp" %>
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
		                		for (let i = 0; i < data.reviewInfo.length; i++) {
		                			console.log(data.reviewInfo.length);
		                			console.log("for 시작");
									// 기존의 내용을 지워야 하니 empty() function을 사용
 		                			$('.review_title_' + (i + 1)).empty();
		                			$('.review_write_content_' + (i + 1)).empty();
		                			$('.review_writer_' + (i + 1)).empty();
		                			$('.review_date_' + (i + 1)).empty();
		                			
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
			$('.apple').on('click',function() {
				console.log("ajax 삭제 시작");
				console.log($(this).parents('#grape'));
				console.log($(this).parent().parent());
				console.log($(this).parent().parent().parent());
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
							// 새로 고침 이벤트
							/* window.location.reload(); */
							window.location.reload();
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
    </script>
</body>
</html>