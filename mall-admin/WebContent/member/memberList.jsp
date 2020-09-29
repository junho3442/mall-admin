<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="java.util.*" %>
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
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> memberList = memberDao.selectMemberList();
	%>
	<h1>회원 목록</h1>
	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<td>member_email</td>
				<td>member_pw</td>
				<td>member_name</td>
				<td>member_date</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList){
			%>
			<tr>
				<td><%=m.getMemberEmail() %></td>
				<td><%=m.getMemberPw() %></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getMemberDate() %></td>
				<td><a href ="/mall-admin/member/memberDeleteAction.jsp?memberEmail=<%=m.getMemberEmail() %>" class="btn btn-outline-danger" role="button">추방</a></td>
			</tr>
			<%
				}
			%>
		
		</tbody>
		
	</table>
	</div>
</body>
</html>