<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="css/template_header.css">
    <link rel="stylesheet" href="css/template_footer.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<title>Petmaru BoardList</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
	<!-- 게시판 메인 페이지 영역 시작 -->
	<section>
		<table id="boardlist_table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<!-- 테스트 코드 -->
					<td>1</td>
					<td>제목입니다</td>
					<td>김이름</td>
					<td>2021-10-13</td>
				</tr>
			</tbody>
		</table>
		<!-- 글쓰기 버튼 생성 -->
		<a id="board_write_button" href="boardwrite.jsp">글쓰기</a>
	</section>
	<!-- 게시판 메인 페이지 영역 끝 -->
<%@ include file="../template_footer.jsp" %>
</body>
</html>