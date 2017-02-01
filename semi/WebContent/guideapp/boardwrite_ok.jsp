<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.*" %>
<jsp:useBean id="dao" class="project.SemiDAO"/>
<jsp:useBean id="bdto" class="project.boardDTO"/>

<%
	
	String id=request.getParameter("id");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	int result=dao.board_insert(id,subject,content);
	
	String msg=result>0?"작성완료":"Error!";
%>
	<script>
		window.alert('<%=msg%>');
		location.href='../index.jsp?menu=guideapp&pagename=guideboard';
	</script>