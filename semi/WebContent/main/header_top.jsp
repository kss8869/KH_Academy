<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_top</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>

#blogMenu {
	float:right;
	margin:0px 5px 3px 5px;
	padding:0 0 3px 0;
	box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	background-color:#5c5c5c;
}
#blogMenu ul li {
	float:left;
	list-style-type:none;
}
#blogMenu a {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:12px;
	padding:0 10px 0 10px;
	text-decoration:none;
}
#blogMenu a:hover {
	color:#D4F4FA;
	border-bottom:3px solid;
}
#blogMenu ul ul {
	display:none;
	position:absolute;
	background-color:#5c5c5c;
}
#blogMenu ul li:hover ul {
	display: block;
}
#blogMenu ul ul li {
	float:none;
}
</style>
</head>
<body>
<div id="main_header_top_nav_section" align="center">	
			<a href="index.jsp" ><img src="main/img/semi_logo.png" id="main_header_top_logo"></a>
	<div id="blogMenu">
		<ul>
			
			<li>
			<a href="#">회사소개</a>
				<ul>
				<!-- 카테고리내용 삽입 -->
				</ul>
			</li>
			<li>
				<a href="#">추천코스</a>
				<ul>
				<!-- 카테고리내용삽입  -->
				</ul>
			</li>
			<li>
				<a href="index.jsp?menu=fun&pagename=seoul">서울즐기기</a>
				
				<ul>
				<!-- 카테고리삽입 -->
				</ul>
			</li>
			<li>
				<a href="index.jsp?menu=guideapp&pagename=guidetour_list">가이드</a>
				<ul>
					<li><a href="index.jsp?menu=guideapp&pagename=guidetour_list">가이드 소개</a></li>
					<li><a href="index.jsp?menu=guideapp&pagename=guiderequest">가이드 신청</a></li>
					<li><a href="index.jsp?menu=guideapp&pagename=guideboard">1:1 문의 게시판</a></li>
				</ul>
			</li>
			<li>
				<a href="#">이벤트</a>
				
				<ul>
					<!-- 카테고리내용삽입  -->
				</ul>
			</li>
		</ul>
	</div>
</div>
</body>
</html>