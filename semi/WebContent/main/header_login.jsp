<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%
	String userid=(String)session.getAttribute("userid");
	
	if(userid ==null||userid.equals("")){
		%>
	<div align="right" id="main_header_login_section">
  		<form action="join/login_ok.jsp">
			<input type="text" name="id" size="10" placeholder="아이디" required>
			<input type="password" name="pwd" size="10" placeholder="비밀번호" required>
			<input type="submit" value="로그인">	
			<a href="join/join_test.jsp">|회원가입</a>
		</form>
	</div>
		<%
	}else if(userid.equals("admin")){
		//관리자로 로그인시 나오는 화면
		%>
		<div align="right" id="main_header_login_section">
		<a href="join/logout.jsp">로그아웃</a>
		</div>
		<%
	}else{
	//***님  마이페이지  
		%>
		<div align="right" id="main_header_login_section">
			<a href="join/logout.jsp">로그아웃</a>
		</div>
		<%
	}
%>
</body>
</html>