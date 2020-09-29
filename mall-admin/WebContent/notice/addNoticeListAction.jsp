<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %> 
<%
	request.setCharacterEncoding("utf-8");
	Notice notice = new Notice();
	notice.setNoticeTitle(request.getParameter("noticeTitle"));
	notice.setNoticeContent(request.getParameter("noticeContent"));
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>