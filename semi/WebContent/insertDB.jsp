<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="course.*" %>
<jsp:useBean id="idao" class="course.InsertDB" scope="page"/>
<%
	int count=0;
	int localnum=4;
	String localname="jonglo_food";
	for(int i=0;i<7;i++){
		count+=idao.dbInsert(localnum, localname, "jf_4_"+i+".jpg");
	}
	String msg=count>0?"DB입력성공!":"DB입력실패!";
%>
<script>
	window.alert('<%=msg%>');
</script>

