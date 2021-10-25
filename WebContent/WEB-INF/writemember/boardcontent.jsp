<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/boardcontent.css"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.petmaru.member.write.model.vo.WriteMemberBoardVo"%>
<% 
	WriteMemberBoardVo vo = (WriteMemberBoardVo)request.getAttribute("boardvo"); 
	String writer = vo.getBoard_writer();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="../template_header.jsp"%>
	
	
	<table id="container1">
		<tr>
			<td id="listlink"><a href="<%=request.getContextPath() %>/boardlist">자유게시판></a></td>
		</tr>
		<tr>
			<td id="title"><%=vo.getBoard_title()%></td>
		</tr>
		<tr>
			<td id="writer"><%=vo.getBoard_writer()%></td>
		</tr>
		<tr>
			<td id="date"><%=vo.getBoard_date()%></td>
		</tr>
	</table>
	
	<table id="container2">
		<tr>
			<td id="content"><%=vo.getBoard_content()%></td>
		</tr>
	</table>
	
	<table id="delete">
		<tr>
			<td colspan="2" id="reBtn">
			<a href="<%=request.getContextPath()%>/boardrewrite?no=<%=vo.getBoard_no()%>" role="button">글수정</a>
			<a href="<%=request.getContextPath()%>/boarddelete?no=<%=vo.getBoard_no()%>" role="button">글삭제</a>
			</td>
		</tr>
	</table>
	
<%@ include file="../template_footer.jsp"%>
</body>
</html>