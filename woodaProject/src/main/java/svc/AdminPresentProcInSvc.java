package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPresentProcInSvc {
	public ArrayList<GiftInfo> getPresentList(){
		ArrayList<GiftInfo> giftList = new ArrayList<GiftInfo>();
		Connection conn = getConnection();
		AdminPresentProcInDao adminPresentProcInDao = AdminPresentProcInDao.getInstance();
		adminPresentProcInDao.setConnection(conn);
		
		
		giftList = adminPresentProcInDao.getPresentList();
		close(conn);
		
		return giftList;
	}
}
