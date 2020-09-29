<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>카테고리 입력</h1>
	<form method = "post" action ="/mall-admin/category/addCategoryAction.jsp">
		<div>category_name</div>
		<div><input type="text" name = "categoryName"></div>
		<div><button type="submit">카테고리 추가</button></div>
	</form>
</body>
</html>