<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <td><input type="text" name="memberId" class="textset"
                        value="id" readonly></td>
                </tr>
                <tr>
                    <th class="font">비밀번호</th>
                    <td><input type="password" name="memberPw" class="textset"
                        value="pwd"></td>
                </tr>
                <tr>
                    <th class="font">비밀번호 확인</th>
                    <td><input type="password" name="memberPw" class="textset"
                        value="pwd2"></td>
                </tr>
                <tr>
                    <th class="font">이름</th>
                    <td><input type="text" name="memberName" class="textset"
                        value="name"></td>
                </tr>
                <tr>
                    <th class="font">나이</th>
                    <td><input type="text" name="age" class="textset"
                        value="age"></td>
                </tr>
                <tr>
                    <th class="font">이메일</th>
                    <td><input type="text" name="email" class="textset"
                        value="email"></td>
                </tr>
                <tr>
                    <th class="font">연락처</th>
                    <td><input type="text" name="phone" class="textset"
                        value="1111"></td>
                </tr>
                <tr>
                    <th class="font">가입일</th>
                    <td><input type="text" name="enrollDate" class="textset"
                        value="11" readonly></td>
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
</body>
</html>