<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="jdto" class="semi.join.JoinDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>

<%	String userid = request.getParameter("userid");
	boolean result = jdao.idCheck(userid);
	if(result){
		%>
		<script>
			window.alert('입력하신 ID는 현재 사용중입니다.');
			window.self.close();
			location.href('idcheck.jsp');
		</script>
		<%
	}
	else{
		%>
		<script>
		window.alert('<%=userid%>는 사용 가능한 ID입니다');
		opener.document.join.id.value = '<%=userid%>';
		window.self.close();
		</script>
		<%
	}
%>