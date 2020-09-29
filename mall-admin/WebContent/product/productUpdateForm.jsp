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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<%
	request.setCharacterEncoding("utf-8");	
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
	
	
%>
	<h1><a href="/mall-admin/notice/noticeList.jsp"><p class = "text-dark">공지사항</p></a></h1>
	<span>(위 공지사항을 누르면 공지사항 목록으로 돌아갑니다.)</span>
	<form method ="post" action="/mall-admin/product/productUpdateAction.jsp">
		<input type="hidden" name="productId" value="<%=product.getProductId() %>">
		
		<table class="table table-dark table-striped table-hover">
			<tr>
				<td>product_id</td>
				<td><%=product.getProductId() %></td>
			</tr>
			<tr>
				<td>category_id</td>
				<td><%=product.getCategoryId() %></td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input type="text" name="productName" value="<%=product.getProductName() %>"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input type="text" name="productPrice" value="<%=product.getProductPrice() %>"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><input type="text" name="productContent" style="text-align:center; width:700px; height:250px;" value="<%=product.getProductContent() %>"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
	</div>
</body>
</html>