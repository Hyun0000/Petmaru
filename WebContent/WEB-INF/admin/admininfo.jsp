 <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/join.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/mypage1.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@page import="com.petmaru.member.model.service.MemberService"%>
<%@page import="com.petmaru.member.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.petmaru.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>admininfopage</title>
</head>
<body>
<%@ include file="../admin_header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
	String id =null;
	if(session.getAttribute("adminLoginInfo")!=null){
		id =(String)session.getAttribute("adminLoginInfo");
	}
	 admin = new MemberService().getAdmin(id);
	 String deleteid = null;
%>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>관리자 정보</h2>
    </div>
    <div id=login_top_line></div>
    <div id = menu>
   
    </div>
    <section>
        <form action="adminmypage" method="post" name="modify"
            style="width: 800px; margin: 0 auto; color: black;">

            <table class="myinfo_table">
               <tr class ="tr">
                    <th class="font">아이디</th>
                    <td><input type="text" name="id" class="textset"
                        value="<%=admin.getAdmin_ID()%>" readonly></td>
                </tr>
                <tr>
                    <th class="font">비밀번호</th>
                    <td><input type="text" name="pwd" class="textset"
                        value="<%=admin.getAdmin_pwd() %>"></td>
                </tr>
                <tr>
                    <th class="font">비밀번호 확인</th>
                    <td><input type="password" name="pwd2" class="textset"
                        value="<%=admin.getAdmin_pwd() %>"></td>
                </tr>
                <tr>
                    <th class="font">이름</th>
                    <td><input type="text" name="name" class="textset"
                        value="<%=admin.getAdmin_name()%>"></td>
                </tr>
                <tr>
                    <th class="font">이메일</th>
                    <td><input type="text" name="email" class="textset"
                        value="<%=admin.getAdmin_Email()%>"></td>
                </tr>
                <tr>
                    <th class="font">연락처</th>
                    <td><input type="text" name="phone" class="textset"
                        value="<%=admin.getAdmin_phone()%>"></td>
                </tr>
                <tr>
                    <th colspan="2" >
                      <button class="btnset" type="button" name="modifybtn" onclick="modify_click()">수정하기</button>
                            
                    </th>
                    
                </tr>
            </table>
        </form>
        </section>
        
          <%@ include file="../template_footer.jsp" %>
        <script type="text/javascript">
        
        var f = document.modify;
        function  modify_click(){        	

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
           //비밀번호 체크
           else if(f.pwd.value != f.pwd2.value ) {
                alert("비밀 번호를 동일하게 입력해주세요.");
                return false;
            }
			else if(f.pwd.value ==""){
 				alert("비밀번호를 입력해주세요");
 				f.pwd.focus();
 				return false;
 			}
			else if(f.pwd2.value ==""){
 				alert("비밀번호확인을 입력해주세요");
 				f.pwd2.focus();
 				return false;
 			}
			else if(f.phone.value ==""){
 				alert("전화번호를 입력해주세요");
 				f.phone.focus();
 				return false;
 			}
 	        f.submit(); 
 	 		
            alert(" 정보가 수정되었습니다.");
 	 	}

         

        </script>
</body>
</html>