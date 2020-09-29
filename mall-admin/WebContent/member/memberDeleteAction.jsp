<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMemberList(memberEmail);
	
	response.sendRedirect("/mall-admin/member/memberList.jsp");
%>