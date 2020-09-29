<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dao.*"%>
<%@ page import ="vo.*"%>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));

	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(noticeId);
	
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>