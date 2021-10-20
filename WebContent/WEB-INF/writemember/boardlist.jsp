<link rel="stylesheet" href="css/template_header.css">
<link rel="stylesheet" href="css/template_footer.css">
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.petmaru.member.write.model.vo.WriteMemberBoardVo"%>
<%@ page import="java.util.ArrayList"%>
<%
	// 이곳은 자바 문법에 따름
ArrayList<WriteMemberBoardVo> volist = (ArrayList<WriteMemberBoardVo>) request.getAttribute("boardvolist");
int startPage = (int) request.getAttribute("startPage");
int endPage = (int) request.getAttribute("endPage");
int pageCount = (int) request.getAttribute("pageCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmaru BoardList</title>
</head>
<body>
	<%@ include file="../template_header.jsp"%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
		<tr>
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
		<tr>
			<%
				}
			}
			%>
		
	</table>
	<%@ include file="../template_footer.jsp"%>
</body>
</html>