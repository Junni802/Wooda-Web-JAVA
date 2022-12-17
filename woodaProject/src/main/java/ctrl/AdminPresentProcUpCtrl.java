package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

@WebServlet("/present_up")
public class AdminPresentProcUpCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPresentProcUpCtrl() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] choose = request.getParameterValues("choose");
		String ag_name = request.getParameter("ag_name");
		String num1 = "";
		String num2 = "";
		String num3 = "";
		String num4 = "";
		if(choose.length == 4) {
			num1 = choose[0];
			num2 = choose[1];
			num3 = choose[2];
			num4 = choose[3];
		}else if(choose.length == 3) {
			num1 = choose[0];
			num2 = choose[1];
			num3 = choose[2];
		}else if(choose.length == 2) {
			num1 = choose[0];
			num2 = choose[1];
		}else if(choose.length == 1) {
			num1 = choose[0];
		}
		
		String[] info1 = num1.split(",");
		String[] info2 = num2.split(",");
		String[] info3 = num3.split(",");
		String[] info4 = num4.split(",");
		
		RecommendPresent recommendPresent = new RecommendPresent();
		
		
		
		
		if(info4.length > 1) {
			recommendPresent.setAg_name(ag_name);
			recommendPresent.setAg_num1(Integer.parseInt(info1[0]));
			recommendPresent.setGi_img1(info1[1]);
			recommendPresent.setGi_brand1(info1[2]);
			recommendPresent.setGi_name1(info1[3]);
			recommendPresent.setGi_price1(Integer.parseInt(info1[4]));
			recommendPresent.setAg_num(Integer.parseInt(info1[5]));
			recommendPresent.setAg_num2(Integer.parseInt(info2[0]));
			recommendPresent.setGi_img2(info2[1]);
			recommendPresent.setGi_brand2(info2[2]);
			recommendPresent.setGi_name2(info2[3]);
			recommendPresent.setGi_price2(Integer.parseInt(info2[4]));
			recommendPresent.setAg_num3(Integer.parseInt(info3[0]));
			recommendPresent.setGi_img3(info3[1]);
			recommendPresent.setGi_brand3(info3[2]);
			recommendPresent.setGi_name3(info3[3]);
			recommendPresent.setGi_price3(Integer.parseInt(info3[4]));
			recommendPresent.setAg_num4(Integer.parseInt(info4[0]));
			recommendPresent.setGi_img4(info4[1]);
			recommendPresent.setGi_brand4(info4[2]);
			recommendPresent.setGi_name4(info4[3]);
			recommendPresent.setGi_price4(Integer.parseInt(info4[4]));
		}else if(info3.length > 1) {
			recommendPresent.setAg_name(ag_name);
			recommendPresent.setAg_num1(Integer.parseInt(info1[0]));
			recommendPresent.setGi_img1(info1[1]);
			recommendPresent.setGi_brand1(info1[2]);
			recommendPresent.setGi_name1(info1[3]);
			recommendPresent.setGi_price1(Integer.parseInt(info1[4]));
			recommendPresent.setAg_num(Integer.parseInt(info1[5]));
			recommendPresent.setAg_num2(Integer.parseInt(info2[0]));
			recommendPresent.setGi_img2(info2[1]);
			recommendPresent.setGi_brand2(info2[2]);
			recommendPresent.setGi_name2(info2[3]);
			recommendPresent.setGi_price2(Integer.parseInt(info2[4]));
			recommendPresent.setAg_num3(Integer.parseInt(info3[0]));
			recommendPresent.setGi_img3(info3[1]);
			recommendPresent.setGi_brand3(info3[2]);
			recommendPresent.setGi_name3(info3[3]);
			recommendPresent.setGi_price3(Integer.parseInt(info3[4]));
		}else if(info2.length > 1) {
			recommendPresent.setAg_name(ag_name);
			recommendPresent.setAg_num1(Integer.parseInt(info1[0]));
			recommendPresent.setGi_img1(info1[1]);
			recommendPresent.setGi_brand1(info1[2]);
			recommendPresent.setGi_name1(info1[3]);
			recommendPresent.setGi_price1(Integer.parseInt(info1[4]));
			recommendPresent.setAg_num(Integer.parseInt(info1[5]));
			recommendPresent.setAg_num2(Integer.parseInt(info2[0]));
			recommendPresent.setGi_img2(info2[1]);
			recommendPresent.setGi_brand2(info2[2]);
			recommendPresent.setGi_name2(info2[3]);
			recommendPresent.setGi_price2(Integer.parseInt(info2[4]));
		}else if(info1.length > 1) {
			recommendPresent.setAg_name(ag_name);
			recommendPresent.setAg_num1(Integer.parseInt(info1[0]));
			recommendPresent.setGi_img1(info1[1]);
			recommendPresent.setGi_brand1(info1[2]);
			recommendPresent.setGi_name1(info1[3]);
			recommendPresent.setGi_price1(Integer.parseInt(info1[4]));
			recommendPresent.setAg_num(Integer.parseInt(info1[5]));
		}
		
		int result = 0;
		
		AdminPresentProcUpSvc adminPresentProcUpSvc = new AdminPresentProcUpSvc();
		
		result = adminPresentProcUpSvc.InsertPresent(recommendPresent);
		
		if (result > 0) {	// 정상적으로 글이 등록되었으면
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='/woodaProject/admin_request_present'");
			out.println("</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된정보입니다 다음에 다시 이용해주세요.');");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
		

	}
}
