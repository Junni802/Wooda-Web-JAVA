<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
if (loginInfo != null){
	out.println("<script> alert('잘못된 경로로 들어옴.'); history.back(); </script>");
	out.close();
}
request.setCharacterEncoding("utf-8");
String url = request.getParameter("url"); // 로그인 후 이동할 페이지 주소

if (url == null) url = "index.jsp"; // 주소가 없는 경우 메인화면 지정

%>
<!DOCTYPE html>
<html>
<head>
<style>
.main {
 	margin: auto;
 	margin-top:300px;
    width: 500px;
    height: 550px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid #ffb3a8;
    border-radius: 5px;
}

.logo {
    margin-top: 0px;
    margin-bottom: 0px;
}

#login, #pwd, #join {
    width: 300px;
    height:40px;
    background-color: #ffea92 ;
    border-color: transparent;
    color: black;
    font-color: white;
}
.container { width:300px; }
.account {
	width:300px; 
	height:40px;
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid #ffea92 ;
    border-radius: 3px;
}

#alert {
    border-color: transparent;
}

#uid, #pwd {
    width: 95%;
}

.hrline { background:#ffb3a8; height:1px; border:0; }
</style>
<meta charset="EUC-KR">
<title>♡우리들의 다이어리♥</title>
</head>
<body>
<form name="frmLogin" action="login" method="post">
<input type="hidden" name="url" value="<%=url %>"/>
 <div class="main">
        <div class="logo" style="margin-bottom:50px;"><img src="img/woodalogo6.png" width="200" /></div>
        <div class="container">
        	
            <input type="text" name="uid" id="uid" value="test1" class="account" />
            <input type="password" name="pwd" id="pwd" value="1234" class="account"/><br>
            <input type="submit" id="login" value="로그인" class="account"/><br>
            <hr class="hrline" /><br>
            <button id="pw" class="account">비밀번호 찾기</button><br>
            <input type="button" id="login" value="회원가입" onclick="location.href='/woodaProject/member/join_member.jsp'"/>
            
            <p id="alert" class="account"> </p>
        </div>
    </div>   
    <script src="script.js"></script>
</form>
</body>
</html>