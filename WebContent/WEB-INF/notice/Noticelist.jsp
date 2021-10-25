<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@page import="com.petmaru.notice.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="../template_header.jsp" %>


</head>
<body>
	<div>
		<h3>공지사항</h3>
		<form>
			<fieldset>
				<legend>글 검색 필드</legend>
				<label>검색분류</label> <select name="f">
					<option ${(param.f == "title")? "selected" : ""} value="title">제목</option>
					<option ${(param.f == "writer_id")? "selected" : ""}value="writer_id">작성자</option>
				</select> <label>검색어</label> <input type="text" name="q" value="${param.q}" />
				<input type="submit" value="검색">
			</fieldset>
		</form>
	</div>

	<div>
		<h3>글 목록</h3>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="n" items="${list}">
					<tr>
						<td>${n.id}</td>
						<td><a href="detail?id=${n.id} ">${n.title}</a></td>
						<td>${n.writerId}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${n.regdate}" />
						</td>
						<td><fmt:formatNumber value="${n.hit}" /></td>
					</tr>
				</c:forEach>

				<%-- <%}%> --%>
			</tbody>
		</table>
		</div>
		<c:set var="page" value="${(param.p==null)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}" />
		<div class = "indexer margin-top align-right">
		
		 <div class="indexer margin-top align-right">
		 <h3 class = "hidden">현재페이지</h3>
		 <div><span class = "text-orange text-strong">${(empty param.p)?1:param.p }</span>/${lastNum }page</div>
		</div>
		<div class = "margin-top align-center pager">
		
	</div>


		<c:if test="${startNum > 1}">
			<a class="btn btn-prev" href="?p=${startNum-1}&t=&q=">이전</a>
		</c:if>
		<c:if test="${startNum <= 1}">
			<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
		</c:if>
		
		</div>
		
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


</body>
	<%@ include file="../template_footer.jsp" %>
</html>