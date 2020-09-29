<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
    <%@ page import = "dao.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
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
		int categoryId = -1; 
		if(request.getParameter("categoryId")!=null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} // 검색을 위해 categoryId값을 받아옴
	
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null; // 클래스 리스트 
		if(categoryId == -1){
			productList = productDao.selectProductList();
		}else{
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>상품목록</h1>
	
	<div>
		<%
			for(Category c : categoryList){
		%>
			<a href = "/mall-admin/product/productList.jsp?categoryId=<%=c.categoryId %>" class="btn btn-outline-dark" role="button">
			<%=c.categoryName %>
			</a>
		<% 
			} 
		%>
		<span>
				<a href="/mall-admin/product/addproduct.jsp" class="btn btn-outline-dark" role="button">상품 추가</a>
		</span>
	</div>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<td>product_id</td>
				<td>category_id</td>
				<td>product_name</td>
				<td>product_price</td>
				<td>product_soldout</td>
				
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.productSoldout.equals("Y")){
			%>
					<tr>
					<td><a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>"><%=p.productId %></a></td>
					<td><%=p.categoryId %></td>
					<td><%=p.productName %></td>
					<td><%=p.productPrice %></td>
					<td>품절</td>
				</tr>
			<% 			
						
					}else{
			%>
						<tr>
							<td><a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>"><%=p.productId %></a></td>
							<td><%=p.categoryId %></td>
							<td><%=p.productName %></td>
							<td><%=p.productPrice %></td>
							<td><%=p.productSoldout %></td>
						</tr>
			<%	
						
					}
					
				}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>