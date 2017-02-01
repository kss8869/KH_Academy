<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*" %>
<jsp:useBean id="sdao" class="project.SemiDAO"/>
<jsp:useBean id="dto" class="project.requestDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%int result=sdao.tourrequest(dto);
	String msg=result>0?"신청완료":"신청오류";%>
	<script>
		window.alert('<%=msg%>');
		location.href='../index.jsp';
	</script>
