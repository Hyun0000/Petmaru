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
   <%@ include file="../admin_header.jsp" %>
</head>
<body>
            <main>
                <h2 class="main title">공지사항</h2>
                <div class="margin-top first">
                    <h3 class="hidden">공지사항 내용</h3>
                    <table class="table">
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td class="text-align-left text-indent text-strong text-orange" colspan="3"> ${n.title}</td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td class="text-align-left text-indent" colspan="3"><fmt:formatDate pattern = "yyyy/MM/dd hh:mm:ss" value="${n.regdate}"/> </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>${n.writerId }</td>
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
								<a download href="./upload/${fileName}" style="${style}">${fn:toUpperCase(fileName)}</a>
								<c:if test="${!st.last}">
								/
								</c:if>
							</c:forTokens></td>
					</tr>
					<tr class="content">
                                <td colspan="4">${n.content }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="margin-top text-align-center">
                    <a class="btn-text btn-cancel" href="adminNoticelist">목록</a>
                   <!--  <a class="btn-text btn-default" href="edit">수정</a>
                    <a class="btn-text btn-default" href="del">삭제</a> -->
                </div>

                <div class="margin-top">
                    <table class="table border-top-default">
                        <tbody>
                            <tr>
                                <th>다음글</th>
                                <td colspan="3" class="text-align-left text-indent">다음글이 없습니다.</td>
                            </tr>
                            <tr>
                                <th>이전글</th>
                                <td colspan="3" class="text-align-left text-indent"><a class="text-blue text-strong"
                                        href=""></a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>

</body>
    <%@ include file="../template_footer.jsp" %>  
</html>