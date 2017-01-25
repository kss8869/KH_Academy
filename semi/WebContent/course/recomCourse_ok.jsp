<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String location=request.getParameter("location");
if(location==null||location.equals("")){
	location="";
}
%>
<script>
	location.href='recomCourse<%=location%>.jsp?location=<%=location%>';
</script>