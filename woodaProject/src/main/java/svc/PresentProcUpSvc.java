package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class PresentProcUpSvc {
	public int getCount(String where) {
		int count = 0;
		Connection conn = getConnection();
		PresentProcUpDao presentProcUpDao = PresentProcUpDao.getInstance();
		presentProcUpDao.setConnection(conn);
		count = presentProcUpDao.getCount(where);
		close(conn);
		return count;
	}

	public ArrayList<GiftInfo> getPresentList() {
		ArrayList<GiftInfo> giftList = new ArrayList<GiftInfo>();
		Connection conn = getConnection();
		PresentProcUpDao presentProcUpDao = PresentProcUpDao.getInstance();
		presentProcUpDao.setConnection(conn);
		
		
		giftList = presentProcUpDao.getPresentList();
		close(conn);
		
		return giftList;
	}
}
