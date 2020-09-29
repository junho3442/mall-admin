<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	request.setCharacterEncoding("utf-8");
	String ordersState = "";
	if(request.getParameter("ordersState")!=null){
		ordersState = request.getParameter("ordersState");
	}
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> list = null;
	if(ordersState.equals("")){
		list = ordersDao.selectOrdersList();
	}else{
		//list = ordersDao.selectOrdersListByState(ordersState);
	}
	ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();
	
%>
	<h1>주문 목록</h1>
		<div>
			<%
				for(String s : ordersStateList){
			%>		
					<a href="/mall-admin/orders/ordersList.jsp?ordersState=<%=ordersState%>"><%=s %></a>
			<% 	
				}
			%>
		</div>
		
		
	
	<table class="table">
		<thead>
			<tr>
				<td>orders_id</td>
				<td>product_id</td>
				<td>product_name</td>
				<td>orders_price</td>
				<td>orders_amount</td>
				<td>memver_email</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
				<td>orders_state 수정</td>
			</tr>
		</thead>
		<tbody>
			
		<% 
				for(OrdersAndProduct oa :list){
		%>
				<tr>
					<td><%=oa.orders.getOrdersId() %></td>
					<td><%=oa.orders.getProductId() %></td>
					<td><%=oa.product.getProductName() %></td>
					<td><%=oa.orders.getOrdersPrice() %></td>
					<td><%=oa.orders.getOrdersAmount() %></td>
					<td><%=oa.orders.getMemberEmail() %></td>
					<td><%=oa.orders.getOrdersAddr() %></td>
					<td><%=oa.orders.getOrdersState() %></td>
					<td><%=oa.orders.getOrdersDate() %></td>
					<td><a href="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=oa.orders.getOrdersId()%>">orders_state 수정</a>
					</td>
				</tr>
		<% 
				}
		%>	
		
		</tbody>
	</table>
</body>
</html>