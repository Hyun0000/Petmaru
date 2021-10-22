<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.petmaru.member.write.model.vo.WriteMemberBoardVo"%>
<% WriteMemberBoardVo vo = (WriteMemberBoardVo)request.getAttribute("boardvo"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/boardwrite.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="../template_header.jsp"%>

	<table border="1">
		<tr>
			<td><%=vo.getBoard_title()%></td>
		</tr>
		<tr>
			<td><%=vo.getBoard_writer()%></td>
		</tr>
		<tr>
			<td><%=vo.getBoard_date()%></td>
		</tr>
	</table>
	<table>
		<tr>
			<td><%=vo.getBoard_content()%></td>
		</tr>
	</table>
	
	<form>
		
	</form>
<%@ include file="../template_footer.jsp"%>
</body>
</html>