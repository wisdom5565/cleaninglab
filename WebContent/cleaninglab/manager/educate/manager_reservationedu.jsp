<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Apex by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>교육상세정보-청소연구소</title>

<c:set var="cp" value="${pageContext.request.contextPath}" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />


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

.inner {
	width: 1100px;
}

#map {
	margin: 0 auto;
}



.edutable {
	font-size: 0.9em;
	width: 60%;
	height: 30%;
	position: absolute;
	left: 53%;
	display: inline-block;
}

.title {
	text-align: left;
}

#map {
	position: relative;
	right: 10px;
	display: inline-block;
}

.detailmap {
	position: absolute;
	right: 57%;
	top: 63%;
	text-align: left;
}

th, td {
	text-align: left;
}

.resvbuttonul1 {
	list-style-type: none;
	width: 100%;
}

.resvbuttonli1>a {
	background-color: #E4361B;
	position: absolute;
	top: 710px;
	right: 350px;
	border-radius: 10px;
	padding: 15px;
	text-decoration: none;
	color: white;
	font-size: 1.0em;
	font-weight: bold;
	display: inline-block;
}

.resvbuttonli1>a:hover {
	
}

.resvbuttonul {
	list-style-type: none;
	width: 100%;
}

.resvbuttonli>a {
	background-color: #05C3DE;
	position: absolute;
	top: 710px;
	right: 550px;
	border-radius: 10px;
	padding: 15px;
	text-decoration: none;
	color: white;
	font-size: 1.0em;
	font-weight: bold;
	display: inline-block;
}

.resvbuttonli>a:hover {
	
}

#main {
	margin-bottom: 10%;
}
.inner{
	width: 1100px;
}

table, tr, td {
	border: none;
	background-color: white;
}
</style>
</head>
<script type="text/javascript">
history.pushState(null, null, location.href); window.onpopstate = function () { history.go(1); };
</script>
<body class="is-preload">
<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>

<c:if test="${edunum == 2}">
		<script>
			alert("이미 모든 교육과정을 수료하셨습니다!");
			location.replace("${cp}/manager/ManagerMain.ma");
		</script>
	</c:if>
<c:if test="${edunum == null}">
		<script>
			alert("예약된 교육이 없습니다 교육 예약 페이지로 이동합니다!");
			location.replace("${cp}/manager/educate/manager_educatemain.edu");
		</script>
	</c:if>
<c:if test="${edunum == 0}">
		<script>
			alert("예약된 교육이 없습니다 교육 예약 페이지로 이동합니다!");
			location.replace("${cp}/manager/educate/manager_educatemain.edu");
		</script>
	</c:if>
<c:if test="${not empty param.change}">
		<script>
			alert("예약변경 실패! 다시 시도해 주세요...");
		</script>
</c:if>
<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="content">
					<div class="fisdiv">
						<h2 class="title">
							교육장에서<br>${EduDetail.edudate }에 뵙겠습니다.
						</h2>
						<div id="map" style="width: 500px; height: 300px;"></div>

						<table class="edutable">
							<tr>
								<td>교육일시</td>
								<td></td>
								<td>${EduDetail.edudate }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>${EduDetail.edutime }</td>
							</tr>
							<tr>
								<td>준비물</td>
								<td></td>
								<td>핸드폰, 신분증, 통장사본</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><font size="2em">(회사와의 첫 만남인 만큼 단정한 모습으로
										참석부탁드립니다.)</font></td>
							</tr>
							<tr>
								<td>교육장소</td>
								<td></td>
								<td>${EduDetail.location[0] }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>${EduDetail.location[1] }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td colspan="3" rowspan="2">${EduDetail.parking }</td>
							</tr>


						</table>
						<ul class="resvbuttonul">
							<li class="resvbuttonli"><a href="${cp}/manager/educate/changeeduresv.edu">교육
									예약 변경</a>
							<li>
						</ul>
						<ul class="resvbuttonul1">
							<li class="resvbuttonli1"><a href="${cp}/manager/educate/deleteeduresv.edu">교육
									예약 취소</a>
							<li>
						</ul>

					</div>
			</div>
		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

	

</body>
<script type="text/javascript">
function noBack(){window.history.forward();}

</script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2c648805ed10fc36ec7e788ae680de2"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(${EduDetail.mappoint }), // 지도의 중심좌표
		level : 2, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP
	// 지도종류
	};

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker(
			{
				position : new kakao.maps.LatLng(${EduDetail.mappoint }), // 마커의 좌표
				map : map
			// 마커를 표시할 지도 객체
			});
	/*history.pushState(null,null,location.href);
	window.onpopstate = function(event){
		history.go(1);
	};*/
</script>
 


</html>