package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class AdminMainProcInDao {
	private static AdminMainProcInDao adminMainProcInDao;
	private Connection conn;
	private AdminMainProcInDao() {}

	public static AdminMainProcInDao getInstance() {
		if (adminMainProcInDao == null)	adminMainProcInDao = new AdminMainProcInDao();
		return adminMainProcInDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public int InsertPresent(RecommendPresent recommendPresent){
		int result = 0;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "insert into t_admin_gift(ag_name, ag_num1, gi_img1, gi_brand1, gi_name1, gi_price1, ag_num2, gi_img2, gi_brand2, gi_name2, gi_price2, ag_num3, gi_img3, gi_brand3, gi_name3, gi_price3, ag_num4, gi_img4, gi_brand4, gi_name4, gi_price4) " + 
					" values('" + recommendPresent.getAg_name() + "', '" + 
					recommendPresent.getAg_num1()+ "', '" + recommendPresent.getGi_img1() + "', '" + recommendPresent.getGi_brand1() + "', '" + recommendPresent.getGi_name1() + "', '" + recommendPresent.getGi_price1() + "', '" + 
					recommendPresent.getAg_num2()+ "', '" + recommendPresent.getGi_img2() + "', '" + recommendPresent.getGi_brand2() + "', '" + recommendPresent.getGi_name2() + "', '" + recommendPresent.getGi_price2() + "', '" + 
					recommendPresent.getAg_num3()+ "', '" + recommendPresent.getGi_img3() + "', '" + recommendPresent.getGi_brand3() + "', '" + recommendPresent.getGi_name3() + "', '" + recommendPresent.getGi_price3() + "', '" + 
					recommendPresent.getAg_num4()+ "', '" + recommendPresent.getGi_img4() + "', '" + recommendPresent.getGi_brand4() + "', '" + recommendPresent.getGi_name4() + "', '" + recommendPresent.getGi_price4() + "') ";
			result = stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("AdminMainProcInDao 클래스의 InsertPresent() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
}
