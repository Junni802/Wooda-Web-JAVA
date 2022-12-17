package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class PresentListSvc {
	public ArrayList<RecommendPresent> getPresentList(String where){
		ArrayList<RecommendPresent> presentList = new ArrayList<RecommendPresent>();
		Connection conn = getConnection();
		PresentListDao presentListDao = PresentListDao.getInstance();
		presentListDao.setConnection(conn);
		presentList = presentListDao.getPresentList(where);
		close(conn);
		
		return presentList;
	}
}
