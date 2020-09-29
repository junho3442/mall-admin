<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
	
	
%>
	<form method ="post" action="/mall-admin/product/productUpdateAction.jsp">
		<input type="hidden" name="productId" value="<%=product.productId %>">
		
		<table border="1">
			<tr>
				<td>product_id</td>
				<td><%=product.productId %></td>
			</tr>
			<tr>
				<td>category_id</td>
				<td><%=product.categoryId %></td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input type="text" name="productName" value="<%=product.productName %>"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input type="text" name="productPrice" value="<%=product.productPrice %>"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><input type="text" name="productContent" value="<%=product.productContent %>"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>