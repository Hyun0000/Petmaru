<%@page import="com.petmaru.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>


</head>
<body>
	<%
		// 이곳은 자바 문법에 따름
	ArrayList<Member> volist = (ArrayList<Member>) request.getAttribute("Membervolist");
	int startPage = (int) request.getAttribute("startPage");
	int endPage = (int) request.getAttribute("endPage");
	int pageCount = (int) request.getAttribute("pageCount");
	%>
	<h1>회원 정보</h1>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>아이디</td>
			<td>성별</td>
			<td>가입일</td>
			<tr>
			<%
				if (volist != null) {
				for (Member vo : volist) {
					// tr 이 volist 갯수 만큼 생기게 됨.
					// <%= 은 화면에 출력을 위한 표현식을 작성하는 태그, ;없어야 함.
			%>
		
		
		
		<tr>
			<td><%=vo.getMember_name()%></td>
			<td>
			 <%=vo.getMember_id()%>
			</td>
			<td><%=vo.getMember_gender()%></td>
			<td><%=vo.getMember_regdate()%></td>
		<tr>
			<%
				}
			}
			%>
		
	</table>

	<%
		if (startPage > 1) {
	%>
	이전
	<%
		}
	for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="./MemberList?pagenum=<%=i%>"> <%=i%>
	</a>
	<%
		if (i != endPage) {
	%>
	,
	<%
		}
	}
	if (endPage < pageCount) {
	%>
	다음
	<%
		}
	%>


	<br>
	<a href="MemberUpdate">회원 수정</a>




</body>
</html>