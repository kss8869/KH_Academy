<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="course.*" %>
<jsp:useBean id="gfdao" class="course.GwangjinFoodDAO" scope="page"/>
<jsp:useBean id="gpdao" class="course.GwangjinPlaceDAO" scope="page"/>
<jsp:useBean id="idao" class="course.ImgDAO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css?ver=1">
</head>
<%
String location=request.getParameter("location");
if(location==null||location.equals("")){
	location="Gwangjin";
}
String localname=location.toLowerCase();
int totalCnt=gfdao.getTotalCnt();//총 게시물 수 
int totalCnt2=gpdao.getTotalCnt();
int listSize=3;//보여줄 리스트 수 
int pageSize=3;//보여줄 페이지 수
String cp_s=request.getParameter("cp");
String cp_s2=request.getParameter("cp2");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//현재 위치
if(cp_s2==null||cp_s2.equals("")){
	cp_s2="1";
}
int cp2=Integer.parseInt(cp_s2);//현재 위치

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int totalPage2=totalCnt2/listSize+1;
if(totalCnt2%listSize==0)totalPage2--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--; 

int userGroup2=cp2/pageSize;
if(cp2%pageSize==0)userGroup2--; 
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
	<article id="seoulFoodList">
		<table>
			<thead>
				<tr>
					<th>맛집</th>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
					<%
					if(userGroup!=0	){
						%>
						<a href="recomCourseGwangjin.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
						<%
					}
					for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
						%>
						&nbsp;&nbsp;<a href="recomCourseGwangjin.jsp?cp=<%=i%>&cp2=<%=cp2 %>"><%=i %></a>&nbsp;&nbsp;
						<%
						if(i==totalPage)break;
					}
					if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
						%>
						<a href="recomCourseGwangjin.jsp?cp=<%=((userGroup+1)*pageSize+1)%>">&gt;&gt;</a>
						<%
					}
					%>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<%
			ArrayList<GwangjinFoodDTO> arr=gfdao.courseList(cp, listSize);
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
				</tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					%>
					<%
					ArrayList<ImgDTO> arr2=idao.showImg(localname+"_food", arr.get(i).getIdx());
					if(arr2==null||arr2.size()==0){
						%>
						<tr>
							<td>사진이 없습니다</td>
						</tr>
						<%
					}else{
						%>
						<tr>
							<td>
								<a href="recomFoodDetailGwangjin.jsp?location=<%=location %>&idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>&cp2=<%=cp2%>">
								<img src="/semi/img/<%=localname %>/<%=arr2.get(0).getFilename()%>" width="200">
								</a>
							</td>
						</tr>
						<%
					}
					%>
					<tr>
						<td><a href="recomFoodDetailGwangjin.jsp?location=<%=location %>&idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>&cp2=<%=cp2%>"><%=arr.get(i).getRname() %></a></td>
					</tr>
					<tr>
			 			<td style="text-align: center;"><%=arr.get(i).getMenu() %></td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
	</article>
	<article id="seoulPlaceList">
		<table>
			<thead>
				<tr>
					<th>가볼만한 곳</th>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
					<%
					if(userGroup2!=0){
						%>
						<a href="recomCourseGwangjin.jsp?cp2=<%=(userGroup2-1)*pageSize+pageSize%>">&lt;&lt;</a>
						<%
					}
					for(int i=userGroup2*pageSize+1;i<=userGroup2*pageSize+pageSize;i++){
						%>
						&nbsp;&nbsp;<a href="recomCourseGwangjin.jsp?cp=<%=cp %>&cp2=<%=i%>"><%=i %></a>&nbsp;&nbsp;
						<%
						if(i==totalPage2)break;
					}
					if(userGroup2!=((totalPage2/pageSize)-(totalPage2%pageSize==0?1:0))){
						%>
						<a href="recomCourseGwangjin.jsp?cp2=<%=((userGroup2+1)*pageSize+1)%>">&gt;&gt;</a>
						<%
					}
					%>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<%
			ArrayList<GwangjinPlaceDTO> arr2=gpdao.courseList(cp2, listSize);
			if(arr==null||arr2.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
				</tr>
				<%
			}else{
				for(int i=0;i<arr2.size();i++){
					%>
					<%
					ArrayList<ImgDTO> arr3=idao.showImg(localname+"_place", arr2.get(i).getIdx());
					if(arr3==null||arr3.size()==0){
						%>
						<tr>
							<td>사진이 없습니다</td>
						</tr>
						<%
					}else{
						%>
						<tr>
							<td>
								<a href="recomCourseDetailGwangjin.jsp?location=<%=location %>&idx=<%=arr2.get(i).getIdx()%>&cp=<%=cp %>&cp2=<%=cp2%>">
								<img src="/semi/img/<%=localname %>/<%=arr3.get(0).getFilename()%>" width="200">
								</a>
							</td>
						</tr>
						<%
					}
					%>
					<tr>
						<td><a href="recomCourseDetailGwangjin.jsp?location=<%=location %>&idx=<%=arr2.get(i).getIdx()%>&cp=<%=cp %>&cp2=<%=cp2%>"><%=arr2.get(i).getPlace() %></a></td>
					</tr>
					<tr>
			 			<td style="text-align: center;"><%=arr2.get(i).getAddr()%></td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>