<link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
<link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
<link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
<link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
<link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../admin_header.jsp" %>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>관리자 로그인</h2>
    </div>
    <div id=login_top_line></div>
    <form action="/Petmaru/adminlogin.do" method="POST" id="loginform">
        <div id="login_section">
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;" class="input_text">아이디</td>
                    <td><input type="text" name="id" id="id" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;" class="input_text">비밀번호</td>
                    <td> <input type="password" name="pwd" id="pwd" class="input"></td>
                </tr>
                <br><br>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="submit" value="로그인" class="btn" id="loginbtn">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="button"  value="관리자 등록" onclick="location.href = 'http://127.0.0.1:5500/petmaru/join.html';" class="btn" id="joinbtn">
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <br><br>
    <div id=login_bottom_line></div>
    <div id="findinfo">
        <a href="#" title="관리자 아이디 비밀번호 찾기">아이디/비밀번호 찾기</a>
    </div>

    




    </div>
     <%@ include file="../template_footer.jsp" %>
</body>
</html>