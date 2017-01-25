<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="jdao" class="semi.join.JoinDAO" scope="page"/>

<%
	
	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	
	System.out.println("login_ok에서의 id pwd : " + userid + " " + userpwd);
	String msg="";
	
	
	int result = jdao.loginCheck(userid, userpwd);
	
	/*
	if(result==jdao.LOGIN_OK){
		
		session.setAttribute("userid",userid);
		
	}
	*/
	switch(result){
	
	case 1:
		session.setAttribute("userid",userid);
		msg = "로그인 성공!!";
		break;
		
	case -1:
		msg = "로그인 실패!! 3회이상 실패시 로그인 정지!!";
		break;
		
	case -2:
		msg="비밀번호 3회 이상 실패하셨습니다. 비밀번호를 찾아 주세요";
		break;
	}
	
	System.out.println("로그인 결과 msg의 값은 : " + msg);

%>

<script>
	window.open('<%= msg %>');
	location.href="/semi/index.jsp";	
</script>