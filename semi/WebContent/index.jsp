<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seoul project</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div id="main_header">
	<jsp:include page="main/header.jsp" flush="false"></jsp:include>
	<%-- <%@include file="main/header.jsp" %> --%>
</div>
<div id="main_main">
<%
	String menu = request.getParameter("menu"); 
	String pagename = request.getParameter("pagename");
	
	if(menu == null || menu =="") {
		//처음페이지를 탄경우-->main이와야함
%>
	
	<jsp:include page="main/main.jsp" flush="false"></jsp:include>
		<%-- <%@ include file="main/main.jsp" %> --%>
<%	
	}else{
		%>
		<jsp:include page="/main/changepage.jsp" flush="false">
		<jsp:param name="menu" value="<%=menu %>"></jsp:param>
		<jsp:param name="pagename" value="<%=pagename %>"></jsp:param>
		</jsp:include>
		<%
		//왼쪽에 화면 오른쪽에 메뉴
			
%>
<%
			}
%>
</div>

<div id="main_footer">
	<jsp:include page="main/footer.jsp" flush="false"></jsp:include>
	<%-- <%@ include file="main/footer.jsp" %> --%>
</div>
</body>
</html>