    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/join.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String context_root = request.getContextPath();%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adminjoin</title>

</head>

<body>


    <%@ include file="../admin_header.jsp" %>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>관리자 등록</h2>
    </div>
    <div id=login_top_line></div>
    <form action="adminjoin" method="post" id="loginform">
        <div id="join_section">
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;">아이디</td>
                    <td><input type="text" name = "id" id="id" class="input"></td>
                    <!-- <td><input type="button" value="중복확인" id="id_check"></td> -->

                </tr>
                <tr>
                    <td style="font-size: 25px;">비밀번호</td>
                    <td> <input type="password" name="pwd1" id="pwd1" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">비밀번호 확인</td>
                    <td> <input type="password" id="pwd2" name= "pwd2" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">이메일</td>
                    <td> <input type="text" id="email" name="email" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">이름</td>
                    <td> <input type="text" id="name" name ="name" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">휴대전화</td>
                    <td><select name="phone1" class="phone1" name="phone1" id="phone1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select> <input type="text" id="phone2" name="phone2" class="phone2">-<input type="text" name = "phone3" id="phone3"
                            class="phone2"> </td>
                </tr>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="submit" onclick="joinbtn_click();" value="관리자 등록" class="btn" id="joinbtn">
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id=login_bottom_line></div>
  <%@ include file="../template_footer.jsp" %>
    <script >
         function joinbtn_click(){
            var id = document.getElementById("id").value;
            var pwd1 = document.getElementById("pwd1").value;
            var pwd2 = document.getElementById("pwd2").value;
            var email = document.getElementById("email").value;
            var name = document.getElementById("name").value;
            var phone1 = document.getElementById("phone1").value;
            var phone2 = document.getElementById("phone2").value;
            var phone3 = document.getElementById("phone3").value;
  
            
           //비밀번호 체크
            if(pwd1 != pwd2) {
                alert("동일하게 입력해주세요");
                return false;
            }
            var phone2check= /^[0-9]{3,4}$/;
            if( !phone2check.test(phone2) ){
                alert("3-4 자리 유효 조건에 맞게 입력해주세요");
                return false;
            }
            var phone3check= /^[0-9]{4}$/;
            if( !phone3check.test(phone3) ){
                alert("4 자리 유효 조건에 맞게 입력해주세요");
                return false;
            }
            alert("회원가입 완료");

        }
     

    </script>
</body>
</html>