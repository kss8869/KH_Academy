<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드 신청</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/guiderequest.css">
</head>
<body>
<div align="center" id="guideapp_request">
	<form name="guiderequest" action="guideapp/guiderequest_ok.jsp">
	<h3>신청서 작성</h3>
		<table>
			<tr>
				<td>
					작성자이름:
				</td>
				<td>
					<input type="text" name="id" readonly="readonly" value="작성자이름예정">
					<!-- 히든으로  투어 idx 값받기-->
				</td>
			</tr>
			<tr>
				<td>가이드지역:</td>
				<td>
					<select name="guidelocal">
						<option value="선택" selected>선택해주세요</option>
						<option value="강남구">강남구</option>
						<option value="용산구">용산구</option>
						<option value="마포구">마포구</option>
						<option value="서초구">서초구</option>
	
	
	
						<option value="동대문구">동대문구</option>
						<option value="광진구">광진구</option>
						<option value="종로구">종로구</option>
						<option value="서대문구">서대문구</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>요청사항:</td>
				<td>
					<textarea role="20" cols="70" name="content"></textarea>
				</td>
			</tr>
				
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="작성완료">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>