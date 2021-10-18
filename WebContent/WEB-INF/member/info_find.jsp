<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String idChecks = (String)request.getAttribute("findid");
    %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
        <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
        <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
        <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
        <link rel="stylesheet" type="text/css" href="/Petmaru/css/info_find.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        <title>member_info_find</title>
    </head>
    
    <body>
<%=idChecks %>
<script type="text/javascript">
alert("<%=idChecks%>");
</script>    
    
       <%@include file ="/WEB-INF/template_header.jsp" %>
        <br>
        <br>
        <div id="loginlogo">
            <h2 style=text-align:center;>아이디/비밀번호 찾기</h2>
        </div>
        <div id=login_top_line></div>
        <!-- <form action="infofind" method="POST" id="idfind_form" name = "findID"> -->
        <form id = "findID">
            <div id="id_find_section" class="info_section">
                
                <h2 >아이디 찾기</h2>
                <div class=info_find_line></div>
                <table class="find_table">
                    <tr>
                        <td style="font-size: 25px;">이름</td>
                        <td><input type="text" name="name" id="name" class="input"></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px;">이메일</td>
                        <td> <input type="text" name ="email" id="pwd" class="input"></td>
                    </tr>
                    <br><br>
                    <tr>
                        <td colspan="2" sytle="text-align:center">
                            <input type="button" value="찾기" class="find_btn" id="idfind_btn" onclick="searchId()" >
                        </td>
                    </tr>
                </table>
            </div>
        </form>

        <form action="infofind" method="POST" id="idfind_form">
            <div id="pwd_find_section" class="info_section">
                
                <h2>비밀번호 찾기</h2>
                <div id=pwd_find_line class="info_find_line"></div>
                <table class="find_table">
                    <tr>
                        <td style="font-size: 25px;">아이디</td>
                        <td><input type="text" id="id" name="id" class="input"></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px;">이메일</td>
                        <td> <input type="text" id="email" name="email" class="input"></td>
                    </tr>
                    <br><br>
                    <tr>
                        <td colspan="2" sytle="text-align:center">
                            <input type="submit" value="찾기" class="find_btn" id="pwdfind_btn">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br><br>
        <div id=login_bottom_line></div>
        
                <script>
                
    var num = 1;
	function searchId() {
		if (num == 1) {
        var f = document.getElementById('findID');  
		f.action = "infofind";
		f.method = "post";
		f.submit();
		num++;
		} else {
			alert("<%=idChecks%>");
		}
		 
	}
	
        </script>
        </body>
</html>