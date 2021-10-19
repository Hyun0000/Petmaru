<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_carousel.css"/>
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
				<c:when test="${product.getProductCategory().equals('C') }">
						<c:set var="k" value="${1+k}"></c:set>
						<div id="first_box_${k}" class="first_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img class="first" src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.getProductCategory().equals('A') }">
						<c:set var="i" value="${1+i}"></c:set>
						<div id="second_box_${i}" class="second_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<div id="center_banner">중간광고 TODO</div>
		
		<c:forEach var="product" items="${mainsubcarousel}">
			<c:choose>
				<c:when test="${product.getProductCategory().equals('F') }">
						<c:set var="j" value="${1+j}"></c:set>
						<div id="third_box_${j}" class="third_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.getProductCategory().equals('B') }">
						<c:set var="u" value="${1+u}"></c:set>
						<div id="four_box_${u}" class="four_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.getProductCategory().equals('T') }">
						<c:set var="o" value="${1+o}"></c:set>
						<div id="five_box_${o}" class="five_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
				
				<c:when test="${product.getProductCategory().equals('H') }">
						<c:set var="t" value="${1+t}"></c:set>
						<div id="six_box_${t}" class="six_box_all">
						<a href="<%=context_root%>/productdetail?pno=${product.getProductNo()}&c=${product.getProductCategory()}">
						<img src="${product.getProductImgUrl()}">
						</a>
						</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</section>
<%@ include file="./template_footer.jsp" %>
<script type="text/javascript">

	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_1");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#first_box_' + i);
		$(".slide_1").prepend(idEle);
	}
	//================================================================
	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_2");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#second_box_' + i);
		$('.slide_2').prepend(idEle);
	}
	//================================================================
	var centerDiv = document.getElementById('center_banner');
	document.querySelector('#carousel_container').appendChild(centerDiv);
	//================================================================
	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_3");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#third_box_' + i);
		$('.slide_3').prepend(idEle);
	}
	//================================================================
	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_4");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#four_box_' + i);
		$('.slide_4').prepend(idEle);
	}
	//================================================================
	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_5");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#five_box_' + i);
		$('.slide_5').prepend(idEle);
	}
	//================================================================
	var divEle = document.createElement('div');
	divEle.setAttribute('class', "slide slide_6");
	document.querySelector('#carousel_container').appendChild(divEle);
	for (var i = 1; i <= 12; i++) {
		var idEle = $('#six_box_' + i);
		$('.slide_6').prepend(idEle);
	}
	//================================================================
	// 버튼 만들기
	for (var i = 1; i <= 6; i++) {
		var divEle = document.createElement('div');
		divEle.setAttribute('class', "slideBtn slideBtn_" + i);
		document.body.appendChild(divEle);
		
		// btn1
		var btn1 = document.createElement('button');
		btn1.setAttribute('class', "btn1");
		document.querySelector(".slideBtn_" + i).appendChild(btn1);
		
		// btn2
		var btn2 = document.createElement('button');
		btn2.setAttribute('class', "btn2");
		document.querySelector(".slideBtn_" + i).appendChild(btn2);
		
		// btn3
		var btn3 = document.createElement('button');
		btn3.setAttribute('class', "btn3");
		document.querySelector(".slideBtn_" + i).appendChild(btn3);
	}
	//================================================================
	// 버튼 이동
	for (var i = 1; i <= 6; i++) {
		var $btn = $('.slideBtn_' + i);
		$('.slide_' + i).after($btn);	
	}
	//================================================================
	// 버튼 이벤트	
    for (let i = 1; i <= 6; i++) {
        document.querySelector('.slideBtn_' + i + " .btn2").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(-100vw)';
        })
        
        document.querySelector('.slideBtn_' + i + " .btn3").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(-200vw)';
        });
        
        document.querySelector('.slideBtn_' + i + " .btn1").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(0vw)';
        });
    }
	
</script>
</body>
</html>