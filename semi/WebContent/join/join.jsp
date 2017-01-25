<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<jsp:useBean id="jdto" class="semi.join.JoinDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>

<% request.setCharacterEncoding("utf-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function openIdCheck(){
	window.open('idCheck.jsp','idCheck','width=400, height=120');
}

</script>




<style>
section li{
	list-style-type: none;
	
}



label{
	width: 140px;
	float: left; 
	background-color: skyblue;
	
	}
ul{
	align:center;
}
h2{
	font-family: fantasy; 
	font-size: 30px;
	 
	text-align: center;
	font-style: italic;
	font : green;
	text-shadow:2px 2px darkblue;
}
#join_form{
	margin:0 auto;
}


</style>
<link rel="stylesheet" type="text/css" href="../css/main.css">

<!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">-->
</head>
<body>


<section>

<form name="join" action="join_ok.jsp" method="post">
 
	<h2>회원가입</i></h2> 
	<article id="join_form">
	<ul>
		<li><label>ID</label><input type="text" name="id" placeholder="중복검사를 확인해주세요" readonly>
		<input type="button" value="중복검사" onclick="openIdCheck()"></li>
		<li><label>비밀번호</label><input type="password" name="pwd" placeholder="비밀번호"></li>
		<li><label>이름</label><input type="text" name="name" placeholder="이름"></li>
		<li><label>Email</label>
		<input type="text" name="email"></li>
		<li><label>질문</label>
		<select name="question">
			<option>질문을 선택해 주세요</option>
			<option value="1">가장 소중한 보물은?</option>
			<option value="2">졸업한 초등학교의 이름은?</option>
			<option value="3">나의 좌우명은?</option>
			<option value="4">부모님의 성함은?</option>
		</select>
		</li>
		<li><label>답변</label><input type="text" name="answer"></li>
		
		<li><label>자동가입방지숫자</label><input type="text" name="ran" value='<%=jdao.mkRandomNum()%>'readonly></li>
		<li><label>숫자입력</label><input type="text" name="ran_answer"></li>
	</ul>
	
	<p>
		<input type="submit" value="회원가입"><input type="reset" value="다시작성">
	</p>
	</article>
</form>	

</section>

</body>
</html>