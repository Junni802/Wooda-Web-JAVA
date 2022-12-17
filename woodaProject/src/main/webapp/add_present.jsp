<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "vo.*" %>
<script src="/woodaProject/src/main/webapp/js/jquery-3.6.1.js"></script>
<%
request.setCharacterEncoding("utf-8");
ArrayList<GiftInfo> giftList = (ArrayList<GiftInfo>)request.getAttribute("giftList");

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
var count = 0;
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
<form name="frm" action="present_in" method="get">
제목 : <input type="text" id="ag_name" name="ag_name" />
<table width="500px">

<%
for(int i=0; i<giftList.size(); i++){
	GiftInfo gi = giftList.get(i);
%>
<tr>
<td>
<input onClick="CountChecked(this);" id="" type="checkbox" name="choose" value="<%=gi.getGi_num() %>,<%=gi.getGi_img1() %>,<%=gi.getGi_brand() %>,<%=gi.getGi_name() %>,<%=gi.getGi_price() %>" />
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
<td><%=gi.getGi_price() %>원</td>
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