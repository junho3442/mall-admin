<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>카테고리 리스트</h1>
	<div>
		<a href="/mall-admin/category/addCategory.jsp" class="btn btn-outline-success" role="button">카테고리추가</a>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th>category_no</th>
				<th>category_name</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c :list){
			%>
				<tr>
					<td><%=c.getCategoryId() %></td>
					<td><%=c.getCategoryName() %></td>
				</tr>
			<% 							
				}
			%>
		</tbody>
</table>
		<div align="right">
			<a href="/mall-admin/product/productList.jsp" class="btn btn-outline-success" role="button">상품 관리 </a>
		</div>			
</div>
</body>
</html>