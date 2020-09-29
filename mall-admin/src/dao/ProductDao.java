package dao;
import java.util.*;
import commons.*;
import vo.*;
import java.sql.*;
public class ProductDao {
	public void productUpdateOne(Product product)throws Exception{
	
		 
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_name=?,product_price=?,product_content=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductName());
		stmt.setInt(2, product.getProductPrice());
		stmt.setString(3, product.getProductContent());
		stmt.setInt(4, product.getProductId());
		System.out.println(stmt+"------stmt");
		stmt.executeQuery();
		conn.close();
		
	}
	public void productUpdatePic(int productId, String productPic)throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set product_pic=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, productPic);
		stmt.setInt(2, productId);
		stmt.executeUpdate();
	}
	public void updateProductSoldout(int productId, String productSoldout) throws Exception {
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set product_soldout=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1,"N");
		}else {
			stmt.setString(1,"Y");
		}
		stmt.setInt(2, productId);
		stmt.executeUpdate();
	}
	public Product selectProductOne(int productId) throws Exception{
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select * from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
		}
		return product;
	}
	public void insertProduct(Product product) throws Exception {
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) value(?,?,?,?,?)";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeQuery();
		
	}
	
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout from product where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product(); // 객체 리스트 생성
			p.setProductId(rs.getInt("product_id")); // p.(vo변수명) = rs.getInt(""); 
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			
			list.add(p);
		}
		conn.close();
		return list;
	}
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product(); // 객체 리스트 생성
			p.setProductId(rs.getInt("product_id")); // p.(vo변수명) = rs.getInt(""); 
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			
			list.add(p);
		}
		conn.close();
		return list;
	}
}
