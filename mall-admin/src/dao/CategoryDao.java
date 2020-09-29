package dao;
import java.util.ArrayList;
import commons.*;
import vo.Category;
import java.sql.*;
public class CategoryDao {
	//카테고리 추가하는 메서드
	public void insertCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into category(category_name) value(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.categoryName);
	
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		
		String dbaddr = "jdbc:mariadb://localhost:3306/mall";
		String dbid = "root";
		String dbpw = "java1004";
		String sql = "select category_id, category_name from category";
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs= stmt.executeQuery();
		                                                                                                                           
		while(rs.next()) {
			Category category = new Category();
			category.categoryId = rs.getInt("category_id");
			category.categoryName = rs.getString("category_name");
			list.add(category);
		}
		conn.close();
		
		return list;
	}
}
