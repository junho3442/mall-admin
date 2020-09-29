<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String adminId = request.getParameter("adminId"); 
	// login에서 adminId를 받는다.
	String adminPw = request.getParameter("adminPw");
	
	Admin paramAdmin = new Admin(); // vo 객체 생성 
	
	paramAdmin.setAdminId(adminId);
	paramAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	
	Admin loginAdmin = adminDao.login(paramAdmin);
	
	if(loginAdmin == null){
		System.out.println("로그인실패");
		
	}else{
	System.out.println("로그인 성공");
	//로그인 정보를 세션에 저장(page < request < session < application)
		session.setAttribute("loginAdminId",loginAdmin.getAdminId()); // 세션 변수 만드는 방법
		//로그인에 성공하면 
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>