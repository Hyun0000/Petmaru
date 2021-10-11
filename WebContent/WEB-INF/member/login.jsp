<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>memberlogin</title>
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
                <form action="#" method="GET">
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
        <h2 style=text-align:center;>로그인</h2>
    </div>
    <div id=login_top_line></div>
    <form action="#" method="POST" id="loginform">
        <div id="login_section">
            <table id="login_table">
                <tr>
                    <td style="font-size: 25px;">아이디</td>
                    <td><input type="text" id="id" class="input"></td>
                </tr>
                <tr>
                    <td style="font-size: 25px;">비밀번호</td>
                    <td> <input type="password" id="pwd" class="input"></td>
                </tr>
                <br><br>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="submit" value="로그인" class="btn" id="loginbtn">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" sytle="text-align:center">
                        <input type="button"  value="회원가입" onclick="location.href = 'http://localhost:8090/Petmaru/memberjoin';" class="btn" id="joinbtn">
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <br><br>
    <div id=login_bottom_line></div>
    <div id="findinfo">
        <a href="http://localhost:8090/Petmaru/info_find" title="아이디 비밀번호 찾기">아이디/비밀번호 찾기</a>
    </div>

    




    </div>
</body>
</html>