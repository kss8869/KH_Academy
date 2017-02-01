<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="course.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css?ver=1">
</head>
<%
String grade_s=(String)session.getAttribute("grade");
if(grade_s==null||grade_s.equals("")){
	grade_s="3";//null이거나 공백값일때 일반회원의 값인 3을 넣어준다.
}
int grade=Integer.parseInt(grade_s);
String localname=request.getParameter("localname");
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article id="seoulMap">
		<a href=""><img src="/semi/img/seoul_map.jpg" alt="seoul_map.jpg" usemap="#seoul_map.jpg" style="border: 0;" /></a>
		<map name="seoul_map.jpg">
	    	<area shape="poly" coords="203,240,218,264,235,268,252,265,278,240,269,228,262,219,252,222,239,211,230,212,216,214,214,226,202,241,216,260,218,261" href="recomCourse_ok.jsp?location=Yongsan" target="" alt="" />
			<area shape="poly" coords="157,183,180,202,181,208,189,214,208,212,216,210,223,205,218,194,215,191,209,181,215,173,217,157,210,150,208,141,205,135,190,156,183,157,178,169,170,174,165,169" href="recomCourse_ok.jsp?location=Seodaemoon" target="" alt="" />
			<area shape="poly" coords="332,207,338,207,350,193,358,195,366,187,372,191,371,197,367,207,372,210,381,209,378,217,361,246,349,255,334,255,324,252,315,244" href="recomCourse_ok.jsp?location=Gwangjin" target="" alt="" />
			<area shape="poly" coords="283,192,283,182,311,151,318,150,332,143,335,148,330,154,335,170,342,185,333,207,320,204,314,195,308,195,302,186,295,194" href="recomCourse_ok.jsp?location=Dongdaemoon" target="" alt="" />
			<area shape="poly" coords="201,129,208,133,207,140,210,145,211,154,217,159,217,172,208,180,216,193,219,191,222,198,229,192,238,193,246,195,255,196,259,190,272,191,277,191,281,190,281,181,272,179,262,176,262,169,253,163,248,166,240,163,235,155,243,146,243,127,231,111,210,114" href="recomCourse_ok.jsp?location=Jonglo" target="" alt="" />
			<area shape="poly" coords="123,183,110,187,158,228,168,233,187,230,198,234,201,241,217,226,216,210,201,214,187,213,181,208,181,202,130,165,126,169" href="recomCourse_ok.jsp?location=Mafo" target="" alt="" />
			<area shape="poly" coords="231,276,238,287,241,295,241,309,237,314,237,319,245,332,246,344,254,340,256,335,261,333,265,338,267,345,273,350,280,349,288,342,290,336,296,343,296,348,298,355,299,370,315,385,324,387,327,381,335,382,338,368,350,367,364,342,358,338,356,332,343,320,327,331,311,329,314,324,303,310,298,305,294,306,284,280,285,271,273,254,258,269,243,274" href="recomCourse_ok.jsp?location=Seocho" target="" alt="" />
			<area shape="poly" coords="276,253,285,270,284,279,294,306,302,310,315,329,326,331,343,319,356,334,356,337,364,344,372,345,374,340,386,346,391,334,378,313,378,307,371,297,361,295,331,278,331,259,319,256,305,247,295,242,283,245" href="recomCourse_ok.jsp?location=Gangnam" target="" alt="" />
		</map>
	</article>
	<article id="recomFoodWrite">
	<h3>맛집 추가</h3>
	<form name="recomFoodWrite" action="recomFoodWrite_ok.jsp">
		<table style="border: 1px double black;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="rname"></td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><input type="text" name="menu"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>			
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>





