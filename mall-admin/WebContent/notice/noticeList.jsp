<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<h1>공지사항 목록</h1>
	
	<table>
		<thead>
			<tr> 
				<td>notice_title</td>
				<td>notice_content</td>
				<td>notice_date</td>
				<td>삭제</td>
			</tr>
		</thead>
	 
		<tbody>
			<%
				for(Notice n : noticeList){
			%>
			<tr>
				
				<td><%=n.noticeTitle %></td>
				<td><%=n.noticeContent %></td>
				<td><%=n.noticeDate %></td>
				<td><a href="/mall-admin/notice/noticeDeleteAction.jsp?noticeId=<%=n.noticeId%>">삭제</a></td>
			</tr>
		
		<%
				}
		%>
		</tbody>
	</table>
	<a href="/mall-admin/notice/addNoticeList.jsp">공지사항 추가</a>
</body>
</html>