<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="project.SemiDAO"/>
<jsp:useBean id="dto" class="project.tourlistDTO"/>
<%@ page import="java.util.*" %>
<%@ page import="project.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동대문구</title>
<link rel="stylesheet"  type="text/css" href="guideapp/css/tour_detail.css">
</head>
<%
 	String localidx_s= request.getParameter("idx");

	int localidx=Integer.parseInt(localidx_s);
	
	int count=dao.tourlistcount(localidx);
	
	ArrayList<tourlistDTO> arr=dao.tourlist();
%>
<body>
<div id="tour_detail_first">
	<div>
		<p>상품조회수:<%=arr.get(4).getReadnum() %></p>
		<p>[서울시지원] 디자인의힘 동대문 으로 놀러오세요~</p>
	</div>
	
	<div class="div_1">
		<table>
			<tr>
				<td>
					<img src="guideapp/img/tourlist/dm_1_1.png">
					<img src="guideapp/img/tourlist/dm_1_2.png">
					<img src="guideapp/img/tourlist/dm_1_3.png">
					<img src="guideapp/img/tourlist/dm_1_4.png">
				</td>	
			</tr>
			<tr>
				<td>
					<p>&#91;서울가이드 상담문의&#93;070-1234-5678</p>
					<p>&#91;상담가능시간&#93;오전 09:00~12:00,오후 13:00~18:00|토/일,공휴일은 온라인문의만 가능</p>
				</td>
			</tr>
			<tr>
				<td>
					<a href="index.jsp?menu=guideapp&pagename=guiderequest"><input type="button" value="가이드신청"></a>
					<a href="index.jsp?menu=guideapp&pagename=guidetour_list"><input type="button" value="목록보기"></a>
				</td>
			</tr>
			<tr>
				<td><font>용산구 전문 가이드 명:김재혁</font></td>
			</tr>
		</table>
	</div>
	
	<div class="div_2">
		<fieldset>
			<legend>예약시 유의사항</legend>
			<p>-서울 투어 에서 제공하는 상품정보는 각 여행사에서 제공받은 정보입니다.</p>
			<p>-최종 상품정보는 예약전,해당 여행사에서 반드시 확인 해주시기 바랍니다.</p>
			<p>-상품의 예약 및 취소의 의무와 책임은 해당 여행사에 있습니다.</p>
			<p>-상품을 예약하시려면 상품 상담/예약 또는 전화상담을 신청해주시기바랍니다.</p>
		</fieldset>
		<table>
			<tr>
				<td>상품가</td>
				<td>성인(만 12세이상)</td>
				<td>아동(만 12세미만)</td>
				<td>유아(만 2세미만)</td>
			</tr>	
			<tr>
				<td>총 상품 가격</td>
				<td>15,900원</td>
				<td>13,900원</td>
				<td>0원</td>
			</tr>
			<tr>
				<td>기본 상품 가격</td>
				<td>15,900원</td>
				<td>13,900원</td>
				<td>0원</td>
			</tr>
			<tr>
				<td>유류할증료</td>
				<td>0원</td>
				<td>0원</td>
				<td>0원</td>
			</tr>
			<tr>
				<td>제세 공과금</td>
				<td>0원</td>
				<td>0원</td>
				<td>0원</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>출발일</td>
				<td>한국 출발 2017년 0월 0일 (요일)-Seoul Bus</td>
			</tr>
			<tr>
				<td>도착일</td>
				<td>한국 도착 2017년 0월 0일 (요일)-Seoul Bus</td>
			</tr>
			<tr>
				<td>교통편</td>
				<td>*버스</td>
			</tr>		
		</table>
	</div>
</div>

<div id="tour_detail_second">
	<div>
		<fieldset id="fieldset_1">
			<legend>상품 특징</legend>
			<div>&#60;서울의 중심&#62;, 이색 적인 볼거리와 음식점 들이 가득한 이태원과
			 1980년 이후 일반인에게 공개된 남산에 서울타워는  서울 시민의 휴식공간이자 외국인의 관공 코스로 
			 많이 소개되고 있습니다.</div>
		</fieldset>
		<table>
			<tr>
				<td>포함내역</td>
				<td>불포함 내역</td>
			</tr>
			<tr>
				<td>&#60;왕복교통비 ,입장료,여행가이드, 문화해설사 ,차량보험&#62;</td>
				<td>&#60;여행자보험, 개별 중식&#62;</td>
			</tr>
						
		</table>
	</div>
	<div>
		<p>일정표</p>
		<table>
			<thead>
				<tr>
					<td colspan="2">첫 만남!</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">1 day || 2017년 0월 0일 (요일)</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>일정</td>
				</tr>
				<tr>
					<td>서울</td>
					<td>&#91;07:00&#93; 서울시 강남구 역삼역 기업은행앞 &#40;10분전 집결&#41;
						->2호선 역삼역 3번출구
						[07:20] 역삼역 포스코 p &#38;s 건물 맞은편 버스정류장&#40;10분전 집결&#41; </td>
				</tr>
				<tr>
					<td >용산구</td>
					<td>&#91;08:00&#93; 용산구 이태원역 도착...
						-> 허기진 아침 배를 달래줄 브런치 식사[이태원 브런치맛집 더플라잉 팬 블루 방문]
						&#91;09:00&#93; 이태원 역 부근  골목 사이사이 개성이 가득한 가게 들을 눈으로 보고 즐기기~
					  	&#91;09:40&#93; 이태원 경리단길방문
						->서울시 용산구 이태원2동에 위치한 지명으로,
						 국군재정관리단 정문에서부터 남산 그랜드하얏트 호텔 방향으로 이어지는 길과 주변 골목길을 이른다. 
						2012년 국군재정관리단으로 통합된 육군중앙경리단이 있었던 곳에서 길 이름이 유래됐다.
						근처에 미군 부대가 위치해 있어 외국인들이 다수 거주하는 공간이었던 이곳은 다양한 종류와 개성을 가진 식당과 카페 등이 들어서면서 
						서울의 주요 관광 코스가 되고 있다.
						&#91;11:30&#93; 이태원 경리단길 에서 점심식사
						-> 테이스트 오브 타일랜드 &#40;
							이태원 태국음식 파는곳으로
							팟타이 소스 하나까지
							인스턴트 소스대신 타마린 열매에 피시 소스를 
							곁들여 직접만드는 가게!
							각종 소스와 허브 ,옐로 커리
							대부분의 식재료를 태국에서 직접공수하는 가게라고 합니다.&#41;
							
						&#91;14:00&#93; 서울 용산 공원
						->	골프장의 잔디와 숲, 연못 등은 그대로 두고 4.6km의 산책로와 조깅코스, 느티나무, 산사나무, 구상나무 등 80종 1만 5,000그루의 나무와 
							원두막을 갖춘 자연학습장, 태극기공원, 잔디광장 등을 새로 마련하였다. 공원 안에서 비둘기, 호로새, 야생꿩, 청둥오리, 흰뺨청둥오리, 거위 등이 서식한다.
							1년 내내 24시간 무료로 문을 열며 주변에 남산공원, 한강시민공원 이촌지구, 전쟁기념관 등의 관광지가 있다. 찾아가려면 지하철 4호선을 타고 이촌역에서 내리거나 
							국철을 타고 서빙고역이나 이촌역에서 내려 10분 정도 걸으면 된다.
							주소: 서울특별시 용산구 용산동6가 68-87
						&#91;16:00&#93;	서울 과학 동아 천문대
						->서울의 중심에서 별을 관측하고 천체투영관에서 우주를 여행할 수 있는 천문공원입니다. 
						주소:서울특별시 용산구 청파로 109
					 </td>
				</tr>
				<tr>
					<td>서울</td>
					<td>
						&#91;18:00&#93; 서울 역삼역 도착 및 해산 
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">모든 여행일정종료 !</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<div id="tour_detail_thrid">
	<p>예약시 유의사항</p>
	<table>
		<tr>
			<td>취소료 규정</td>
			<td>
				★본 상품의 버스료에 대한 비용은 예약완료후에 변경과 취소가 불가능한 상황이며, 취소시에는 별도의 취소수수료가 적용되오니 꼭 확인하시고, 예약하여 주시기 바랍니다.
				★ 예약하신 상품의 예약취소와 변경은 근무시간에 전화로만 가능합니다.
				(평일: 08:30 ~ 18:00 / 토요일, 일요일, 공휴일 휴무 제외)
				1.  여행개시 3일전까지 변경 및 취소 통보 시 » 전액 환불
				2.  여행개시 2일전까지 변경 및 취소 통보 시 » 요금의 80%환불
				3.  여행개시 1일전까지 변경 및 취소 통보 시 » 요금의 70%환불
				4.  여행 당일 취소 통보 시 » 환불없음
			</td>
		</tr>
		<tr>
			<td>유의 사항</td>
			<td>
				1. 소인요금은 만24개월 ~ 만 12세까지 어린이에게만 적용됩니다.
				2. 유아(만24개월 미만)에게는 별도의 좌석 및 식사가 제공되지 않습니다.(여행자보험 가입)
				3. 상품별 최소 출발인원 부족시 행사가 취소될 수 있으며, 출발 최소 2일전에 연락을 드립니다. (모객 미달 시 입금액 100% 환불)
				4. 탑승하실 버스의 좌석배치는 예약접수순으로 배정되며, 동행인분과는 최대한 옆자리로 배정합니다.
				5. 여행자보험 가입을 위해서 예약시 예약자를 포함한 일행 모두의 주민번호를 꼭 기입해 주시기 바랍니다.
				6. 우천시에도 행사는 진행이 됩니다.
				7. 애완동물은 여행에 참여할 수 없으니 유의하시기 바랍니다.
			</td>
		</tr>
		<tr>
			<td>준비물</td>
			<td>편한복장, 신분증 및 개별준비물, 여벌옷, 식수, 간식거리 등</td>
		</tr>
		<tr>
			<td>여권 및 비자</td>
			<td>필요 없음</td>
		</tr>
	</table>
</div>
</body>
</html>