<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import= "com.petmaru.member.model.vo.*"%>
 <% MemberVo m = (MemberVo)session.getAttribute("memberVo"); %> 
    <header>
        <div id="top_login">
            <ul>
        <%if (m == null){ %> 
                <li><a href="/Petmaru/loginview">로그인</a></li>
                <li><a href="/Petmaru/memberjoin">회원가입</a></li>
                <li><a href="/Petmaru/adminlogin.do">관리자페이지</a></li>
        <% } else { %> 
                <li><a href="/Petmaru/mypageupdate"><%=m.getMember_name()%>님의 마이페이지</a></li>
                <li><a href="/Petmaru/MemberLogout">로그아웃</a></li>
<% } %> 
            </ul>
        </div>
        <div id="logo_search">
            <div id="logo">
                <h1><a href="/Petmaru/">Petmaru</a></h1>
            </div>

            <div id="search">
                <form id="keyward_submit">
                    <input type="text" name="keyword" id="keyword" onkeydown="return pressEnter();">
                </form>
            </div>
        </div>

        <div id="header_line_top"></div>

        <div id="icon">
            <table id="left_icon">
                <tr style = cursor:pointer;>
                    <td><a href="/Petmaru/produclist?category=C"><span class="material-icons">checkroom</span><br><span class="icon_text">Clothes</span></a></td>
                    <td><a href="/Petmaru/produclist?category=A"><span class="material-icons">pets</span><br><span class="icon_text">Accessory</span></a></td>
                    <td><a href="/Petmaru/produclist?category=F"><span class="material-icons">restaurant</span><br><span class="icon_text">Food</span></a></td>
                    <td><a href="/Petmaru/produclist?category=B"><span class="material-icons">shower</span><br><span class="icon_text">Bath</span></a></td>
                    <td><a href="/Petmaru/produclist?category=T"><span class="material-icons">smart_toy</span><br><span class="icon_text">Toy</span></a></td>
                    <td><a href="/Petmaru/produclist?category=H"><span class="material-icons">house</span><br><span class="icon_text">House</span></a></td>
                </tr>
            </table>

            <table id="right_icon">
                <tr style = cursor:pointer;>
                    <td><a href="<%=request.getContextPath() %>/boardlist"><span class="material-icons">article</span><br><span class="icon_text">자유게시판</span></td></a>
                    <td><a href="/Petmaru/Noticelist"><span class="material-icons">task_alt</span><br><span class="icon_text">공지사항</span></td></a>
                </tr>
            </table>
        </div>

        <div id="header_line_bottom"></div>
    </header>

