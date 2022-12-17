package ctrl;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/present_form")
public class PresentListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PresentListCtrl() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		ArrayList<RecommendPresent> presentList = new ArrayList<RecommendPresent>();
		
		String where = "";
		if(keyword != null && !keyword.equals("")) {
		where =  "where ag_name like '%" + keyword + "%' ";
		}
		PresentListSvc presentListSvc = new PresentListSvc();
		presentList = presentListSvc.getPresentList(where);
		
		request.setAttribute("presentList", presentList);

		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("present_form.jsp");
		dispatcher.forward(request, response);
	}

}
