<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1>카테고리 입력</h1>
	<form method = "post" action ="/mall-admin/category/addCategoryAction.jsp">
		
		<div class="input-group mb-3 input-group-lg">
			<div class="input-group-prepend">
				<span class="input-group-text">category_name</span>
			</div>
				<input type="text" class="form-control" name = "categoryName">
			</div>	
		
			<div align="right">
				<button type="submit" class="btn btn-outline-success">카테고리 추가</button>
			</div>
	</form>
	</div>
</body>
</html>