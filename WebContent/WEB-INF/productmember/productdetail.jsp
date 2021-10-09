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
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script type="text/javascript" src="<%=context_root %>/js/productdetail.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<title>Insert title here</title>
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

            <div id="review_icon">
				<%-- <a href="<%=context_root%>/productdetail?category=C">후기보기</a> --%>
                <button type="button" id="reviewBtn">후기보기</button>
            </div>
            
            <div id="icon">
                <a href="<%=context_root%>/productbuy?pno=<%=product.getProductNo() %>" id="purchase">BUY</a>
                <a href="#" id="cart">CART</a>
            </div>
        </div>
    </section>
    
	     <section id="review_sec">
        <div id="review_content">
            <ul id="review_list">
				<!-- js dom을 이용해 안의 내용을 채운다. -->
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
        <script>
	        for (var i = "${startPageLink}"; i <= "${endPageLink}"; i++) {
		        $('.pageLink_' + i).on('click', function() {
		        	console.log("ajax시작")
		            $.ajax({
		                type : "POST",
		                url : "productdetail",
		                data : {
		                	cateGory : "<%=product.getProductCategory()%>",
		                    reviewpage : $(this).text()
		                },
		                dataType : "JSON",
		                success : function(data) {
		                	if (data != null) {
		                			$('#review_list').children().remove();
			                    for (let i = 0; i < data.reviewInfo.length; i++) {
			                    	console.log("true 반복문 진입");
			                    	
			                        // 각 review가 담기는 li
			                        var liEle = document.createElement('li');
			                        liEle.setAttribute('class', "list_" + i);
			                        document.getElementById('review_list').appendChild(liEle);

			                        // 리뷰 내용, 작성자, 날짜가 들어가는 div
			                        var divEle = document.createElement('div');
			                        divEle.setAttribute('class', "content_list_" + i);
			                        document.querySelector(".list_" + i).appendChild(divEle);

			                        // 리뷰 내용을 담는 p
			                        var pEle = document.createElement('p');
			                        pEle.setAttribute('class', "content_box" + i);
			                        document.querySelector(".content_list_" + i).appendChild(pEle);

			                        // 리뷰 내용이 들어가는 h5
			                        var hEle = document.createElement('h5');
			                        hEle.innerText = data.reviewInfo[i].reviewContent;
			                        hEle.setAttribute('class', "content_" + i);
			                        document.querySelector(".content_box" + i).appendChild(hEle);

			                        // 작성자, 날짜가 들어가는 p(리뷰 내용을 담는 p와 형제 관계)
			                        var pEleInfo = document.createElement('p');
			                        pEleInfo.setAttribute('class', "review_write_info_" + i);
			                        document.querySelector(".content_list_" + i).appendChild(pEleInfo);

			                        // 작성자가 들어가는 span
			                        var writerSpanEle = document.createElement('span');
			                        writerSpanEle.innerText = data.reviewInfo[i].reviewWriter;
			                        writerSpanEle.setAttribute('class', "review_write_" + i);
			                        document.querySelector(".review_write_info_" + i).appendChild(writerSpanEle);

			                        // 작성일이 들어가는 span(작성자가 들어가는 span과 형제관계)
			                        var dateSpanEle = document.createElement('span');
			                        dateSpanEle.innerText = data.reviewInfo[i].reviewDate;
			                        dateSpanEle.setAttribute('class', "review_date_" + i);
			                        document.querySelector(".review_write_info_" + i).appendChild(writerSpanEle);

								}
		                    } else {
		                    }
		                },
		                error : function(request,status,error) {
		                	console.log("false")
		                    alert('후기가 없습니다.');
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
		            });
		        });
	        }

    </script>
</body>
</html>