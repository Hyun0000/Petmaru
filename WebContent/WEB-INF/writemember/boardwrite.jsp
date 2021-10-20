<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String board_no = request.getParameter("board_no"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판</h1>
	<form method="get" action="boardwrite">
		<input type="hidden" name="board_no" value="<%=board_no %>" readonly>
		<div id="board_title">
		제목: <input type="text" name="title" required>
		</div>
		<div id="board_content">
		<input type="text" name="content" required>
		</div>
		<input type="submit" value="등록">
	</form>
</body>
</html>