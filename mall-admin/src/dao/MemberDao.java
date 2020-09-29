package dao;
import vo.*;
import java.util.*;
import commons.*;
import java.sql.*;
public class MemberDao {
	public void deleteMemberList(String memberEmail) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, memberEmail);
		stmt.executeUpdate();
		System.out.println(stmt+"<<stmt");
		
	}
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select*from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member m = new Member();
			m.setMemberEmail(rs.getNString("member_email"));
			m.setMemberPw(rs.getNString("member_pw"));
			m.setMemberName(rs.getNString("member_name"));
			m.setMemberDate(rs.getNString("member_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
}
