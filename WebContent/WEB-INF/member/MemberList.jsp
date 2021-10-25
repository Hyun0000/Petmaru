<%@page import="com.petmaru.member.model.dao.MemberDao"%>
<% String context_root = request.getContextPath();%>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/MemberList.css" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@page import = "com.petmaru.member.model.vo.MemberVo" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
MemberDao dao = new MemberDao();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>

</style>
<%@ include file="../admin_header.jsp" %>
</head>
<body>

      <h3 id="topmain">회원정보</h3>


			<div id = "search">
         <form>
         		<div id = "searchValue">
               <label>검색분류</label> <select name="f">
                  <option value="member_name">이름</option>
                  <option value="member_id">아이디</option>
               </select> <label class="hidden">검색어</label> <input type="text" name="q" value="" />
                <input class="btn btn-search" type="submit" value="검색" />
				</div>
         </form>
      </div>

		<form action = "MemberList" method ="post">
				<table id = "list">
					<thead>
						<tr id ="toplist">
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>가입일</th>
							<th>적립금</th>
							<th>탈퇴</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="n" items="${list}">
							<tr id = "Value">
								<td class = "line">${n.member_id}</td>
								<td class = "line">${n.member_name}</td>
								<td class = "line">${n.member_gender}</td>
								<td class = "line">${n.member_regdate}</td>
								<td class = "line">${n.member_point}</td>
								<td class = "line"><button type = "submit" class = "btn btn-outline-info btn-sm" onclick="location.href='/deleteMember?member_id=${n.member_id}'">탈퇴</button></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>

			<c:set var="page" value="${(param.p==null)?1:param.p}" />
			<c:set var="startNum" value="${page-(page-1)%5}" />
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}" />

			<div class="indexer margin-top align-right">
				<h3 class="pagenow">현재페이지</h3>
				<div id = "countpage"><span class="text-orange text-strong">${(empty param.p)?1:param.p }</span>/${lastNum }page
				</div>
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
         <table class="listpaging">
            <c:forEach var="i" begin="0" end="4">
            <c:if test="${(startNum+i) <= lastNum}">
               <td><a class = "-text- ${(page==(startNum+i))?'orange':''} bold" href = "?p=${startNum+i}&f=&q=">${startNum+i}</a>
            </c:if>
            </c:forEach>
         </table>
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