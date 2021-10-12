<%@page import="jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator"%>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String context_root = request.getContextPath();
int totalPageLink = (int)request.getAttribute("totalPageLink");
int startPageLink = (int)request.getAttribute("startPageLink");
int endPageLink = (int)request.getAttribute("endPageLink");
int selectPage = (int)request.getAttribute("selectPage");
ArrayList<ProductMemberVo> producClothestList = (ArrayList<ProductMemberVo>)request.getAttribute("producClothestList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productlist.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<title>productlist</title>
</head>
<body>

<%@ include file="../template_header.jsp" %>
	<section id="productlist">
		<div id="image">
			<c:if test="${producClothestList != null}">
					<c:forEach var="product" items="${producClothestList}">
						<c:set var="category" value="${product.getProductCategory()}"></c:set>
						<!-- c:set : 페이지 링크에 카테고리 값을 넣어주기 위한 변수 설정 -->
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
							<img src="${product.getProductImgUrl()}" alt="">
							<br><span class="name">${product.getProductName()}</span>
							<br><span class="price">${product.getPrice()}원</span>
						</a>
					</c:forEach>
			</c:if>
		</div>
		
		
		<div id="page">
			<c:choose>
				<c:when test="${selectPage > endPageLink }">마지막 보다 더 큰수</c:when>
				<c:when test="${selectPage < startPageLink }">처음보다 더 작은수</c:when>
				<c:when test="${selectPage != 0 }">
					<c:forEach begin="${startPageLink}" end="${endPageLink}" step="1" var="i">
						<a id="pageLink" href="<%=context_root%>/produclist?category=${category}&page=${i}">${i}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
<%@ include file="../template_footer.jsp" %>
<%String a = "aaaa"; %>
<%= a %>
<%= a %>
<%= a %>
	<script type="text/javascript">
		$.ajax({
			key1: "값";
			url : "/main";
			data : {
				a1 : "${startPage}",
				// 이렇게 사용가능하다.(java에서 선언한 변수를 js에서 사용할 수 있다. 단, 따옴표 사용권장, 안 붙여도 되긴한다.)
				// 안 붙이면 오류를 발생시킬 가능성이 높다. --> 텅 빈것은 안 된다 "" 만 있는것은 괜찮다. 
				// 텅 빈것은 문법오류를 발생시킨다.
				a2 : "값2"
			},
			success : function (data) {
				// 여기에 실려오는 data도 js 영역내에서만 쓸수 있다.
				// 그 이상을 벗어나서는 사용할 수 없다.
			}
		});
		
		alert("${startPage}"); // 이렇게도 사용한다.
		
		// jsp도 js 안에서 사용가능 (따옴표를 반드시 붙여야한다.)
		// a에 저장된값이 String이여도 무조건 따옴표를 붙인다.
		alert("<%= a %>");
		
		// js의 변수는 '<%= %>'에 표현식으로 나타낼 수 없다.(택도 없다. el도 마찬가지)
		// java 차원에서 선언된 변수는 js에서 사용가능. 그러나 그 반대는 불가능
	</script>
</body>
</html>