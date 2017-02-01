<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="project.*" %>
<jsp:useBean id="dao" class="project.SemiDAO"/>
<jsp:useBean id="dto" class="project.boardDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/boardwrite.css">
<%		
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DATE);
		String date=year+"년"+month+"월"+day+"일";
		/*guideboard_detail.jsp 에서 받은 파라미터값  */
		String idx_o=	request.getParameter("idx");
		int useridx=Integer.parseInt(idx_o);
		
		//본문 테이블 긁어오기
		boardDTO bdto=dao.boardcontent(useridx);
%>
</head>
<body>
		<div id="boardwrite_div" align="center">
			<form name="boardupdate" action="guideapp/boardupdate_ok.jsp">
			<table id="boardwrite_table">
				<tr>
				<th>작성자:</th>
				<td><input type="text" name="id" value="<%=bdto.getId()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" value="<%=bdto.getSubject()%>"></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>
						<textarea cols="20" role="70" name="content"> <%=bdto.getContent().replaceAll("\n","<br>")%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" >
						<input type="submit" value="수정하기">
						<input type="reset"  value="다시쓰기">
						수정일자:<%=date %>
					</td>
				</tr>
			</table>
			</form>
		</div>

</body>
</html>