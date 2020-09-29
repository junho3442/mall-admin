<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		// session.getAttribute("loginAdminId") 세션에 만들어진 id
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
	
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<h1>공지사항</h1>
	<table class="table table-dark table-striped">
		<thead>
			<tr> 
				<td>notice_title</td>
				<td>notice_content</td>
				<td>notice_date</td>
				<td>공지사항 삭제</td>
			</tr>
		</thead>
	 
		<tbody>
			<%
				for(Notice n : noticeList){
			%>
			<tr>
				
				<td><%=n.getNoticeTitle() %></td>
				<td><%=n.getNoticeContent() %></td>
				<td><%=n.getNoticeDate() %></td>
				<td><a href="/mall-admin/notice/noticeDeleteAction.jsp?noticeId=<%=n.getNoticeId()%>" class="btn btn-outline-danger" role="button">삭제</a></td>
			</tr>
		
		<%
				}
		%>
		</tbody>
	</table>
	
	<div align="right"> 
	<a href="/mall-admin/notice/addNoticeList.jsp" class="btn btn-success" role="button">공지사항 추가</a>
	</div>
	
	</div>
</body>
</html>