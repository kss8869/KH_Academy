<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.*" %>
<jsp:useBean id="dao" class="project.SemiDAO"/>
<%
	
	String idx=request.getParameter("boardidx");
	int boardidx=Integer.parseInt(idx);
	String guideid=request.getParameter("guideid");
	String id=request.getParameter("id");
	String content=request.getParameter("content");
	
	int count=dao.commentUpdate(boardidx, id, content);
	

	if(count==0){
		%>
		<script>
			alert('댓글작성 오류');
			location href='../index.jsp?menu=guideapp&pagename=guideboard_detail';
		</script>
		<%
		
	}else{
		%>
		 <script> 
		 	location.href='../index.jsp?menu=guideapp&pagename=guideboard_detail&idx=<%=boardidx%>';
		 </script>
		<%
	}
	
	
%>