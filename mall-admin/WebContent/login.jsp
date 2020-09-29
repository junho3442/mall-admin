<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("loginAdminId") != null) {
			response.sendRedirect("/mall-admin/index.jsp");
			// session.getAttribute("loginAdminId") 세션에 만들어진 id
			return; // 밑에코드가 실행되지않게 끝내는 return
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="/mall-admin/loginAction.jsp">
	<table border ="1">
		<tr>
			<td>관리자id</td>
			<td><input type="text" name="adminId"></td>
		</tr>
		<tr>
			<td>관리자pw</td>
			<td><input type="password" name="adminPw"></td>
		</tr>
	</table>
	<button type= "submit">로그인</button>
	</form>
</body>
</html>