<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>교육예약-청소연구소</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/managerslider.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/javascript.fullPage.css" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<!--<link rel="stylesheet" href="assets/fullpage/fullpage.min.css" />
		<script type="text/javascript" src="assets/fullpage/fullpage.min.js"></script>
		-->
<script type="text/javascript"
	src="${cp}/cleaninglab/manager/js/javascript.fullPage.js"></script>
<script type="text/javascript"
	src="${cp}/js/fullpage/javascript.fullPage.min.js"></script>



<style>
.nonebulletlist {
	list-style-type: none;
}

#nav .menu {
	color: black;
	font-weight: 700;
}

#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
}

.content>p {
	padding: 0;
	margin: 0;
	font-size: 1.5em;
}

.content {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	display: inline;
}

#section0 {
	
}

#section1 {
	background-color: white;
}

.content.etcsc {
	position: absolute;
	padding: 0;
	margin-left: -8%;
	margin-top: 4%;
	text-align: center;
	font-size: 1em;
}

.dateedu {
	font-size: 1.5em;
	position: relative;
	left: 57%;
	top: -35%;
}

#section0 {
	background-color: white;
}

.textbox>img {
	max-width: 120px;
	background-position: center;
}

.textbox>p.etc {
	color: red;
	font-size: 17px;
	font-weight: bold;
}

.contenthead1 {
	position: relative;
	display: inline;
	text-align: center;
	top: -20%;
}

.contentp1>p {
	font-size: 1.3em;
	position: relative;
	margin-bottom: 1.5%;
	text-align: center;
}

.edutextbox {
	position: relative;
	padding: 10px;
	left: 70%;
	top: -35%;
	border: 1.3px solid black;
	border-radius: 9px;
}

.resvbuttonul {
	list-style-type: none;
	width: 100%;
}

.resvbuttonli>a {
	background-color: #05C3DE;
	position: absolute;
	bottom: 10%;
	left: 70%;
	border-radius: 10px;
	padding: 1%;
	text-decoration: none;
	color: white;
	font-size: 1.0em;
	font-weight: bold;
	display: inline-block;
}

.resvbuttonli>a:hover {
	
}

#tableedu {
	font-size: 0.7em;
	width: 40%;
	height: 20%;
	position: relative;
	left: 53%;
	top: -28%;
	
	
	
}

.inner {
	width: 1100px;
}

table, tr, td {
	border: none;
	background-color: white;
}
</style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- 풀페이지  -->
	<div id="fullpage">
		<div class="section" id="section0">

			<div class="content">
				<div class="contenthead1">

					<h1>교육을 예약하세요! 수료 후 업무가 가능합니다.</h1>
					<div class="contentp1">
						<p style="font-weight: 600;">
							청소연구소 매니저 교육은 <font color="#05C3DE">코로나 방역 수칙을 준수</font> 합니다.
						</p>
						<p>마스트 의무 착용 및 체온 측정</p>
						<p>손 세정제 상시 비치</p>
						<p>좌석 별 철저한 거리두기 및 강의실 소독</p>
						<p style="font-weight: bold;">
							<font color="#05C3DE">* 자세한 내용은 밑으로 스크롤 하십시오.</font>
						</p>

					</div>
				</div>
			</div>

		</div>


		<div class="section" id="section1">
			<div class="content">
				<span class="dateedu">교육 일정</span> <span class="edutextbox">서비스
					교육 1일 소요&emsp;&emsp;&emsp;총 5시간</span>
				<table style="border: none" id="tableedu">
					<tr>
						<td>1교시</td>
						<td></td>
						<td>친절한 서비스인 과정 50분</td>
						<td></td>
						<td>50분</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>휴식 및 1:1 면접</td>
						<td></td>
						<td>20분</td>
					</tr>
					<tr>
						<td>2교시</td>
						<td></td>
						<td>청소 전문가 과정 Ⅰ</td>
						<td></td>
						<td>50분</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>휴식 및 1:1 면접</td>
						<td></td>
						<td>20분</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>청소 전문가 과정 Ⅱ</td>
						<td></td>
						<td>50분</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>휴식 및 1:1 면접</td>
						<td></td>
						<td>20분</td>
					</tr>
					<tr>
						<td>3교시</td>
						<td></td>
						<td>직업인 과정 & 앱 실습</td>
						<td></td>
						<td>80분</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>(프로필 사진 촬영)</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5">청소연구소 교육은 여성인력개발센터(서대문, 관악, 서초, 인천서구)와 함께하며,
							그 외 전문 교육장에서 진행됩니다.</td>
					</tr>
				</table>

				<input type="radio" name="slide" id="slide01" checked="checked">
				<input type="radio" name="slide" id="slide02"> <input
					type="radio" name="slide" id="slide03">

				<div class="slidewrap">
					<ul class="slidelist">
						<li class="slideitem"><a>
								<div class="textbox">
									<h3 style="font-weight: 550;">
										<font color="black">1.교육예약</font>
									</h3>
									<img src="${cp}/cleaninglab/images/매니저_calender_icon.png" /> <br>
									<p></p>
									<p class="etc" style="color: #1CDFEE;">원하는 시간과 장소를 선택 후
										교육예약</p>

								</div> <img src="${cp}/cleaninglab/images/매니저_reserv1.jpg">
						</a></li>
						<li class="slideitem"><a>
								<div class="textbox">
									<h3 style="font-weight: 550;">
										<font color="black">2.교육수료</font>
									</h3>
									<img src="${cp}/cleaninglab/images/매니저_education_icon.png" />
									<p></p>
									<p class="etc" style="color: #1CDFEE;">효율적이고 표준화된 전문 청소방법
										교육</p>

								</div> <img src="${cp}/cleaninglab/images/매니저_educate1.jpg">
						</a></li>
						<li class="slideitem"><a>
								<div class="textbox">
									<h3 style="font-weight: 550;">
										<font color="black">3.업무시작</font>
									</h3>
									<img src="${cp}/cleaninglab/images/매니저_broom_icon.png" />
									<p></p>
									<p class="etc" style="color: #1CDFEE;">원할 때, 원하는 만큼 자유로운 업무</p>

								</div> <img src="${cp}/cleaninglab/images/매니저_clean1.jpg">
						</a></li>
						<div class="slide-control">
							<div>
								<label for="slide03" class="left"></label> <label for="slide02"
									class="right"></label>
							</div>
							<div>
								<label for="slide01" class="left"></label> <label for="slide03"
									class="right"></label>
							</div>
							<div>
								<label for="slide02" class="left"></label> <label for="slide01"
									class="right"></label>
							</div>
						</div>
					</ul>
				</div>



			</div>
			<ul class="resvbuttonul">
				<li class="resvbuttonli"><a href="${cp}/manager/educate/manager_areachoice.edu">교육예약하기</a>
				<li>
			</ul>


		</div>
	</div>


	<script type="text/javascript">
		fullpage.initialize('#fullpage', {
			anchors : [ 'page1', 'page2' ],
			menu : '#menu',
			navigationTooltips : [ '교육예약', '교육일정' ],
			showActiveTooltip : true,
			navigation : true,
			navigationPosition : 'right',
			slidesNavigation : 'true',
			scrollHorizontally : 'true',
			css3 : true

		});
	</script>
</body>
</html>