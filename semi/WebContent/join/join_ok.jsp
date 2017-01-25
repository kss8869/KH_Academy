<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="jdto" class="semi.join.JoinDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>


<%
	String answer = request.getParameter("answer");
	String ran = request.getParameter("ran");
	String ran_answer = request.getParameter("ran_answer");
	int result=0;
	if(jdto.getId()==null || jdto.getId().equals("") || jdto.getPwd()==null ||jdto.getPwd().equals(""))
	{
		String error ="공란 없이 입력해 주세요";
		%>
		<script>
		window.alert('<%=error%>');
		location.href="join_test.jsp";
		</script>
		<%		
	}
	else{
		if(ran.equals(ran_answer)){
			result = jdao.join(jdto);
			String msg = result>0?"회원가입 성공" : " 회원가입 실패";
			%>
			<script>
				window.alert('<%=msg%>');
				location.href="/semi/index.jsp";
			</script>
			<%
		}
		else{
			String msg = "자동가입방지 문자가 틀렸습니다.";
			%>
			<script>
				window.alert('<%=msg%>');
				location.href="/semi/join/join_test.jsp";
			</script>
			<%
		}
		
	}
	
	
	
	
	
%>

