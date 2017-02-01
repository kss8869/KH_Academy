<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changepage</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%
String menu = request.getParameter("menu"); 
String pagename = request.getParameter("pagename");
%>
	<div class="main_main_left">
		<jsp:include page="left.jsp" flush="false">
		<jsp:param name="menu" value="<%=menu %>"></jsp:param>
		</jsp:include>
	</div>
<%
	
			if(pagename.equals("guidetour_list")){
%>
			<div class="main_main_right">
				<!-- 가이드 소개 페이지 -->
				<jsp:include page="../guideapp/guidetour_list.jsp" flush="false"></jsp:include>
			</div>
<%
			}else if(pagename.equals("guiderequest")){
			
%>			
			<div class="main_main_right" >	<!-- 가이드 신청페이지 -->
				<jsp:include page="../guideapp/guiderequest.jsp" flush="false">
				<jsp:param name="menu" value="<%=menu %>"></jsp:param>
				<jsp:param name="pagename" value="<%=pagename %>"></jsp:param>
				</jsp:include>
			</div>	
<%
			}else if(pagename.equals("guideboard")){
%>
				<div class="main_main_right">
				<!-- 가이드 1:1문의 게시판페이지 -->
				 <jsp:include page="../guideapp/guideboard.jsp" flush="false"></jsp:include>
				 </div>
<%
			}else if(pagename.equals("boardwrite")){
%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/boardwrite.jsp" flush="false"></jsp:include>
				</div>
<%
			}else if(pagename.equals("guideboard_detail")){
%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/guideboard_detail.jsp" flush="false"></jsp:include>
				</div>
<%

			}else if(pagename.equals("boardupdate")){
%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/boardupdate.jsp" flush="false"></jsp:include>
				</div>
<%
				
			}else if(pagename.equals("tour_yongsan")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_yongsan.jsp" flush="false"></jsp:include>
				</div>
				<%
				
			}else if(pagename.equals("tour_sedaemoon")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_seodaemoon.jsp" flush="false"></jsp:include>
				</div>
				<%
				
			}else if(pagename.equals("tour_seocho")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_seocho.jsp" flush="false"></jsp:include>
				</div>
				<%
			}else if(pagename.equals("tour_mafo")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_mafo.jsp" flush="false"></jsp:include>
				</div>
				<%
			}else if(pagename.equals("tour_jonglo")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_jonglo.jsp" flush="false"></jsp:include>
				</div>
				<%
			}else if(pagename.equals("tour_gwangjin")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_gwangjin.jsp" flush="false"></jsp:include>
				</div>
				<%
			}else if(pagename.equals("tour_gangnam")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_gangnam.jsp" flush="false"></jsp:include>
				</div>
				<%
			}else if(pagename.equals("tour_dongdaemoon")){
				%>
				<div class="main_main_right">
				<jsp:include page="../guideapp/tour_dongdaemoon.jsp" flush="false"></jsp:include>
				</div>
				<%	
			} //end if
%>
			
</body>
</html>