<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "vo.*" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<GiftInfo> giftList = (ArrayList<GiftInfo>)request.getAttribute("giftList");
int ag_num = (Integer)request.getAttribute("ag_num");
int ag_num1 = (Integer)request.getAttribute("ag_num1");
int ag_num2 = (Integer)request.getAttribute("ag_num2");
int ag_num3 = (Integer)request.getAttribute("ag_num3");
int ag_num4 = (Integer)request.getAttribute("ag_num4");
String ag_name = (String)request.getAttribute("ag_name");
int count = (Integer)request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
if($('#check').val() > 1){
	alert("위험");
}

</script>
<style>
img {
width:70px;
height:70px;
}
#ag_num {
width:500px;
}

</style>
<script>
var count = <%=count %>;
function CountChecked(chk) {
	var chkbox = document.getElementsByName("choose");
	if(chk.checked){
		count++;
	}else{
		count--;
	}
	if(count > 4){
		alert("최대 4개까지만 선택가능합니다.");
		count--;
		chk.checked = false;
		return false;
	}
}

</script>
</head>
<body>
<form name="frm" action="present_up" method="get">
제목 : <input type="text" id="ag_name" name="ag_name" value="<%=ag_name %>" />
<table width="500px">

<%
for(int i=0; i<giftList.size(); i++){
	GiftInfo gi = giftList.get(i);
%>
<tr>
<td>
<input onClick="CountChecked(this);" id="" type="checkbox" name="choose" <%if(gi.getGi_num() == ag_num1 || gi.getGi_num() == ag_num2 ||gi.getGi_num() == ag_num3 ||gi.getGi_num() == ag_num4){ %>checked="checked" <% } %> value="<%=gi.getGi_num() %>,<%=gi.getGi_img1() %>,<%=gi.getGi_brand() %>,<%=gi.getGi_name() %>,<%=gi.getGi_price() %>,<%=ag_num %>,<%=ag_name %>" />
</td>
<tr>
<td rowspan="4"><img src="/woodaProject/img/<%=gi.getGi_img1() %>" name="img" /></td>
<td rowspan="4" colspan="3"></td>
<td><%=gi.getGi_brand() %></td>
<tr>
<td><%=gi.getGi_name() %></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td><%=gi.getGi_price() %></td>
</tr>
<%
}
%>
</table>
<button type="submit" name="submit" value="">등록하기</button>
<button type="button" name="back" value="" onclick="window.close()">취소</button>
</form>
</body>
</html>