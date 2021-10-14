<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>memberlogin</title>
</head>

<body>
<%@ include file="../template_header.jsp" %>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>로그인</h2>
    </div>
    
    <div id=login_top_line></div>
    
    <form action="/Petmaru/login" method="POST" id="loginform">
        <div id="login_section">
        
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;">아이디</td>
                    <td><input type="text" id="id" class="input" name="id"></td>
                </tr>
                
                <tr>
                    <td style="font-size: 25px;">비밀번호</td>
                    <td> <input type="password" id="pwd" class="input" name="pwd"></td>
                </tr>
                
                <br><br>
                
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="submit" value="로그인" class="btn" id="loginbtn">
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="button"  value="회원가입" onclick="location.href = 'http://localhost:8090/Petmaru/memberjoin';" class="btn" id="joinbtn">
                        
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
    
    <br><br>
    <div id=login_bottom_line></div>
    <div id="findinfo">
        <a href="http://localhost:8090/Petmaru/infofind">아이디/비밀번호 찾기</a>
    </div>
   <%@ include file="../template_footer.jsp" %>
</body>
</html>