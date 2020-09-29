<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int categoryId = Integer.parseInt(request.getParameter("c.categoryId"));
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
	
	String sql = "delete from category where category_id = ? ";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setInt(1, categoryId);
	stmt.executeUpdate();
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>