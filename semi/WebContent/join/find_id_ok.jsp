<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>

<%
	String name = request.getParameter("fn_name");
	String email = request.getParameter("fn_email");
	
	String id = jdao.findId(name, email);
	
	if(id ==null || id.equals("")){
		%>
		<script>
		window.alert('가입정보와 일치하는 ID를 찾을 수 없습니다.');
		location.href="find.jsp";
		</script>
		<%
	}
	else
	{
		String msg = "찾으시는 ID는 " + id + " 입니다.";
		%>
		<script>
		window.alert('<%=msg%>');
		location.href="find.jsp";
		</script><%
	}
%>