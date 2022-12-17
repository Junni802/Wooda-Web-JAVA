package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminMainProcInSvc {
	public int InsertPresent(RecommendPresent recommendPresent) {
		int result = 0;
		Connection conn = getConnection();
		AdminMainProcInDao adminMainProcInDao = AdminMainProcInDao.getInstance();
		adminMainProcInDao.setConnection(conn);
		
		result = adminMainProcInDao.InsertPresent(recommendPresent);
		if(result > 0) 	commit(conn);
		else 			rollback(conn);
		close(conn);
		
		return result;
	}
}
