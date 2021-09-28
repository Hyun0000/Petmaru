<%@page import="com.petmaru.product.member.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String context_root = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productlist.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<title>Clothes</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
	<section>
		<div id="image">
			<c:if test="${producClothestList != null}">
				<c:forEach var="product" items="${producClothestList}">
					<a href="<%=context_root%>/ProductDetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}" alt="">
						<br><span class="name">${product.getProductName()}</span>
						<br><span class="price">${product.getPrice()}원</span>
					</a>
				</c:forEach>
			</c:if>
		</div>
	</section>
</body>
</html>