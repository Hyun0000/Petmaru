<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/boardwrite.css"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.petmaru.member.write.model.vo.WriteMemberBoardVo"%>
<% 
	WriteMemberBoardVo vo = (WriteMemberBoardVo)request.getAttribute("boardvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmaru</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="../template_header.jsp"%>

<h2>자유게시판 글수정</h2>
<form method="post" action="boardwrite">
	<table id="table">
		<tr>
			<td><input type="text" name="board_title" id="title" <%=vo.getBoard_title()%> required></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="board_content" id="content" <%=vo.getBoard_content()%> style="resize: none;"></textarea>
			</td>
		</tr>
	</table>

	<table id="btn_area">
		<tr>
			<td id="btn_list"><a href="<%=request.getContextPath() %>/boardlist">목록보기</a></td>
			<td id="btn_submit"><input id="btn" type="submit" value="등록"></td>
		</tr>
	</table>
</form>

<%@ include file="../template_footer.jsp"%>
</body>
</html>