<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/productsearch.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
	ArrayList<ProductMemberVo> productMemberSearch = (ArrayList<ProductMemberVo>)request.getAttribute("productMemberSearch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=context_root %>/js/template_header.js"></script>
<title>Petmaru</title>
</head>
<body>

<%@ include file="../template_header.jsp" %>
	<section>
		<c:choose>
			<c:when test="${productMemberSearch != null}">
			<div id="product_ok">
				<c:forEach var="product" items="${productMemberSearch}">
				<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
					<img src="${product.getProductImgUrl()}">
					<br><span class="name">${product.getProductName()}</span>
					<br><span class="price">${product.getPrice()}원</span>
				</a>
				</c:forEach>
			</div>
			</c:when>

		</c:choose>
	
		<c:if test="${productMemberSearch == null}">
			<div id="product_no">
			<p id="product_no_write">선생님<br>눈을 똑바로 떠보세요.</p>
			<img src="https://img4.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg">
			<p>상품이 없습니다.</p>
			</div>
		</c:if>
	</section>
	<%@ include file="../template_footer.jsp" %>
</body>
</html>