<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String board_no = request.getParameter("board_no"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Petmaru/WebContent/css/boardwrite.css">
</head>
<body>
	<form method="post" action="boardwrite">
		<input type="hidden" name="board_no" value="<%=board_no %>" readonly>
		
		<table id="table">
			<tr id="title">
				<td>제목</td>
				<td><input type="text" name="board_title" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="board_content" id="content"></textarea>
				</td>
			</tr>
		</table>
		<input id="btn" type="submit" value="등록">
	</form>
</body>
</html>