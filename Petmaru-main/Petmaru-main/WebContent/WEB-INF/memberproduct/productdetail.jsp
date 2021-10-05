<%@page import="com.petmaru.product.member.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath(); %>
<% Product product = (Product)request.getAttribute("product"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script type="text/javascript" src="<%=context_root %>/js/productdetail.js" ></script>
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
                <h><%=product.getPrice() %>원</h2>
            </div>

            <div id="review_icon">
                <button type="button" id="reviewBtn">후기보기</button>
            </div>

            <div id="icon">
                <button type="button" id="purchase">BUY</button>
                <button type="button" id="cart">CART</button>
            </div>
        </div>
    </section>

    <section id="review_sec">
        <div id="review_content">
            <ul>
                <li>
                    <div id="review_img">
                        <img src="https://via.placeholder.com/200">
                    </div>

                    <div id="review_write">
                        <p id="review_write_content">
                            <h5>후기 글 제목</h5><br><br>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                        </p>
                    
                        <p id="review_write_info">
                            <span>작성자아이디<span>
                            <span>후기 및 별점</span><br>
                            <span>작성일<span>
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </section>
</body>
</html>