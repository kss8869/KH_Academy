<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="dto" class="project.boardDTO"/>
<jsp:useBean id="dao" class="project.SemiDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 본문보기</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/guideboard_detail.css">
<%
	String pagenum_o=request.getParameter("pagenum");

	if(pagenum_o==null || pagenum_o.equals("") ){
	pagenum_o="1";

	}
	//현재페이지번호
		int pagenum=Integer.parseInt(pagenum_o);
	//첫번재글
		int start=((pagenum-1)*10)+1;	
	//마지막번째글
		int end=pagenum*10;
	//첫번재 페이지
		int	startpage=(pagenum/10*10)+1;
	
	//현재 위치
		if(pagenum%10==0){
			
		startpage=startpage-10;				

	}
	//마지막 페이지
		int endpage=startpage+9;
	
	//가장큰 페이지구하기
		int datacount=dao.datacount();
	//마지막페이지구하기
	//총 페이지수
		int totalpage=0;
	//총게시물 구한것
		if(datacount%10!=0){
			totalpage=datacount/10+1;
		}else{
			totalpage=datacount/10;
		}
	//최종 페이지 구하기
		if(totalpage<endpage){
			endpage= totalpage;
		}	

%>
<%		
		//본문 내용출력 
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DATE);
		
		String date=year+"년"+month+"월"+day+"일";
		//게시글 글제목에서 파라미터값으로 idx 값을 받았다.
		String idx_s=request.getParameter("idx");
		//형변환
		int useridx=Integer.parseInt(idx_s);
		//본문 출력 관련 메소드 호출-
	
		//useridx 값은 넘어왔음52
		
		
		boardDTO bdto=dao.boardcontent(useridx);
		
		if(bdto == null || bdto.equals("")){
			%>
			<script>
				alert('잘못된 접근입니다.');
				location.href='index.jsp?menu=guideapp&pagename=guideboard';
			</script>
			<%
		}
%>
</head>
<body>

	<div id="guideboard_detail_top">

	
	<p ><%=bdto.getSubject() %>|1:1 Q & A | <a href="index.jsp?menu=guideapp&pagename=guideboard"><input type="button" value="LIST"></a></p> 
		
		<table id="guideapp_guideboard_detail">
			<tr>
				<th colspan="2"><label>WRITER:</label>
					
					<%=bdto.getId()%>
				</th>
			</tr>
			<tr>
				<th colspan="2"><label>CONTENT:</label>
					
				
					<fieldset>	
						<p><%=bdto.getContent().replaceAll("\n","<br>")%></p>
					</fieldset>
				</th>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a href="index.jsp?menu=guideapp&pagename=boardupdate&idx=<%=useridx%>"><input type="button" value="글수정"></a>
					<a href="guideapp/guideboard_detail_delete.jsp?idx=<%=bdto.getIdx()%>"><input type="button" value="글삭제"></a>
				</td>
			</tr>
		</table>		
	</div>
	<!-----------댓글 영역---------  -->
	<div id="guideboard_detail_middle">
		<p>Comment List</p>
		<hr>
		<table>
			<thead>
				<tr>
					<td>글번호</td>				
					<td>작성자</td>
					<td>내용</td>
					<td>작성일</td>
				</tr>
			</thead>
				<tfoot>
					<tr>
						<td colspan="4" align="center">
						<!-- 이전 -->
<%
						if(startpage>1){
%>					
						<a href="index.jsp?menu=guideapp&pagename=guideboard_detail&pagenum=<%=startpage-10%>">&laquo;&laquo;</a>					
<%							}
						//페이징
						for(int i=startpage;i<=endpage;i++){
							
							
%>
						<a href="index.jsp?menu=guideapp&pagename=guideboard_detail&pagenum=<%=i%>">&laquo;<%=i%>&raquo;</a>									
<%					
						if(i==totalpage)break;
						}//end for
					
%>							<!-- 다음 -->
<%							if(endpage<totalpage){
%>
						<a href="index.jsp?menu=guideapp&pagename=guideboard_detail&pagenum=<%=startpage+10%>">&raquo;&raquo;</a>
<%					 
						}
%>	
						</td>
					</tr>
				</tfoot>
				<tbody>
<%
					ArrayList<commentDTO> arr=dao.commentList(start, end);
					
					if (arr == null || arr.equals("")){
%>
						<tr>
							<td colspan="3">등록된 코멘트가 없습니다.</td>
						</tr>
<%
					}else{
						for(int i=0;i<arr.size();i++){
%>
							<tr>
								<td><%=arr.get(i).getRnum() %></td>
								<td><%=arr.get(i).getId() %></td>
								<td><%=arr.get(i).getContent() %></td>
								<td><%=arr.get(i).getComdate() %></td>
							</tr>
<%
						}
					}
%>
				</tbody>
		</table>
		<p>COMMENT</p>
		<hr>
		<p>가이드 아이디 입력란|날짜:<%=date %></p>
			
			<form name="boardcomment" action="guideapp/boardcomment_ok.jsp">
				<textarea rows="5" cols="100"  name="content" placeholder="코멘트 작성란 .."></textarea>
				<input type="hidden" name="boardidx" value="<%=useridx %>">
				<input type="hidden" name="id" value="<%=bdto.getId()%>">
				<input type="hidden" name="guideid" value="<%=bdto.getGuideid()%>">
				<a href=""><input type="submit" value="적용"></a>
			</form>
	</div>
</body>
</html>