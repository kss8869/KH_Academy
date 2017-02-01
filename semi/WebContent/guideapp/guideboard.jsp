<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bdao" class="project.SemiDAO"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"/>
<jsp:useBean id="bdto" class="project.boardDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의게시판</title>

<%
/* 로그인 모듈 */
	String userid=(String)session.getAttribute("userid");
	
	if(userid == null ||userid.equals("")){
	System.out.println("아이디userid="+userid);
%>
		<script>
			window.alert('로그인후 이용해주세요');
			location.href='index.jsp';
		</script>
		
<%
	return;
}
 

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
			
		if(pagenum%10==0){
			
		startpage=startpage-10;				

	}
	//마지막 페이지
	int endpage=startpage+9;
	
	//가장큰 페이지구하기
	int datacount=bdao.datacount();
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
</head>
<body>
	<div align="center">
		<h3>1:1 문의 게시판</h3>
<%
		String gradenum=jdao.getUserGrade(userid);
		int grade=Integer.parseInt(gradenum);
		ArrayList<boardDTO> arr = new ArrayList<boardDTO>();
		if(grade==1){
			//관리자 목록
			arr=bdao.adminboard(start,end);
		}else if(grade==2){
			//가이드 목록
			arr=bdao.guideboard(start, end, userid);
		}else if(grade==3){
			//회원 목록
			arr=bdao.board(start,end,userid);
		}
		if(arr.size() == 0){
%>				
		<a href="index.jsp?menu=guideapp&pagename=boardwrite">글쓰기</a>
			<div>등록된 게시글이 없습니다.</div>
<%			
		}else{
			
%>		<a href="index.jsp?menu=guideapp&pagename=boardwrite">글쓰기</a>
		<table border="1">
			<thead>
			<tr>
				<th>게시번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			</thead>
					<!-- 페이징영역 -->
			<tfoot>
				<tr>
					<td colspan="5" align="center">
					<!-- 이전 -->
<%
					if(startpage>1){
%>					
					<a href="index.jsp?menu=guideapp&pagename=guidboard&pagenum=<%=startpage-10%>">&lt;&lt;</a>					
<%							}
					//페이징
					for(int i=startpage;i<=endpage;i++){
%>
					<a href="index.jsp?menu=guideapp&pagename=guideboard&pagenum=<%=i%>">[<%=i%>]</a>									
<%					
					if(i==totalpage)break;
					}//end for
				
%>							<!-- 다음 -->
<%							if(endpage<totalpage){
%>
					<a href="index.jsp?menu=guideapp&pagename=guidboard&pagenum=<%=startpage+10%>">&gt;&gt;</a>
<%					 
					}
%>	
					</td>
				</tr>
			</tfoot>
			<!-- ---- -->
			<tbody>
					
						<!-- 게시물 출력 -->

				<% 	for(int i=0;i<arr.size();i++){
%>							
						<tr>
							<td><%=arr.get(i).getRnum() %></td>
							<td><a href="index.jsp?menu=guideapp&pagename=guideboard_detail&idx=<%=arr.get(i).getIdx() %>"><%=arr.get(i).getSubject() %></a></td>
							<td><%=arr.get(i).getId() %></td>
							<td><%=arr.get(i).getReadnum() %></td>
							<td><%=arr.get(i).getComdate() %></td>
						</tr>										
<%
					}
				}	
%>				
			</tbody>
		</table>
	</div>
</body>
</html>