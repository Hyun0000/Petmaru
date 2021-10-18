<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%	String context_root = request.getContextPath(); %>
       
    <!--    
    
    ArrayList<Member> members = (ArrayList<Member>)request.getAttribute("memberList");
    
    -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<section>
<%@ include file="../template_header.jsp" %>
		<div style="margin:0 auto;width:500px; text-align:center;">
			<form action="/searchKeyword" method="post">
				<select name="type" class="form-control" style="display: inline-block; width:100px;
				height:30px; font-size:0.8em;">
				
					<c:if test="${empty type }">			<!-- null check! -> empty -->
						<option value ="member_id">아이디</option>
						<option value ="member_name">이름</option>
					</c:if>
					
					<c:if test="${not empty type && type=='member_name'}">			<!-- null check! -> empty -->
						<option value ="member_id">아이디</option>
						<option value ="member_name" selected="selected">이름</option>
					</c:if>
					
					<c:if test="${not empty type && type=='member_id'}">			<!-- null check! -> empty -->
						<option value ="member_id" selected="selected">아이디</option>
						<option value ="member_name">이름</option>
					</c:if>
				</select>
				
				<input type="text" class="form-control" style="display:inline-block; width:200px;
				height:30px; font-size:0.8em;" name="keyword" value="${keyword }">
				<button type="submit" class="btn btn-outline-secondary btn-sm">조회</button>
			</form>
		
		</div>
		</section>
	<table class="table table-hover" style="text-alingn:center; margin: 0 auto; color: black;">
	
		<tr>
			<th>아이디</th><th>이름</th><th>성별</th>
			<th>전화번호</th><th>적립금</th><th>탈퇴</th>
		</tr>

		<c:forEach items="${members }" var="m" varStatus="i">
		
			<tr>	
				<td>${m.member_id }</td>
				<td>${m.member_name }</td>
				<td>${m.member_gender }</td>
				<td>${m.member_phone }</td>
				<td>${m.member_point }</td>
				
				<td id = "submit"><button class="btn btn-outline-info btn-sm" onclick="location.href='/deleteMember?member_id=${m.member_id}'">탈퇴</button></td>

			</tr>
		</c:forEach>
		
				<c:if test="${startNum > 1}">
			<a class="btn btn-prev" href="?p=${startNum-1}&t=&q=">이전</a>
		</c:if>
		<c:if test="${startNum <= 1}">
			<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
		</c:if>
		
			<ul class="-list- center">
				<c:forEach var="i" begin="0" end="4">
				<c:if test="${(startNum+i) <= lastNum}">
					<li><a class = "-text- ${(page==(startNum+i))?'orange':''} bold" href = "?p=${startNum+i}&f=&q=">${startNum+i}</a>
				</c:if>
				</c:forEach>
			</ul>
		<div>
			<c:if test="${startNum+4<lastNum}">
				<a href="?p=${startNum+5}&t=&q=" class="btn btn-next">다음</a>
			</c:if>
			<c:if test="${startNum+4>=lastNum}">
				<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
			</c:if>
		</div>
	</table>
	<%@ include file="../template_footer.jsp" %>
</body>
</html>