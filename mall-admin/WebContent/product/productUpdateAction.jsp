<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import ="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Product product = new Product();
	

	
	product.productName = request.getParameter("productName");
	product.productPrice = Integer.parseInt(request.getParameter("productPrice"));
	product.productContent = request.getParameter("productContent");
	product.productId = Integer.parseInt(request.getParameter("productId"));
	
	System.out.println(product.productName);
	System.out.println(product.productPrice);
	System.out.println(product.productContent);
	System.out.println(product.productId);
	
	ProductDao productDao = new ProductDao();
	productDao.productUpdateOne(product);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+product.productId);
	
%>