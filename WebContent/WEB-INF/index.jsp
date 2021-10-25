<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_carousel.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_mainad.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css"/>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
	ArrayList<ProductMemberVo> mainsubcarousel = (ArrayList<ProductMemberVo>)request.getAttribute("mainsubcarousel");
%>
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
<%@ include file="./template_header.jsp" %>
<%@ include file="./template_carousel.jsp" %>
	<section id="carousel_container">
		<c:forEach var="product" items="${mainsubcarousel}">
			<c:choose>
				<c:when test="${product.productCategory.equals('C') }">
						<c:set var="k" value="${1+k}"></c:set>
						<div id="first_box_${k}" class="first_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img class="first" src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.productCategory.equals('A') }">
						<c:set var="i" value="${1+i}"></c:set>
						<div id="second_box_${i}" class="second_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
			</c:choose>
		</c:forEach>

  		<!-- <div id="center_banner"> -->
			<%@ include file="./template_mainad.jsp" %>
		<!-- </div> -->
				
		<c:forEach var="product" items="${mainsubcarousel}">
			<c:choose>
				<c:when test="${product.productCategory.equals('F') }">
						<c:set var="j" value="${1+j}"></c:set>
						<div id="third_box_${j}" class="third_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.productCategory.equals('B') }">
						<c:set var="u" value="${1+u}"></c:set>
						<div id="four_box_${u}" class="four_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.productCategory.equals('T') }">
						<c:set var="o" value="${1+o}"></c:set>
						<div id="five_box_${o}" class="five_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.productCategory.equals('H') }">
						<c:set var="t" value="${1+t}"></c:set>
						<div id="six_box_${t}" class="six_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.productNo}&c=${product.productCategory}">
						<img src="${product.productImgUrl}">
						</a>
						</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</section>
<%@ include file="./template_footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="<%=context_root %>/js/index.js"></script>
</body>
</html>