<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="project.SemiDAO"/>

<%
	String id =	request.getParameter("id");
	String subject = request.getParameter("subject");
	String content =request.getParameter("content");
	
	int result=dao.board_update(id, subject, content);
	
	String msg=result>0?"글수정완료":"Error!";
%>
	<script>
		alert('<%=msg%>');
		location.href='../index.jsp?menu=guideapp&pagename=guideboard';
	</script>
	