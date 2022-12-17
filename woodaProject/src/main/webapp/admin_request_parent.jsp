<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../_inc/inc_side.jsp" %>
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
#sb {
width:500px;
height:30px
}
.wrapper{
    background-color: var(--color-black);
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
<script>
var popupWidth = 1000;
var popupHeight = 700;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

function plus()
{ 
	window.name = 1;
	openWin = window.open('/woodaProject/add_present', 'childForm', 'status=no, height=700, width=1000, left='+ popupX + ', top='+ popupY);
}


</script>
</head>
<body>
<div class="wrapper">
<% for(int i=0; i<presentList.size(); i++){ 
	RecommendPresent bp = presentList.get(i);
%>
<div class="wrapper">
<form name="frm" action="present_update" method="get">
<input type="hidden" name="ag_num" value="<%=bp.getAg_num() %>" />
<input type="hidden" name="ag_num1" value="<%=bp.getAg_num1() %>" />
<input type="hidden" name="ag_num2" value="<%=bp.getAg_num2() %>" />
<input type="hidden" name="ag_num3" value="<%=bp.getAg_num3() %>" />
<input type="hidden" name="ag_num4" value="<%=bp.getAg_num4() %>" />
<input type="hidden" name="ag_name" value="<%=bp.getAg_name() %>" />
<button name="update" onclick="update();">수정</button>
</form>
<form name="frmdelete" action="present_delete" method="get">
<input type="hidden" name="ag_num" value="<%=bp.getAg_num() %>" />
<button type="submit" name="delete">삭제</button>
</form>
<table width="800px" class="">
<caption class="cap"><%=bp.getAg_name() %></caption>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img1() %>" /></div>
<div><%=bp.getGi_brand1() %></div>
<div><%=bp.getGi_name1() %></div>
<br />
<div><%=bp.getGi_price1() %></div>
</td>
<% if(bp.getAg_num2() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img2() %>" /></div>
<div><%=bp.getGi_brand2() %></div>
<div><%=bp.getGi_name2() %></div>
<br />
<div><%=bp.getGi_price2() %> </div>
</td>
<% } %>
<% if(bp.getAg_num3() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img3() %>" /></div>
<div><%=bp.getGi_brand3() %></div>
<div><%=bp.getGi_name3() %></div>
<br />
<div><%=bp.getGi_price3() %></div>
</td>
<% } %>
<% if(bp.getAg_num4() > 0) { %>
<td align="center">
<div><img width="70px" height="70px" src="/woodaProject/img/<%=bp.getGi_img4() %>" /></div>
<div><%=bp.getGi_brand4() %></div>
<div><%=bp.getGi_name4() %></div>
<br />
<div><%=bp.getGi_price4() %></div>
</td>
<% } %>
</table>
</div>
<% } %>
<button type="button" id="sb" onclick="plus();">+</button>
</div>
</body>
</html>