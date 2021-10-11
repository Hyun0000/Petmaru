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
    <link rel="stylesheet" type="text/css" href="<%=context_root %>/css/join.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>memberjoin</title>

</head>

<body>


    <header>
        <div id="top_login">
            <ul>
                <li><a href="http://127.0.0.1:5500/petmaru/login.html">로그인</a></li>
                <li><a href="http://127.0.0.1:5500/petmaru/join.html">회원가입</a></li>
                <li><a href="#">마이페이지</a></li>
            </ul>
        </div>

        <div id="logo_search">
            <div id="logo">
                <h1>Petmaru</h1>
            </div>

            <div id="search">
                <form action="MemberJoin" method="GET">
                    <!-- <div class="material-icons">search</div> -->
                    <input type="text" name="keyword">
                </form>
            </div>
        </div>

        <div id="header_line_top"></div>

        <div id="icon">
            <table id="left_icon">
                <tr>
                    <td><a href="/Petmaru/produclist?category=C"><span class="material-icons">checkroom</span><br><span
                                class="icon_text">Clothes</span></a></td>
                    <td><a href="/Petmaru/produclist?category=A"><span class="material-icons">pets</span><br><span
                                class="icon_text">Accessory</span></a></td>
                    <td><a href="/Petmaru/produclist?category=F"><span class="material-icons">restaurant</span><br><span
                                class="icon_text">Food</span></a></td>
                    <td><a href="/Petmaru/produclist?category=B"><span class="material-icons">food_bank</span><br><span
                                class="icon_text">Bath</span></a></td>
                    <td><a href="/Petmaru/produclist?category=T"><span class="material-icons">smart_toy</span><br><span
                                class="icon_text">Toy</span></a></td>
                    <td><a href="/Petmaru/produclist?category=H"><span class="material-icons">house</span><br><span
                                class="icon_text">House</span></a></td>
                </tr>
            </table>

            <table id="right_icon">
                <tr>
                    <td><a href="#"><span class="material-icons">article</span><br><span class="icon_text">자유게시판</span>
                    </td></a>
                    <td><a href="#"><span class="material-icons">task_alt</span><br><span class="icon_text">공지사항</span>
                    </td></a>
                </tr>
            </table>
        </div>

        <div id="header_line_bottom">
        </div>
    </header>
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
                    <td><input type="text" id="id" class="input"></td>
                    <td><input type="button" value="중복확인" id="id_check"></td>

                </tr>
                <tr>
                    <td style="font-size: 25px;">비밀번호</td>
                    <td> <input type="password" id="pwd1" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">비밀번호 확인</td>
                    <td> <input type="password" id="pwd2" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">이메일</td>
                    <td> <input type="text" id="email" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">이름</td>
                    <td> <input type="text" id="name" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">휴대전화</td>
                    <td><select name="phone1" class="phone1" id="phone1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select> <input type="text" id="phone2" class="phone2">-<input type="text" id="phone3"
                            class="phone2"> </td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">주소</td>
                    <td> <input type="text" id="add" class="input"></td>
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
                        <input type="button" onclick="joinbtn_click();" value="회원가입" class="btn" id="joinbtn">
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id=login_bottom_line></div>

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
            var gender_value = ''; 
            
    
            //성별체크 
            for(var i = 0; i<gender.length ;i++){
                if(gender[i].checked){
                    gender_value = gender[i].value; 
                }
            }
           // console.log(phone1);
           // alert(gender_value);

           //비밀번호 체크
            if(pwd1 != pwd2) {
                alert("동일하게 입력해주세요");
                return false;
            } 

        }
     

    </script>
</body>
</html>