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
		conn.close();
	}
	public void insertNotice(Notice notice)throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
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
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getNString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getNString("notice_date"));
			list.add(n);
		}
		conn.close();
		return list;
	}
}
