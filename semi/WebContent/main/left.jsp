<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="semi.join.JoinDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리모콘</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--  리모콘 기능  -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	//follow quick menu
	$(window).scroll(function() {
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 80) {
			scrollTop = 80;
		}
		$(".main_main_left_menu").stop();
		$(".main_main_left_menu").animate({
			"top" : scrollTop
		});
	});
</script>
<!-- -------end-------- -->
</head>
<% 
	String userid=(String)session.getAttribute("userid");



	String menu=request.getParameter("menu");

	//회원 등급 조회 관련메소드소환
	
	String gradenum=dao.getUserGrade(userid);
	System.out.println("gradenum="+gradenum);
	if(gradenum ==null||gradenum.equals("")){
		gradenum="3";
	}
	
%>
<body>
	<div class="left_menu" >
		<%if(menu.equals("guideapp")){
			int grade=Integer.parseInt(gradenum);
				
			if(grade==1){
				//관리지 왼쪽페이지%>
				<div class="main_main_left_menu">
					<a href="index.jsp?menu=guideapp&pagename=guidetour_list">가이드 소개</a><br>
					<a href="index.jsp?menu=guideapp&pagename=guideboard">1:1문의게시판</a>
				</div>
				<%
			}else if(grade==2){
				//가이드 왼쪽페이지%>
				<div class="main_main_left_menu">
					<a href="index.jsp?menu=guideapp&pagename=guidetour_list">가이드 소개</a><br>
					<a href="index.jsp?menu=guideapp&pagename=guideboard">1:1문의게시판</a>
				</div>
				<%
			}else{
				//회원 왼쪽페이지%>
				<div class="main_main_left_menu">
					<h3>가이드</h3>
					<a href="index.jsp?menu=guideapp&pagename=guidetour_list">가이드 소개</a><br>
					<a href="index.jsp?menu=guideapp&pagename=guiderequest">가이드 신청</a><br>
					<a href="index.jsp?menu=guideapp&pagename=guideboard">1:1문의게시판</a>
				</div>
				<%
			}
			%>	
			
		<%}else if(menu.equals("")){%>			
		<!-- 추가할페이지  -->
				
		<%} %>
	</div>
</body>
</html>