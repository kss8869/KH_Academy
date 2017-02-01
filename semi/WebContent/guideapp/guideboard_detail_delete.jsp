<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="project.SemiDAO"/>
<%

	String idx_s=request.getParameter("idx");
	int useridx=Integer.parseInt(idx_s);
	
	
	int result=dao.board_delete(useridx);
	
	String msg=result>0?"삭제완료":"오류";
		
%>
	<script>
		alert('<%=msg%>');
		location.href='../index.jsp?menu=guideapp&pagename=guideboard';
	</script>