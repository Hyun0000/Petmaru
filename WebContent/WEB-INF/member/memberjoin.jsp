<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" %>
 <%String context_root = request.getContextPath();  
%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css" />
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/join.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>memberjoin</title>

</head>

<body>


    <%@ include file="../template_header.jsp" %>
    <br>
    <br>
    <div id="loginlogo">
        <h2 style=text-align:center;>회원가입</h2>
    </div>
    <div id=login_top_line></div>
    <form action="memberjoin" method="post" id="loginform">
        <div id="join_section">
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;">아이디</td>
                    <td><input type="text" name = "id" id="id" class="input"></td>
                    <td><input type="button" value="중복확인" id="id_check"></td>

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
                    <td style="font-size: 25px;">주소</td>
                    <td> <input type="text" id="add" name="add" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">성별</td>
                    <td>  <input type="radio" name="gender" value = "M" checked="checked"/> 남자
                        <input type="radio" name="gender"value = "F"/>여자</td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">생년월일</td>
                    <td> <input type="text" id="birth1" class="birth">년
                        <select name="month" id="month" class="birth">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>월
                        <input type="text" id="birth2" class="birth">일
                    </td>
                </tr>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="submit" onclick="joinbtn_click();" value="회원가입" class="btn" id="joinbtn">
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
            var add = document.getElementById("add").value;
            var gender = document.getElementsByName('gender');
            var birth1 = document.getElementById("birth1").value;
            var month = document.getElementById("month").value;
            var birth2 = document.getElementById("birth2").value;
            
    
            //성별체크 
            for(var i = 0; i<gender.length ;i++){
                if(gender[i].checked){
                    gender = gender[i].value; 
                }
            }
           // console.log(phone1);
           // alert(gender_value);

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