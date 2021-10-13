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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productlist.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<script src="<%=context_root %>/js/template_header.js"></script>
<title>Petmaru</title>
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
							<img src="${product.getProductImgUrl()}">
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
</body>
</html>