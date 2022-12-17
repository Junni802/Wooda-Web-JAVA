package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPresentDeleteSvc {
	public int delete(int ag_num) {
		int result = 0;
		Connection conn = getConnection();
		AdminPresentDeleteDao adminPresentDeleteDao = AdminPresentDeleteDao.getInstance();
		adminPresentDeleteDao.setConnection(conn);
		
		result = adminPresentDeleteDao.delete(ag_num);
		if(result > 0) 	commit(conn);
		else 			rollback(conn);
		close(conn);
		
		return result;
	}

}
