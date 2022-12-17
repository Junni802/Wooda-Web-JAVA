package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class PresentListDao {
	private static PresentListDao presentListDao;
	private Connection conn;
	private PresentListDao() {}

	public static PresentListDao getInstance() {
		if (presentListDao == null)	presentListDao = new PresentListDao();
		return presentListDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<RecommendPresent> getPresentList(String where){
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<RecommendPresent> presentList = new ArrayList<RecommendPresent>();
		RecommendPresent rp = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select * from t_admin_gift " + where;
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rp = new RecommendPresent();
				rp.setAg_num(rs.getInt("ag_num"));
				rp.setAg_name(rs.getString("ag_name"));
				rp.setGi_img1(rs.getString("gi_img1"));
				rp.setGi_brand1(rs.getString("gi_brand1"));
				rp.setGi_name1(rs.getString("gi_name1"));
				rp.setGi_price1(rs.getInt("gi_price1"));
				rp.setAg_num1(rs.getInt("ag_num1"));
				rp.setGi_img2(rs.getString("gi_img2"));
				rp.setGi_brand2(rs.getString("gi_brand2"));
				rp.setGi_name2(rs.getString("gi_name2"));
				rp.setGi_price2(rs.getInt("gi_price2"));
				rp.setAg_num2(rs.getInt("ag_num2"));
				rp.setGi_img3(rs.getString("gi_img3"));
				rp.setGi_brand3(rs.getString("gi_brand3"));
				rp.setGi_name3(rs.getString("gi_name3"));
				rp.setGi_price3(rs.getInt("gi_price3"));
				rp.setAg_num3(rs.getInt("ag_num3"));
				rp.setGi_img4(rs.getString("gi_img4"));
				rp.setGi_brand4(rs.getString("gi_brand4"));
				rp.setGi_name4(rs.getString("gi_name4"));
				rp.setGi_price4(rs.getInt("gi_price4"));
				rp.setAg_num4(rs.getInt("ag_num4"));
				presentList.add(rp);
			}
		}catch(Exception e) {
			System.out.println("BoderListDao 클래스의 getBoderList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return presentList;
	}
}
