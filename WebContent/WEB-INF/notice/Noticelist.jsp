<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/Notice.css" />
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

</head>
<body>
<%@ include file="../template_header.jsp" %>
	<div id="top_nitice">
		<div id="search">
			<div id="title">
				<h3 id="topmain">공지사항</h3>
			</div>
			<form>
				 
			<div id = "searchValue">
				<label>검색분류</label>
				<select name="f">
						<option ${(param.f == "title")? "selected" : ""} value="title">제목</option>
						<option ${(param.f == "writer_id")? "selected" : ""}value="writer_id">작성자</option>
				</select> 
				<label>검색어</label>
				 <input type="text" name="q" value="${param.q}" />
				<input type="submit" value="검색">
			</div>
			</form>
		</div>

		<table id = "list">
			<thead>
				<tr id = "toplist">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="n" items="${list}">
					<tr id = "Value">
						<td class = "line">${n.id}</td>
						<td class = "line"><a href="detail?id=${n.id} ">${n.title}</a></td>
						<td class = "line">${n.writerId}</td>
						<td class = "line"><fmt:formatDate pattern="yyyy/MM/dd" value="${n.regdate}" />
						</td>
						<td class = "line"><fmt:formatNumber value="${n.hit}" /></td>
					</tr>
				</c:forEach>

				<%-- <%}%> --%>
				
			</tbody>
		</table>
		
		<c:set var="page" value="${(param.p==null)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}" />
		
		<div class = "indexer margin-top align-right">
		
		 <div class="indexer margin-top align-right">
		 <%-- <h3 class = "pagenow">현재페이지</h3>
		 <div id = "countpage"><span class = "text-orange text-strong">${(empty param.p)?1:param.p }</span>/${lastNum }page</div> --%>
		</div>

		<div>
<%-- 		<c:if test="${startNum > 1}">
			<a class="btn btn-prev" href="?p=${startNum-1}&t=&q=">이전</a>
		</c:if>
		<c:if test="${startNum <= 1}">
			<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
		</c:if> --%>
		</div>
		
		</div>
		
			<table class="listpaging">
				<c:forEach var="i" begin="0" end="4">
				<c:if test="${(startNum+i) <= lastNum}">
					<td><a class = "-text- ${(page==(startNum+i))?'orange':''} bold" href = "?p=${startNum+i}&f=&q=">${startNum+i}</a>
				</c:if>
				</c:forEach>
			</table>
		<div>
<%-- 			<c:if test="${startNum+4<lastNum}">
				<a href="?p=${startNum+5}&t=&q=" class="btn btn-next">다음</a>
			</c:if>
			<c:if test="${startNum+4>=lastNum}">
				<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
			</c:if> --%>
		</div>

	</div>
	<%@ include file="../template_footer.jsp" %>
</body>
</html>