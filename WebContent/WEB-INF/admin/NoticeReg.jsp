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

</head>

<body>

	<main>
		<h2 class="main title">공지사항 등록</h2>

		<form method="post" action="AdminNoticeRegServlet" enctype="multipart/form-data">
			<div class="margin-top first">
				<h3 class="hidden">공지사항 입력</h3>
				<table class="table">
					<tbody>
						<tr>
							<th>제목</th>
							<td class="text-align-left text-indent text-strong text-orange" colspan="3">
								<input type="text" name="title" />
							</td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td colspan="3" class="text-align-left text-indent">
								<input type="file" name="file" />
							</td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td colspan="3" class="text-align-left text-indent">
								<input type="file" name="file" />
							</td>
						</tr>
						
						<tr class="content">
							<td colspan="4">
								<textarea class="content" name="content"></textarea>
							</td>
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
			<div class="margin-top text-align-center">
				<input class="btn-text btn-default" type="submit" value="등록" /> <a
					class="btn-text btn-cancel" href="adminNoticelist">취소</a>
			</div>
		</form>

	</main>

</body>

</html>