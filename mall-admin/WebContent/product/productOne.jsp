<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>

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
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<<");
	
	Product product = new ProductDao().selectProductOne(productId);
	
%>	
	<h1><a href="/mall-admin/product/productList.jsp"><p class = "text-dark">상품 목록</p></a></h1>
	<span>(상품 목록을 누르시면 이전페이지로 돌아갑니다.)</span>
	<table class = "table table-dark table-striped"> <!-- 테이블 선 -->
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/img/<%=product.getProductPic()%>"></td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId()%></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.getCategoryId()%></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName()%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice()%></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent()%></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td><%
					if(product.getProductSoldout().equals("Y")){
				%>
					<a href ="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[품절]</a>
				<%																						//쿼리문  띄어쓰기	
					}else{
				%>
					<a href ="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[판매중]</a>
				<% 		
					}
				%>
			</td>
		</tr>
		
	</table>
		<div align="right">
			<a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>" class="btn btn-outline-success" role="button">상품 이미지 수정</a>
			<a href="/mall-admin/product/productUpdateForm.jsp?productId=<%=product.getProductId()%>" class="btn btn-outline-success" role="button">수정</a>
			<a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=product.getProductId()%>" class="btn btn-outline-danger" role="button">삭제</a>
		</div>
</div>
</body>
</html>