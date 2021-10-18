<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)request.getAttribute("searchId");
    String pwd = (String)request.getAttribute("searchPwd"); %>   
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
    
    
       <%@include file ="/WEB-INF/template_header.jsp" %>
        <br>
        <br>
        <div id="loginlogo">
            <h2 style=text-align:center;>아이디/비밀번호 찾기</h2>
        </div>
        <div id=login_top_line></div>
        <form action="infofind" method="POST" id="idfind_form" name = "findID">
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

        <form action="infofind" method="POST" id="idfind_form" name = "findPwd">
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
                            <input type="button" value="찾기" class="find_btn" id="pwdfind_btn" onclick="searchpwd()">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br><br>
        <div id=login_bottom_line></div>
        
                <script>
                var f = document.findID;
                var f2 = document.findPwd;
                function searchId(){        	
                 	console.log(f);
                 	console.log(f.name.value);
                 	console.log(f.email.value);
         			if(f.name.value==""){
         				alert("이름을 입력해주세요.");
         				f.id.focus();
         				return false;
         			}
         			else if(f.email.value ==""){
         				alert("이메일 입력해주세요");
         				f.email.focus();
         				return false;
         			}
         	        f.submit(); 
         	 		
         	 	}
                
         		var searchedId = "<%=id%>";
         		if(searchedId != "" && searchedId != "null"){
         			alert("아이디: "+ "<%=id%>"); 
         		}
         		else if(searchedId ==""){
         			alert("정보가 없습니다."); 
         		}
         		function searchpwd(){        	
                 	console.log(f2);
                 	console.log(f2.id.value);
                 	console.log(f2.email.value);
         			if(f2.id.value==""){
         				alert("아이디를 입력해주세요.");
         				f2.id.focus();
         				return false;
         			}
         			else if(f2.email.value ==""){
         				alert("이메일 입력해주세요");
         				f2.email.focus();
         				return false;
         			}
         	        f2.submit(); 
         	 		
         	 	}
         		
        		var searchedPwd = "<%=pwd%>";
         		if(searchedPwd != "" && searchedPwd != "null"){
         			alert("비밀번호: " +"<%=pwd%>");
         			}
         		else if(searchedPwd ==""){
         			alert("정보가 없습니다."); 
         		}
         		
        </script>
        </body>
</html>