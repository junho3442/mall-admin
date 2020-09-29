<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
	
	String sql ="delete from product where product_id = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	System.out.println(stmt+"<<<<stmt");
	stmt.setInt(1, productId);
	stmt.executeUpdate();
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>