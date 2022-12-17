package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPresentProcUpSvc {
	public int InsertPresent(RecommendPresent recommendPresent) {
		int result = 0;
		Connection conn = getConnection();
		AdminPresentProcUpDao adminPresentProcUpDao = AdminPresentProcUpDao.getInstance();
		adminPresentProcUpDao.setConnection(conn);
		
		result = adminPresentProcUpDao.InsertPresent(recommendPresent);
		if(result > 0) 	commit(conn);
		else 			rollback(conn);
		close(conn);
		
		return result;
	}
}
