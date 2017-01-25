<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/main.css">
</head>
<body>
<jsp:include page="/main/header.jsp" flush="false"></jsp:include>
<section>
<div id="join_find_id_section" align="left">

<form name="fn_id" action="find_id_ok.jsp" method="post">
<fieldset style="width:300px;">
	<legend>ID 찾기</legend>
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="fn_name" required placeholder="이름"></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><input type="text" name="fn_email" required placeholder="E-mail"></td>
		</tr>
		
		<tr align="center">
			<td colspan="2" align="center"><input type="submit" value="ID찾기">
		</tr>
		
	</table>
</fieldset>
</form>
</div>

<div id="join_find_pwd_section" align="left">
<form name="fn_pwd" action="find_pwd_ok.jsp" method="post">
<fieldset style="width:300px;">
	<legend>PWD 찾기</legend> 
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="fn_name" required placeholder="이름"></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><input type="text" name="fn_email" required placeholder="E-mail"></td>
		</tr>
		
		<tr>
			<th>질문</th>
			<td>
				<select name="question">
					<option value="1">가장 소중한 보물은?</option>
					<option value="2">졸업한 초등학교의 이름은?</option>
					<option value="3">나의 좌우명은?</option>
					<option value="4">부모님의 성함은?</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>답변</th>
			<td><input type="text" name="answer"></td>
		</tr>
		<tr align="center">
			<td colspan="2" align="center"><input type="submit" value="PWD찾기">
		</tr>
		
		
		
	</table>
</fieldset>
</form>
</div>
</section>
<jsp:include page="/main/footer.jsp" flush="false"></jsp:include>
</body>
</html>