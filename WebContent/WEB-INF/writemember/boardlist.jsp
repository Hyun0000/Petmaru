<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.petmaru.member.write.model.vo.WriteMemberBoardVo"%>
<%@ page import="java.util.ArrayList"%>
<%
// 이곳은 자바 문법에 따름
ArrayList<WriteMemberBoardVo> volist = (ArrayList<WriteMemberBoardVo>) request.getAttribute("boardvolist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/template_header.css">
<link rel="stylesheet" href="css/template_footer.css">
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>Petmaru BoardList</title>
<style>
	.center {
		margin: 0 auto;
	}
</style>
</head>
<body>
	<%@ include file="../template_header.jsp"%>
	<table border="1" class="center">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
		</tr>
			<%
				if (volist != null) {
				for (WriteMemberBoardVo vo : volist) {
					// tr 이 volist 갯수 만큼 생기게 됨.
					// <%= 은 화면에 출력을 위한 표현식을 작성하는 태그, ;없어야 함.
			%>
		
		<tr>
			<td><a href="boardcontent?no=<%=vo.getBoard_no()%>"> <%=vo.getBoard_no()%> </a></td>
			<td>
				<%=vo.getBoard_title()%>			
			</td>
			<td><%=vo.getBoard_writer()%></td>
			<td><%=vo.getBoard_date()%></td>
		</tr>
			<%
				}
			}
			%>
	</table>
		<c:if test="${startNum > 1}">
			<a href="boardlist?pageNum=${startNum-1}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage == i}">
				<strong><a href = "boardlist?pageNum=${i}">${i}</a></strong>
			</c:if>
			<c:if test="${currentPage != i}">
				<a href = "boardlist?pageNum=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="boardlist?pageNum=${endPage+1}" class="btn btn-next">다음</a>
		</c:if>

	
	<a href="<%=request.getContextPath() %>/boardwrite">글쓰기</a>
	
	<%@ include file="../template_footer.jsp"%>
</body>
</html>