<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath();%>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>공지사항등록</title>
<%@ include file="../template_header.jsp" %>
</head>
<style>
#topmain{
		width : 1000px;
		text-align :center;
		font-size: 40px;
}
#regview {
		position : relative;
		border : 1px;
		left : 10px;
		margin : auto;
		background-color : grey;
		text-align : center;

}
#regoncancel{
		position : relative;
		left : 1270px;
		bottom : 25px;
}
</style>
<body>

	<main>
		<h3 id="topmain">공지사항 등록</h3>

		<form method="post" action="AdminNoticeRegServlet" enctype="multipart/form-data">
			<div class="margin-top first">
				<table id = "regview">
					<tbody>
				
						<tr>
							<th>제목</th>
							<td class="text-align-left text-indent text-strong text-orange"
								colspan="3"><input type="text" placeholder="제목을 입력하세요." name="title" style="width:900px;height:30px;font-size:15px;"/></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3" class="text-align-left text-indent"><input type="file" name="file" /></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3" class="text-align-left text-indent"><input type="file" name="file" /></td>
						</tr>
						<tr class="content">
							<td colspan="4"><textarea class="content" name="content" style = "width:900px; height : 300px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="4" class="text-align-right">
							<input class="vertical-align" type="checkbox" id="open" name="open"	value="true">
							<label for="open" class="margin-left">바로공개</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id = "regoncancel">
				<input class="btn-text btn-default" type="submit" value="등록" /> 
				<a	class="btn-text btn-cancel" href="adminNoticelist">취소</a>
			</div>
		</form>

	</main>

</body>
	<%@ include file="../template_footer.jsp" %>
</html>