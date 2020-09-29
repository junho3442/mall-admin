<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> memberList = memberDao.selectMemberList();
	%>
	<h1>회원 목록</h1>
	<table>
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
				<td><%=m.memberEmail %></td>
				<td><%=m.memberPw %></td>
				<td><%=m.memberName %></td>
				<td><%=m.memberDate %></td>
				<td><a href ="/mall-admin/memberDeleteAction.jsp">추방</a></td>
			</tr>
			<%
				}
			%>
		
		</tbody>
		
	</table>
</body>
</html>