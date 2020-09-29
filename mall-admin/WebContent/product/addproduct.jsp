<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
    <%@ page import = "dao.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
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
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="container">
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>상품 추가</h1>
	<form method = "post" action="/mall-admin/addproductAction.jsp">
		<table class = "table-dark">
		<thead>
			<span class="badge badge-secondary">category_id</span></h4>
					<select name = "categoryId">
					<%
						for(Category c : categoryList){
					%>
						
						<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName() %></option>
					<% 
						}
					%>
					</select>	
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">product_name</span>
			</div>
				<input type="text" class="form-control" name="productName">	
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">product_price</span>
			</div>
				<input type="text" class="form-control" name="productPrice">	
		</div>	
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">product_content</span>
			</div>
				<textarea rows="5" cols="80" class="form-control" name="productContent"></textarea>	
			</div>	
		</div>	
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">product_soldout</span>
			</div>
				<input type="radio" class="form-control" name="productSoldout" value="N" checked="checked">품절아님
				<input type="radio" class="form-control" name="productSoldout" value="Y">품절
		</div>		
		</thead>
	</table>
	<button type="submit" class="btn btn-outline-dark">추가</button>
	</form>
	</div>
</body>
</html>