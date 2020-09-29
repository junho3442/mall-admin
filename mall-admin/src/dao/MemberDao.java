package dao;
import vo.*;
import java.util.*;
import commons.*;
import java.sql.*;
public class MemberDao {
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select*from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member m = new Member();
			m.memberEmail = rs.getNString("member_email");
			m.memberPw = rs.getNString("member_pw");
			m.memberName = rs.getNString("member_name");
			m.memberDate = rs.getNString("member_date");
			list.add(m);
		}
		conn.close();
		return list;
	}
}
