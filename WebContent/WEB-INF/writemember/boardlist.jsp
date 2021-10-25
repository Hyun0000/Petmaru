<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/boardlist.css"/>
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
<title>Petmaru BoardList</title>

</head>
<body>
<%@ include file="../template_header.jsp"%>

<h2>자유게시판</h2>

<table id="board_content">
	<tr>
		<th id="th1">번호</th>
		<th id="th2">제목</th>
		<th id="th3">작성자</th>
		<th id="th4">날짜</th>
	</tr>
		<%
			if (volist != null) {
			for (WriteMemberBoardVo vo : volist) {
				// tr 이 volist 갯수 만큼 생기게 됨.
				// <%= 은 화면에 출력을 위한 표현식을 작성하는 태그, ;없어야 함.
		%>
	
	<tr>
		<td><a href="boardcontent?no=<%=vo.getBoard_no()%>"> <%=vo.getBoard_no()%> </a></td>
		<td><%=vo.getBoard_title()%></td>
		<td><%=vo.getBoard_writer()%></td>
		<td><%=vo.getBoard_date()%></td>
	</tr>
		<%
			}
		}
		%>
</table>
<table id="board_num">
	<tr>
		<td id="td1">
			<c:if test="${startNum > 1}">
				<a href="boardlist?pageNum=${startNum-1}">이전</a>
			</c:if>
		</td>
		<td id="td2">
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage == i}">
					<strong><a href = "boardlist?pageNum=${i}">${i}</a></strong>
				</c:if>
				<c:if test="${currentPage != i}">
					<a href = "boardlist?pageNum=${i}">${i}</a>
				</c:if>
			</c:forEach>
		</td>
		<td id="td3">
			<c:if test="${endPage < pageCount}">
				<a href="boardlist?pageNum=${endPage+1}" class="btn btn-next">다음</a>
			</c:if>
		</td>
		<td id="td4">
			<a href="<%=request.getContextPath() %>/boardwrite" role="button">글쓰기</a>
		</td>
	</tr>
</table>

<%@ include file="../template_footer.jsp"%>
</body>
</html>