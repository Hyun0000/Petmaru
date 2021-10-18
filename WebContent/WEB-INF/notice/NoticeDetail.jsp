<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% String context_root = request.getContextPath(); %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
	  	<meta charset="UTF-8">
	    <title>게시글</title>	 
	    <%@ include file="../template_header.jsp" %>
	</head>  
    <body>		
	    <div>
	    	<table>
				<tbody>
					<tr>				
						<th>제목</th>
						<td colspan="3">${n.title}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>
							<fmt:formatDate pattern = "yyyy/MM/dd hh:mm:ss" value="${n.regdate}"/>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${n.writerId}</td>
						<th>조회수</th>
						<td><fmt:formatNumber value = "${n.hit}" /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3">
							<c:forTokens var= "fileName" items="${n.files}" delims="," varStatus="st">
								<c:set var = "style" value = ""/>
								<c:if test="${fn:endsWith(fileName , '.zip')}">
									<c:set var = "style" value = "font-weight: bold; color:red;" />
								</c:if>							
								<a href = "${fileName}" style = "${style}" >${fn:toUpperCase(fileName)}</a>
								<c:if test="${!st.last}">
								/
								</c:if>
							</c:forTokens>
						</td>
					</tr>
					<tr class="content">
						<td colspan="4">${n.content}</td>
					</tr>
				</tbody>
			</table>	
	    </div>	
		<div>
			<a href="Noticelist">목록</a>
		</div>				
    </body>  
    <%@ include file="../template_footer.jsp" %>  
</html>