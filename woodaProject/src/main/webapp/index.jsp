<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<%@ page import="vo.*"%>

<%
	request.setCharacterEncoding("utf-8");

	ArrayList<BorderInfo> mainList = (ArrayList<BorderInfo>) request.getAttribute("mainList");
	ArrayList<AdminImg> adminImg = (ArrayList<AdminImg>) request.getAttribute("adminImg");

	String alpha = (String) request.getAttribute("alpha");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body style="height:100%;">	
<div class="div_main_con" style="height:100%;">
<%@ include file="_inc/inc_head.jsp"%>
<%@ include file="css/main.css.jsp"%>
<%@ include file="_inc/inc_mainslide.jsp"%>


	<!-- 얘도 나중에 로그인 폼으로 보내야 함 -->
	<section class="">
		<div class="contents">
			<div class="main_01">
			<span style="font-size: 25px;">인기 여행지</span>
			<div class="hpunder" style="margin-top:30px;">
					<form name="frm" action="diary_area_list" method="get">
						<div class="hotplace">
<% for (int i = 0; i<adminImg.size(); i++) {
	AdminImg ai = adminImg.get(i);
%>
							<div id="aa<%=i+1%>">
								<button type="submit" name="bs_area" class="area" value="<%=ai.getAm_code() %>" />
								<img src="/woodaProject/img1/<%=ai.getAm_img() %>" class="area" width="170" height="170" style="opacity: 0.7;">
								<p id="a<%=i+1 %>" class="text"><%=ai.getAm_name() %></p>
								</button>
							</div>
						
<% } %>
				
				</div>
				</div>
			</div>
			</form>
		</div>
	</section>



	<div class="wrapper">
		<div class="con_test_01">
			<span style="font-size: 25px;">추천 게시물</span>
			<form name="frm1" action="diary_main_list" method="get"
				class="frm_test1">
				<button type="submit" name="alpha" value="a" onclick=""
					class="btn_test1">이달의 추천</button>
				<button type="submit" name="alpha" value="b" onclick=""
					class="btn_test1">가장 최근 글</button>
				<button typr="submit" name="alpha" value="c" onclick=""
					class="btn_test1">조회수 높은 글</button>
				<button type="submit" name="alpha" value="d" onclick=""
					class="btn_test1">좋아요 많은 글</button>
				<!-- ajax사용할 예정 -->
			</form>
		</div>
	</div>

	<div class="sel_con_main">
		<div class="sel_con_sub">
			<table width="800px" id="lo">

				<%
				if (mainList != null && mainList.size() != 0) {
					for (int i = 0; i < mainList.size(); i++) {
						BorderInfo bl = mainList.get(i);
						String title = bl.getBs_title();
						String img1 = bl.getBs_img1();
						if (title.length() > 30)	title = title.substring(0, 27) + "...";
						title = "<a href='diary_write_view?idx=" + bl.getBs_num() +  "'>" + title + "</a>";
						img1 = "<a href='diary_write_view?idx=" + bl.getBs_num() + "'>" + img1 + "</a>";
				%>
				<th></th>
				<th></th>
				<th></th>
				<tr align="center">
					<td width="90px" rowspan="2">
						<%
							if (bl.getBs_img1().equals("")) {
						%> <img id="img1" src="img\trival.jpg" /> <%
					 	} else {
					 %> <img id="img1" src="img\<%=bl.getBs_img1()%>" /> <%
					 	}
					 %>
										</td>
										<td><%=title %></td>
										<td><%=bl.getBs_place1()%> <%
					 	if (bl.getBs_place2() != null && !bl.getBs_place2().equals("")) {
					 %> -> <%=bl.getBs_place2()%> <%
					 	}
					 %> <%
					 	if (bl.getBs_place3() != null && !bl.getBs_place3().equals("")) {
					 %> -> <%=bl.getBs_place3()%> <%
					 	}
					 %>
					 </td>
				</tr>

				<%
					}
					}
				%>

			</table>
		</div>
	</div>
	<div class="main_footer">
	<div class="logo"><a href="/woodaProject/diary_main_list"><img src="img/woodalogo1.png" width="200" /></a></div>
		<p>
			회사명 : 그린컴퓨터503 | 대표이사 : 조삼삼 | 사업자번호 : 333-13-32133 | 메일 : jo333@samjo.com | 주소 : 서울시 강남구 역삼동 815-4 만이빌딩 5층, 10층 |<br>
			고객센터 : 금세인	[seins2doyou@gmail.com] 김성길 [gggills4235@gmail.com] 박세영[seyoung054@gmail.com] 박준혁 [junni802@naver.com] 최권우[mkp9928@gmail.com]
		</p>
	</div>
	</div>
</body>

</html>
