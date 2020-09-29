<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import ="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Product product = new Product();
	

	
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductId(productId);
	
	System.out.println(product.getProductName());
	System.out.println(product.getProductPrice());
	System.out.println(product.getProductContent());
	System.out.println(product.getProductId());
	
	ProductDao productDao = new ProductDao();
	productDao.productUpdateOne(product);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
	
%>