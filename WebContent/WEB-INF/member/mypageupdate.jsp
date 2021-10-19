<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.petmaru.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageupdate</title>
 <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/join.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/mypage1.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="../template_header.jsp" %>
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
        <form action="mypageupdate" method="post"
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
                        <button class="btnset" type="submit">수정하기</button>
                   
                        <button class="btnset" type="button"
                           onclick="location.href='/delete?memberId=11'">회원탈퇴</button>
           
                    </th>
                    
                </tr>
            </table>
        </form>
        </section>
        
          <%@ include file="../template_footer.jsp" %>
        <script type="text/javascript">

        </script>
</body>
</html>