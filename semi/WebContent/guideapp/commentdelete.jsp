<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="project.SemiDAO"/>
    <%
    	String idx_s=request.getParameter("idx");
    	String boardidx=request.getParameter("boardidx");
    	int idx=Integer.parseInt(idx_s);
    	
    	System.out.println("boardidx="+boardidx);
    	int result=dao.commentdelete(idx);
    	
    	String msg=result>0?"삭제완료!":"Error!";
    %>
    <script>
    	alert('<%=msg%>');
    	location.href='../index.jsp?menu=guideapp&pagename=guideboard_detail&idx=<%=boardidx%>';
    </script>