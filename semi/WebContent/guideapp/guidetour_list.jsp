<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="tdao" class="project.SemiDAO"/>
<jsp:useBean id="tdto" class="project.tourlistDTO"/>

<%
		ArrayList<tourlistDTO> arr=tdao.tourlist();
		System.out.println(arr.get(2).getIdx());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드 프로그램</title>
<link rel="stylesheet" type="text/css" href="guideapp/css/guideintro.css">
</head>
<body>
<div align="center">
	<table>
		<tr align="center">
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_gangnam&idx=<%=arr.get(0).getIdx()%>"><img src="guideapp/img/gangnam.jpg"></a><br>
					<font class="guideintro_list_title">하루만에 강남 전부 정복하기!~</font>
			</td>
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_yongsan&idx=<%=arr.get(1).getIdx()%>"><img src="guideapp/img/yongsan.jpg"></a><br>
					<font class="guideintro_list_title">하루만에 용산 전부 정복하기!~</font>
			</td>
		</tr>
		<tr align="center">
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_mafo&idx=<%=arr.get(2).getIdx()%>"><img src="guideapp/img/mafo.JPG" ></a><br>
					<font class="guideintro_list_title">하루만에 마포 전부 정복하기!~</font>
			</td>
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_seocho&idx=<%=arr.get(3).getIdx()%>"><img src="guideapp/img/seocho.jpg"></a><br>
					<font class="guideintro_list_title">하루만에 서초 전부 정복하기!~</font>
			</td>
		</tr>
		<tr align="center">
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_dongdaemoon&idx=<%=arr.get(4).getIdx()%>"><img src="guideapp/img/dongdaemoon.png"></a><br>
					<font class="guideintro_list_title">하루만에 동대문 전부 정복하기!~</font>
			</td>
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_gwangjin&idx=<%=arr.get(5).getIdx()%>"><img src="guideapp/img/gwangjin.jpg" ></a><br>
					<font class="guideintro_list_title">하루만에  광진구 전부 정복하기!~</font>
			</td>
		</tr>
		<tr align="center"> 
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_jonglo&idx=<%=arr.get(6).getIdx()%>"><img src="guideapp/img/jonglo.png" ></a><br>
					<font class="guideintro_list_title">하루만에 종로 전부 정복하기!~</font>
			</td>
			<td class="guideintro_list_td">
				<a href="index.jsp?menu=guideapp&pagename=tour_seodaemoon&idx=<%=arr.get(7).getIdx()%>"><img src="guideapp/img/seodaemoon.jpg" ></a><br>
					<font class="guideintro_list_title">하루만에 서대문 전부 정복하기!~</font>
			</td>
		</tr>
	</table>
</div>

</body>
</html>