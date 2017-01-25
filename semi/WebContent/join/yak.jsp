<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/main.css">

<style>
h2{
	text-align:center;
}

textarea{
	position:relative;
	left:40%;
}
	
#img_left{
	position:absolute;
	left:10%;
}

#img_right{
	position:absolute;
	left:65%;
}

input{
	align:center;
}
/*
img:HOVER {
	opacity:0.3;
	filter: alpha(opacity=30);
}*/

</style>
</head>
<%
	String yak ="제 1 조 목적" +
			"이 약관은 서울여행이 제공하는 " + 
			"서울여행 및 서울여행 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항," +
			"기타 필요한 사항을 규정함을 목적으로 합니다.";
%>

<body>
<%@include file="/main/header_login.jsp"  %>

	<ul>
		<li><h2>이용약관</h2></li><br>
		<img src ="/semi/join/img/yak_background.jpg" id="img_left">
		<li><textarea rows="25" cols="25" readonly><%=yak %></textarea>
		<img src ="/semi/join/img/yak_background.jpg" id="img_right">
		<li align="center"><a href="join.jsp"><input type="button" value="가입신청"></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/semi/index.jsp"><input type="button" value="돌아가기"></a></li>
		
	</ul>
<jsp:include page="/main/footer.jsp" flush="false"></jsp:include>
</body>
</html>