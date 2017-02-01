<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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