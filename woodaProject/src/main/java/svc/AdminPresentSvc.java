package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;


public class AdminPresentSvc {
	public ArrayList<RecommendPresent> getPresentList(String where){
		ArrayList<RecommendPresent> presentList = new ArrayList<RecommendPresent>();
		Connection conn = getConnection();
		AdminPresentDao adminPresentDao = AdminPresentDao.getInstance();
		adminPresentDao.setConnection(conn);
		presentList = adminPresentDao.getPresentList(where);
		close(conn);
		
		return presentList;
	}
}
