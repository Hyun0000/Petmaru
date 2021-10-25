<%@page import="com.petmaru.notice.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context_root = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_footer.css"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>공지사항상세정보</title>
    <style type="text/css">

   a:link { 

 color: #58595b;

 text-decoration: none;

}

a:visited {

 color: #58595b;

 text-decoration: none;

}

a:hover {

 color: #58595b;

 text-decoration: none;

}

a:active {

 color: #58595b;

 text-decoration: none;

}
#topmain{
		width : 1000px;
		text-align :center;
		font-size: 40px;
		
}
#d1{

	}
#detailinfo{
		border : 1px solid;
		position : relative;
		left : 500px;
}
#dcontent{
		border : 1px;
		width : 500px;
}
.back{
	position : relative;
	left : 500px;
}
    </style>
   <%@ include file="../admin_header.jsp" %>
</head>
<body>
<h3 id="topmain">공지사항 상세보기</h3>
            <main>
                
                <div class="margin-top first">
                    <table id="detailinfo">
                        <tbody>
                            <tr id = "d1">
                                <th>제목</th>
                                <td colspan="2"> ${n.title}</td>

                                <th>작성일</th>
                                <td colspan="3"><fmt:formatDate pattern = "yyyy/MM/dd " value="${n.regdate}"/> </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td colspan = "2">${n.writerId }</td>
                                <th>조회수</th>
                                <td>${n.hit }</td>
                            </tr>
						<tr>
						<th>첨부파일</th>
						<td colspan="3"><c:forTokens var="fileName"
								items="${n.files}" delims="," varStatus="st">
								<c:set var="style" value="" />
								<c:if test="${fn:endsWith(fileName , '.zip')}">
									<c:set var="style" value="font-weight: bold; color:red;" />
								</c:if>
								<a href="/Petmaru/upload/${fileName}" download="${fileName}"${fileName} style="${style}">${fn:toUpperCase(fileName)}</a>
								<c:if test="${!st.last}">
								/
								</c:if>
							</c:forTokens></td>
					</tr>
					<tr id="dcontent">
                                <td colspan="4"">${n.content }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="back">
                    <a href="adminNoticelist">목록</a>
                   <!--  <a class="btn-text btn-default" href="edit">수정</a>
                    <a class="btn-text btn-default" href="del">삭제</a> -->
                </div>

 
            </main>

</body>
    <%@ include file="../template_footer.jsp" %>  
</html>