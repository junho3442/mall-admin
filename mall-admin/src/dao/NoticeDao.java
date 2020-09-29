package dao;
import vo.*;
import commons.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
public class NoticeDao {
	public void deleteNotice(int noticeId)throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from notice where notice_id=?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeId);
		stmt.executeUpdate();
	}
	public void insertNotice(Notice notice)throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.noticeTitle);
		stmt.setString(2, notice.noticeContent);
		System.out.println(stmt+"<<--stmt");
		stmt.executeUpdate();
		conn.close();
	}
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select*from notice order by notice_date desc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.noticeId = rs.getInt("notice_id");
			n.noticeTitle = rs.getNString("notice_title");
			n.noticeContent = rs.getString("notice_content");
			n.noticeDate = rs.getNString("notice_date");
			list.add(n);
		}
		conn.close();
		return list;
	}
}
