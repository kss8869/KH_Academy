<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.*" %>
<jsp:useBean id="dao" class="project.SemiDAO"/>
<jsp:useBean id="bdto" class="project.boardDTO"/>

<%
	
	String id=request.getParameter("id");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String guidelocal=request.getParameter("guidelocal");
	int local=Integer.parseInt(guidelocal);
	String guideid="";
	switch(local){
	//강남구
	case 1:
		guideid = "guide1";
		break;
	//용산구
	case 2:
		guideid="guide2";
		break;
	//마포구
	case 3:
		guideid="guide3";
		break;
	//서초구
	case 4:
		guideid="guide4";
		break;
	
	//동대문구
	case 5:
		guideid="guide5";
		break;
	//광진구
	case 6:
		guideid="guide6";
		break;
	//종로구
	case 7:
		guideid="guide7";
		break;
	//서대문구
	case 8:
		guideid="guide8";
		break;
	}
	
	int result=dao.board_insert(id,subject,content,guideid);
	
	String msg=result>0?"작성완료":"Error!";
%>
	<script>
		window.alert('<%=msg%>');
		location.href='../index.jsp?menu=guideapp&pagename=guideboard';
	</script>