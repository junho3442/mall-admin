<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();
	category.categoryName = categoryName;

	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>