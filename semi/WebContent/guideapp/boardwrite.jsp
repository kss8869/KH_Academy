<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ page import="java.util.*" %>
<%@ page import="project.*" %>
<jsp:useBean id="dao" class="project.SemiDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/boardwrite.css">
</head>
<body>
<% String userid=(String)session.getAttribute("userid"); 
	/**가이드신청 목록 메소드 가져오기*/
	ArrayList<requestDTO> arr=dao.guiderequest();
	
%>
		
	<div id="boardwrite_div" align="center">
		<form name="boardwrite" action="guideapp/boardwrite_ok.jsp">
		<table id="boardwrite_table">
			<tr>
			<th>작성자:</th>
			<td><input type="text" name="id" value="<%=userid %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>문의할지역:</th>
				<td>
					<select name="guidelocal">
						<option value="선택" selected>선택해주세요</option>
						<option value="1">강남구</option>
						<option value="2">용산구</option>
						<option value="3">마포구</option>
						<option value="4">서초구</option>
						<option value="5">동대문구</option>
						<option value="6">광진구</option>
						<option value="7">종로구</option>
						<option value="8">서대문구</option>
					</select>
				</td>
			<tr>
				<th>제목:</th>
				<td><input type="text" name="subject"></td>
			</tr>
			
=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/boardwrite.css">
</head>
<body>
	<div id="boardwrite_div" align="center">
		<form name="boardwrite" action="guideapp/boardwrite_ok.jsp">
		<table id="boardwrite_table">
			<tr>
			<th>작성자:</th>
			<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>제목:</th>
				<td><input type="text" name="subject"></td>
			</tr>
>>>>>>> branch 'master' of https://github.com/kss8869/KH_Academy.git
			<tr>
				<th>내용:</th>
				<td>
					<textarea cols="20" role="70" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글작성">
					<input type="reset"  value="다시쓰기">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>