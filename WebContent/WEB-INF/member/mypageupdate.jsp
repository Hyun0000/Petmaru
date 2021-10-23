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
<title>mypageupdate</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
	String id =null;
	if(session.getAttribute("memberLoginInfo")!=null){
		id =(String)session.getAttribute("memberLoginInfo");
	}
	 m = new MemberService().getMember(id);
	 String deleteid = null;
%>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>마이페이지</h2>
    </div>
    <div id=login_top_line></div>
    <div id = menu>
        <div id=mypagetop_line>
            <p id = menutext>마이페이지</p>
        </div>
        <table id="menutable">
            <tr>
                 <td>
                     <input type="button" value="회원정보 수정" class="menuBtn"> 
                </td>                                
            </tr>
            <tr>
                <td>
                    <input type="button" value="주문 내역 조회" class="menuBtn">  
                </td>
            </tr>

        </table>
    </div>
    <section>
        <form action="mypageupdate" method="post" name="modify"
            style="width: 800px; margin: 0 auto; color: black;">
            <h1 id="info_header">회원정보</h1>
            <div id = infotop_line></div>
            <table class="myinfo_table">
               <tr class ="tr">
                    <th class="font">아이디</th>
                    <td><input type="text" name="id" class="textset"
                        value="<%=m.getMember_id() %>" readonly></td>
                </tr>
                <tr>
                    <th class="font">비밀번호</th>
                    <td><input type="text" name="pwd" class="textset"
                        value="<%=m.getMember_pwd() %>"></td>
                </tr>
                <tr>
                    <th class="font">비밀번호 확인</th>
                    <td><input type="password" name="pwd2" class="textset"
                        value="<%=m.getMember_pwd() %>"></td>
                </tr>
                <tr>
                    <th class="font">이름</th>
                    <td><input type="text" name="name" class="textset"
                        value="<%=m.getMember_name()%>"></td>
                </tr>
                <tr>
                    <th class="font">이메일</th>
                    <td><input type="text" name="email" class="textset"
                        value="<%=m.getMember_email()%>"></td>
                </tr>
                <tr>
                    <th class="font">연락처</th>
                    <td><input type="text" name="phone" class="textset"
                        value="<%=m.getMember_phone()%>"></td>
                </tr>
                 <tr>
                    <th class="font">주소</th>
                    <td><input type="text" name="address" class="textset"
                        value="<%=m.getMember_address()%>"></td>
                </tr>
                 <tr>
                    <th class="font">성별</th>
                    <td><input type="text" name="gender" class="textset"
                        value="<%=m.getMember_gender()%>" readonly></td>
                </tr> 
                <tr>
                    <th class="font">가입일</th>
                    <td><input type="text" name="regdate" class="textset"
                        value="<%=m.getMember_regdate() %>" readonly></td>
                </tr>
                 <tr>
                    <th class="font">포인트</th>
                    <td><input type="text" name="point" class="textset"
                        value="<%=m.getMember_point()%>" readonly></td>
                </tr>
                <tr>
                    <th colspan="2" >
                      <button class="btnset" type="button" name="modifybtn" onclick="modify_click()">수정하기</button>
                   
                     <button class="btnset" type="button"
                           onclick="member_deleteclick()">회원탈퇴</button>
           
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
 			else if(f.address.value ==""){
 				alert("주소를 입력해주세요");
 				f.address.focus();
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
 	 		
            alert("회원 정보가 수정되었습니다.");
 	 	}

       
  function member_deleteclick() {
            if (!confirm("정말 탈퇴 하시겠습니까?")) {
                alert("탈퇴가 취소 되었습니다.");
                	return false;
            } else {		
            	location.href="/Petmaru/memberdelete";
 
            }
        }     

        </script>
</body>
</html>