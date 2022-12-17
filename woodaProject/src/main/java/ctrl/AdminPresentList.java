package ctrl;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/admin_request_present")
public class AdminPresentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminPresentList() { super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		ArrayList<RecommendPresent> presentList = new ArrayList<RecommendPresent>();
		
		String where = "";
		if(keyword != null && !keyword.equals("")) {
		where =  "where ag_name like '%" + keyword + "%' ";
		}
		AdminPresentSvc adminPresentSvc = new AdminPresentSvc();
		presentList = adminPresentSvc.getPresentList(where);
		
		request.setAttribute("presentList", presentList);

		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("admin_request_parent.jsp");
		dispatcher.forward(request, response);
	}

}
