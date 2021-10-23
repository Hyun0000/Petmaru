 <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/join.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/mypage1.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/delete.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/delete.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@page import="com.petmaru.member.model.service.MemberService"%>
<%@page import="com.petmaru.member.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.petmaru.member.model.vo.*"%>
    <% String logininfo = (String)request.getAttribute("login");
    String deleteinfo = (String)request.getAttribute("deleteinfo");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>delete</title>
</head>

<body>

       <%@include file ="/WEB-INF/template_header.jsp" %>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>회원 탈퇴</h2>
    </div>
    <div id=login_top_line></div>
    <form action="/Petmaru/memberdelete" method="post" id="loginform" name ="deleteinfo">
        <div id="login_section">
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;" class="input_text">아이디</td>
                    <td><input type="text"  name="deleteid" id="deleteid" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;" class="input_text">비밀번호</td>
                    <td> <input type="password" name="deletepwd" id="deletepwd" class="input"></td>
                </tr>
                <br><br>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="button" value="탈퇴하기"  id="loginbtn" class="deletebtn" onclick="deletemember()">
                        <input type="button" class="deletebtn" value="취소" onclick="location.href = '/Petmaru/mypageupdate'"  id="joinbtn">
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <br><br>
    <div id=login_bottom_line></div>


    




    </div>
     <%@ include file="../template_footer.jsp" %>
</body>
<script type="text/javascript">
var logininfo = "<%=logininfo%>";
var deleteinfo = "<%=deleteinfo%>";

var f = document.deleteinfo;
function deletemember(){        	
 	console.log(f.deleteid.value);
 	console.log(f.deletepwd.value);
		if(f.deleteid.value==""){
			alert("아이디를 입력해주세요.");
			f.deleteid.focus();
			return false;
		}
		else if(f.deletepwd.value ==""){
			alert("비밀번호를 입력해주세요");
			f.deletepwd.focus();
			return false;
		}
     f.submit(); 
		
	}
	

if(deleteinfo==""){
	alert("회원 탙퇴가 완료 되었습니다.")
}
if(logininfo==""){
	alert("정보를 올바르게 입력하세요");
}

</script>
</html>