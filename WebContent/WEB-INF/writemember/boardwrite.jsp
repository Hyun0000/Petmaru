<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Petmaru/WebContent/css/boardwrite.css">
</head>
<body>
	<form method="post" action="boardwrite">
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
	<a href="<%=request.getContextPath() %>/boardlist">목록보기</a>

</body>
</html>