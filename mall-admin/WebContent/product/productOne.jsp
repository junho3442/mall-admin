<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> <!-- 테두리 선 색; -->
	table {border: 1px solid black;} 
	td {border: 1px solid pink;} 
	

</style>
</head>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<<");
	
	Product product = new ProductDao().selectProductOne(productId);
	
%>
	<h1>상품 상세보기</h1>
	<table > <!-- 테이블 선 -->
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/img/<%=product.productPic%>">
				<a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.productId%>">이미지 수정</a>
			</td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.productId%></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.categoryId%></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.productName%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.productPrice%></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.productContent%></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td><%
					if(product.productSoldout.equals("Y")){
				%>
					<a href ="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>">[품절]</a>
				<%																						//쿼리문  띄어쓰기	
					}else{
				%>
					<a href ="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>">[판매중]</a>
				<% 		
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a href="/mall-admin/product/productUpdateForm.jsp?productId=<%=product.productId%>">수정</a></td>
			<td><a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=product.productId%>">삭제</a></td>
		</tr>
	</table>
		<div>
			<a href="/mall-admin/product/productList.jsp">상품 목록</a>
		</div>
</body>
</html>