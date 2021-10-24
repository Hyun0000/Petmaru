<%@page import="com.petmaru.notice.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항</title>
<%@ include file="../admin_header.jsp" %>
</head>
<body>
   <main class="main">
      <h2 class="main title">공지사항</h2>

      <div class="search-form margin-top first align-right">
         <h3 class="hidden">공지사항 검색폼</h3>
         <form class="table-form">
            <fieldset>
               <legend class="hidden">공지사항 검색 필드</legend>
               <label class="hidden">검색분류</label> <select name="f">
                  <option value="title">제목</option>
                  
               </select> <label class="hidden">검색어</label> <input type="text" name="q" value="" /> <input class="btn btn-search" type="submit" value="검색" />
            </fieldset>
         </form>
      </div>


		<form action = "adminNoticelist" method ="post">
			<div class="notice margin-top">
				<h3 class="hidden">공지사항 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th class="w60">번호</th>
							<th class="expand">제목</th>
							<th class="w100">작성자</th>
							<th class="w100">작성일</th>
							<th class="w60">조회수</th>
							<th class="w40">공개</th>
							<th class="w40">삭제</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="n" items="${list}">
							<c:set var="open" value="" />
							<c:if test="${n.pub}">
								<c:set var="open" value="checked" />
							</c:if>
							<tr>
								<td>${n.id}</td>
								<td><a href="Admindetail?id=${n.id} ">${n.title}</a></td>
								<td>${n.writerId}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd" value="${n.regdate}" /></td>
								<td><fmt:formatNumber value="${n.hit}" /></td>

								<td><input type="checkbox" name="open-id" ${open} value="${n.id}"></td>
								<td><input type="checkbox" name="del-id" value="${n.id}"></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>

			<c:set var="page" value="${(param.p==null)?1:param.p}" />
			<c:set var="startNum" value="${page-(page-1)%5}" />
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}" />

			<div class="indexer margin-top align-right">
				<h3 class="hidden">현재페이지</h3>
				<div>
					<span class="text-orange text-strong">${(empty param.p)?1:param.p }</span>/${lastNum }page
				</div>
			</div>

		
		<div class="text-align-right margin-top">
		
		<c:set var = "ids" value="" />
		<c:forEach var = "n" items = "${list}">
			<c:set var = "ids" value="${ids} ${n.id}" />	
		</c:forEach>
		<input type = "hidden" name = "ids" value = "${ids}">
         <input type="submit" class="btn-text btn-default" name = "cmd" value="일괄공개">
         <input type="submit" class="btn-text btn-default" name = "cmd" value="일괄삭제">
         <a class="btn-text btn-default" href="AdminNoticeRegServlet">글쓰기</a>
      </div>
		</form>
      <div class = "margin-top align-center pager">
      
      <c:if test="${startNum > 1}">
         <a class="btn btn-prev" href="?p=${startNum-1}&t=&q=">이전</a>
      </c:if>
      <c:if test="${startNum <= 1}">
         <span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
      </c:if>
      
      </div>
      <div>
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
   </div>
   </main>
</body>
    <%@ include file="../template_footer.jsp" %>  
</html>