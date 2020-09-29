<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	//상품아이디와 이미지를 받아와 이미지를 서버img폴더에 새로운 이름으로 저장
	//저장된 이미지의 이름을 상품 테이블에서 수정한다.
	
	/*
	String productId = request.getParameter("productId");
	String productPic = request.getParameter("productPic");
	System.out.println(productId);
	*/
	int size = 1024*1024*100; // 파일 크기
	String path = application.getRealPath("img"); // 파일 경로(실제 경로)
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy()); // 간접적으로 사용 
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId+"<<productId");
	System.out.println(multi.getOriginalFileName("productPic")+"<원본파일이름");
	System.out.println(multi.getFilesystemName("productPic")+"<새로 생성된 파일이름"); 
	 
	
	String productPic = multi.getFilesystemName("productPic");
	
	Product product = new Product();
	ProductDao productDao = new ProductDao();
	
	product.productId = productId;
	product.productPic = productPic;
	
	//update product set product_pic=? where product_id=?
	productDao.productUpdatePic(productId,productPic);
	
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+product.productId);
	
%>