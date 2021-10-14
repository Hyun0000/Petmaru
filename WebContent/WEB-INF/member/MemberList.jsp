<%@page import="com.petmaru.member.model.vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String context_root = request.getContextPath();
%>   
    <%
    ArrayList<MemberVo> members = (ArrayList<MemberVo>)request.getAttribute("memberList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/MemberList.css"/>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../template_header.jsp"%>
	
	
	
	<section>
		<div id = "search">
			<form action="/searchKeyword">
				<select name="type" id = "ListCheck"class="form-control">
					<option value ="memberId">아이디</option>
					<option value ="memberName">이름</option>
				</select>
				<input type="text" id ="lookup "class="form-control" name="keyword">
				<button type="submit" class="btn btn-outline-secondary btn-sm">조회</button>
			</form>
		
		</div>
	<div id = table>
	<table class="table">
		<tr>
			<th>아이디</th><th>이름</th><th>성별</th>
			<th>이메일</th><th>전화번호</th><th>탈퇴</th>
		</tr>
		<%for(MemberVo listMember : members){%>
			<form action="/MemberList" method="post">
			<tr>
				<td><%=listMember.getMember_id()%></td>
				<td><%=listMember.getMember_name()%></td>
				<td><%=listMember.getMember_gender() %></td>
				<td><%=listMember.getMember_email() %></td>
				<td><%=listMember.getMember_phone() %></td>
				<td><button type="button" class="btn btn-outline-info btn sm" 
				onclick="location.href='/delete?memberId=<%=listMember.getMember_id()%>'">탈퇴</button></td>
			</tr>
			</form>
		<%}%>	
		
			
	</table>
	</div>
	</section>
	
	<%@ include file="../template_footer.jsp"%>
</body>
</html>