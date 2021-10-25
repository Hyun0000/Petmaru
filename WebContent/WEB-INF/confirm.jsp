<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String confirmMsg = (String)request.getAttribute("errMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if("<%=confirmMsg%>" != "null" && "<%=confirmMsg%>" != ""){
			alert("<%=confirmMsg%>");
		}
		location.href="boardlist";
	</script>
</body>
</html>