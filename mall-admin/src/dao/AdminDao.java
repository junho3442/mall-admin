package dao;
import java.sql.*;
import vo.*;

public class AdminDao {
	public Admin login(Admin admin) throws Exception{
		Admin returnAdmin = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		
		String sql = "select admin_id from admin where admin_id=? and admin_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getString("admin_id"));
		}
		return admin; // 값이 null이면 로그인 실패
	}
}
