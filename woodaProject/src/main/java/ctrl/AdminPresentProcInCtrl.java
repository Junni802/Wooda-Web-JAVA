package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

@WebServlet("/add_present")
public class AdminPresentProcInCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPresentProcInCtrl() { super(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<GiftInfo> giftList = new ArrayList<GiftInfo>();
		
		AdminPresentProcInSvc adminPresentProcInSvc = new AdminPresentProcInSvc();
		giftList = adminPresentProcInSvc.getPresentList();
		
		request.setAttribute("giftList", giftList);

		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("/add_present.jsp");
		dispatcher.forward(request, response);
	}

}
