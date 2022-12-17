package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class AdminPresentProcInDao {
	private static AdminPresentProcInDao adminPresentProcInDao;
	private Connection conn;
	private AdminPresentProcInDao() {}

	public static AdminPresentProcInDao getInstance() {
		if (adminPresentProcInDao == null)	adminPresentProcInDao = new AdminPresentProcInDao();
		return adminPresentProcInDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<GiftInfo> getPresentList(){
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<GiftInfo> giftList = new ArrayList<GiftInfo>();
		GiftInfo gi = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from t_gift_info";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				gi = new GiftInfo();
				gi.setGi_num(rs.getInt("gi_num"));
				gi.setGi_img1(rs.getString("gi_img1"));
				gi.setGi_brand(rs.getString("gi_brand"));
				gi.setGi_name(rs.getString("gi_name"));
				gi.setGi_price(rs.getInt("gi_price"));
				giftList.add(gi);
			}
		}catch(Exception e) {
			System.out.println("AdminPresentProcInDao 클래스의 getPresentList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return giftList;
	}
}
