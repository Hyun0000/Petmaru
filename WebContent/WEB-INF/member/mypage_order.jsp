 <link rel="stylesheet" type="text/css" href="/Petmaru/css/productlist.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_header.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/join.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/mypage1.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/mypage2.css" />
    <link rel="stylesheet" type="text/css" href="/Petmaru/css/template_footer.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageorder</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
 <div id="loginlogo">
        <h2 style=text-align:center;>마이페이지</h2>
    </div>
    <div id=login_top_line></div>
    <div id=menu>
        <div id=mypagetop_line>
            <p id=menutext>마이페이지</p>
        </div>
        <table id="menutable">
            <tr>
                <td>
                    <input onclick="location.href = '/Petmaru/mypageupdate';" type="button" value="회원정보 수정" class="menuBtn">
                </td>
            </tr>
            <tr>
                <td>
                    <input onclick="location.href = '/Petmaru/membermypageorder';" type="button" value="주문 내역 조회" class="menuBtn">
                </td>
            </tr>

        </table>
    </div>
    <h1 id="order_header">주문 내역조회</h1>
    <div id=ordertop_line></div>
    <section id="table1_section">
        <div id="table1">

            <div id="ordertable">
                <table border="2" id="order_table">
                    <thead id="thead">
                        <th>주문번호</th>
                        <th>주문일자</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>주문 처리상태</th>
                        <th>취소반품</th>
                    </thead>
                    <tbody>
                        <tr id="trd">
                            <td>1</td>
                            <td>201031111</td>
                            <td>임시상품명</td>
                            <td>40000원</td>
                            <td>1</td>
                            <td>배송중</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </section>

    <section id="table2_section">
        <h1 id="myselect_header">MY 장바구니</h1>
        <div id=myselect_top_line></div>
        <div id="table2">
            <table border="2" id="myselect_table">
                <thead>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>보관/삭제</th>
                </thead>
                <tbody>
                    <tr>
                        <td>임시상품명</td>
                        <td>10000원</td>
                        <td>배송중</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>
   <%@ include file="../template_footer.jsp" %>
</body>
</html>