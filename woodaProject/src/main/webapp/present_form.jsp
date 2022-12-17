<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="_inc/inc_head.jsp"%>
<%
request.setCharacterEncoding("utf-8");
ArrayList<RecommendPresent> presentList = (ArrayList<RecommendPresent>)request.getAttribute("presentList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  border-bottom:1px solid black;
}

.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top:50px
}
.text {
  width:500px;
  font-size:20px;
}
button{
  height:30px;
}
</style>
<script>
var popupWidth = 1000;
var popupHeight = 700;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

function showPopup()
{
	$.ajax({
		type : "POST",
		url : "/woodaProject/present_login_check",
		data : {},
		success : function(chkRs){
			if(chkRs > 0){
				window.name = "requestPrasent";
				openWin = window.open('request_parent.jsp', 'childForm', 'status=no, height=600, width=800, left='+ popupX + ', top='+ popupY);
			}else if(chkRs == 0){
				alert("로그인후 이용하시기 바랍니다.");
				window.location.reload();
			}else{
				alert("댓글 등록 실패!^0-");
				window.location.reload();
			}
		}
	});
	
}
</script>
</head>
<body>
<form name="frm" action="present_form" method="get">
<p class="wrapper">
<input type="text" name="keyword" class="text" value="" />
<button type="submit" value="검색하기">검색하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
</form>
</p>
<p class="wrapper">
<button onclick="showPopup();" >상품등록 요청</button>
</p>
<% for(int i=0; i<presentList.size(); i++){ 
	RecommendPresent bp = presentList.get(i);
	
%>
<div class="wrapper">
<table width="800px" class="">
<caption class="cap"><%=bp.getAg_name() %></caption>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img1() %>" /></div>
<div><%=bp.getGi_brand1() %></div>
<div><%=bp.getGi_name1() %></div>
<br />
<div><%=bp.getGi_price1() %>원</div>
</td>
<% if(bp.getAg_num2() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img2() %>" /></div>
<div><%=bp.getGi_brand2() %></div>
<div><%=bp.getGi_name2() %></div>
<br />
<div><%=bp.getGi_price2() %>원</div>
</td>
<% } %>
<% if(bp.getAg_num3() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img3() %>" /></div>
<div><%=bp.getGi_brand3() %></div>
<div><%=bp.getGi_name3() %></div>
<br />
<div><%=bp.getGi_price3() %>원</div>
</td>
<% } %>
<% if(bp.getAg_num4() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img4() %>" /></div>
<div><%=bp.getGi_brand4() %></div>
<div><%=bp.getGi_name4() %></div>
<br />
<div><%=bp.getGi_price4() %>원</div>
</td>
<% } %>
</table>
</div>
<% } %>
</body>
</html>