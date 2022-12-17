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
		
		if (result > 0) {	// ���������� ���� ��ϵǾ�����
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���������� �����Ǿ����ϴ�.');");
			out.println("location.href='admin_request_present';");
			out.println("</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('������ ������ �߻��Ͽ����ϴ� �ٽ� �õ����ּ���.');");
			out.println("location.href='admin_request_present';");
			out.println("</script>");
			out.close();
		}
	}
}
