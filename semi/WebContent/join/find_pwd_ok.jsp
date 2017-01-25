<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>

<%
	String name = request.getParameter("fn_name");
	String email = request.getParameter("fn_email");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	
	String pwd = jdao.findPwd(name, email,question,answer);

	if(pwd ==null || pwd.equals("")){
		%>
		<script>
		window.alert('가입정보와 일치하는 ID를 찾을 수 없습니다.');
		location.href="find.jsp";
		</script>
		<%
	}
	else
	{
		String msg = "찾으시는 PWD는 " + pwd + " 입니다.";
		%>
		<script>
		window.alert('<%=msg%>');
		location.href="find.jsp";
		</script><%
	}
%>