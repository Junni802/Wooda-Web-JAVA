package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class AdminPresentDeleteDao {
	private static AdminPresentDeleteDao adminPresentDeleteDao;
	private Connection conn;
	private AdminPresentDeleteDao() {}

	public static AdminPresentDeleteDao getInstance() {
		if (adminPresentDeleteDao == null)	adminPresentDeleteDao = new AdminPresentDeleteDao();
		return adminPresentDeleteDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public int delete(int ag_num) {
		int result = 0;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "delete from t_admin_gift where ag_num = " + ag_num;
			result = stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("AdminPresentDeleteDao 클래스의 delete() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

}
