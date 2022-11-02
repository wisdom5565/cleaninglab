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
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>교육상세정보-청소연구소</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/javascript.fullPage.css" />
<script type="text/javascript" src="${cp}/cleaninglab/manager/js/javascript.fullPage.js"></script>
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

.resvbuttonul {
	list-style-type: none;
	width: 100%;
}

.resvbuttonli>a {
	background-color: #05C3DE;
	position: relative;
	top: 10px;
	left:480px;
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

th, td {
	text-align: left;
}
table, td, tr{
	background-color: white;
}

</style>
</head>
<body class="is-preload">
<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<c:if test="${edunum == 1}">
		<script>
			alert("교육 예약 내역이 있습니다 변경을 원하신다면 마이페이지에서 변경해 주세요!");
			location.replace("${cp}/manager/ManagerMain.ma");
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
						<header>
							<h2>교육 상세 정보</h2>
						</header>
						<table class="edudetailtable">
							<tr>
								<td>교육장</td>
								<td></td>
								<td>${EduDetail.location[0] }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>${EduDetail.location[1] }</td>
							</tr>
							<tr>
								<td>교육일</td>
								<td></td>
								<td>${EduDetail.edudate }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>${EduDetail.edutime }</td>
							</tr>
							<tr>
								<td>주차</td>
								<td></td>
								<td>${EduDetail.parking }</td>
							</tr>

						</table>
						<div id="map" style="width: 600px; height: 300px;"></div>
						<ul class="resvbuttonul">
							<li class="resvbuttonli"><a href="${cp}/manager/educate/manager_reservationedu.edu?edudatenum=${EduDetail.edudatenum }&&edulocation=${EduDetail.locationstr}">예약하기</a>
							<li>
						</ul>
					</div>

			</div>
		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2c648805ed10fc36ec7e788ae680de2"></script>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(${EduDetail.mappoint }), // 지도의 중심좌표
		level : 3, // 지도의 확대 레벨
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
</script>
</html>