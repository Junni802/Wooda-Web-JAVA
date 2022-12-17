package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

@WebServlet("/present_delete")
public class AdminPresentDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminPresentDeleteCtrl() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int ag_num = Integer.parseInt(request.getParameter("ag_num"));
		
		AdminPresentDeleteSvc adminPresentDeleteSvc = new AdminPresentDeleteSvc();
		int result = adminPresentDeleteSvc.delete(ag_num);
		
		if (result > 0) {	// 정상적으로 글이 등록되었으면
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('성공적으로 삭제되었습니다.');");
			out.println("location.href='admin_request_present';");
			out.println("</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제중 오류가 발생하였습니다 다시 시도해주세요.');");
			out.println("location.href='admin_request_present';");
			out.println("</script>");
			out.close();
		}
	}
}
