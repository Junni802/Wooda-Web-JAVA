package ctrl;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/present_update")
public class PresentProcUpCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PresentProcUpCtrl() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<GiftInfo> giftList = new ArrayList<GiftInfo>();
		int ag_num = Integer.parseInt(request.getParameter("ag_num"));
		int ag_num1 = Integer.parseInt(request.getParameter("ag_num1"));
		int ag_num2 = Integer.parseInt(request.getParameter("ag_num2"));
		int ag_num3 = Integer.parseInt(request.getParameter("ag_num3"));
		int ag_num4 = Integer.parseInt(request.getParameter("ag_num4"));
		String ag_name = request.getParameter("ag_name");
		String where = " where gi_num = '" + ag_num1 + "' or gi_num = '" + ag_num2 + "' or gi_num = '" + ag_num3 + "' or gi_num = '" + ag_num4 + "' ";
		PresentProcUpSvc  presentProcUpSvc = new PresentProcUpSvc();
		int count = presentProcUpSvc.getCount(where);
		
		giftList = presentProcUpSvc.getPresentList();
		
		request.setAttribute("ag_num", ag_num);
		request.setAttribute("ag_num1", ag_num1);
		request.setAttribute("ag_num2", ag_num2);
		request.setAttribute("ag_num3", ag_num3);
		request.setAttribute("ag_num4", ag_num4);
		request.setAttribute("ag_name", ag_name);
		request.setAttribute("count", count);
		request.setAttribute("giftList", giftList);
		
		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("/update_present.jsp");
		dispatcher.forward(request, response);
	}

}
