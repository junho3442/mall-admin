<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		// session.getAttribute("loginAdminId") 세션에 만들어진 id
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link class="bg-dark text-white" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-secondary text-white">

<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>관리자 메인 페이지</h1>
	<p><%=session.getAttribute("loginAdminId") %>님 반갑습니다.</p>
	<table class = "table table">
		<tr class="table-light">
			<td><a href="/mall-admin/product/productList.jsp" class="btn btn-secondary" role="button">상품 관리</a></td>
			<td>(상품을 분류별 및 추가를 할수있는 페이지(productList.jsp)로 이동합니다.)</td>
		</tr>
	</table>
	<img src="./img/2.jpg" class="rounded-circle">
</div>

</body>
</html>