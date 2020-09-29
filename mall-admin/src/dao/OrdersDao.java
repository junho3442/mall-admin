package dao;
import java.util.*;
import vo.*;
import java.sql.*;
public class OrdersDao {
	public ArrayList<String> selectOrdersStateList() throws Exception{
		//ordersState를 받아오는 리스트
		
		ArrayList<String> list = new ArrayList<String>();
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "SELECT distinct orders_state FROM orders;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			list.add(rs.getString("orders_state"));
		}
		conn.close();
		return list;
	}
			//			<vo클래스이름>
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		//orders리스트를 다 받아온다
		
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "select o.orders_id, o.product_id, p.product_name, o.orders_price, o.orders_amount, o.member_email, o.orders_addr, o.orders_state, o.orders_date from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oa = new OrdersAndProduct();
			oa.orders = new Orders();
			oa.product = new Product();
			oa.orders.ordersId = rs.getInt("o.orders_id");
			oa.orders.productId = rs.getInt("o.product_id");
			oa.product.productName = rs.getString("p.product_name");
			oa.orders.ordersPrice = rs.getInt("o.orders_price");
			oa.orders.ordersAmount = rs.getInt("o.orders_amount");
			oa.orders.memberEmail = rs.getString("o.member_email");
			oa.orders.ordersAddr = rs.getString("o.orders_addr");
			oa.orders.ordersState = rs.getString("o.orders_state");
			oa.orders.ordersDate = rs.getString("o.orders_date");
			list.add(oa);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Orders> selectOrdersListByState(String ordersState) throws Exception{
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "select*from orders where orders_state=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setNString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Orders o = new Orders();
			o.ordersId = rs.getInt("orders_id");
			o.productId = rs.getInt("product_id");
			o.ordersPrice = rs.getInt("orders_price");
			o.ordersAmount = rs.getInt("orders_amount");
			o.memberEmail = rs.getString("member_email");
			o.ordersAddr = rs.getString("orders_addr");
			o.ordersState = ordersState;
			o.ordersDate = rs.getString("orders_date");
			list.add(o);
		}
		conn.close();
		return list;
	}
	
	public void updateOrdersState(Orders orders) throws Exception{
	
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "update orders set orders_state=? where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
	}
	public Orders slectOrdersOne(int ordersId) throws Exception {
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "select orders_id, orders_state from orders where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordersId);
		ResultSet rs = stmt.executeQuery();
		return null;
	}
}
