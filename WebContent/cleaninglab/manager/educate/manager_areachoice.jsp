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
<title>교육 지역선택-청소연구소</title>
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

.reservationButton {
	text-decoration: none;
	color: black;
}

.reservationButton:hover {
	text-decoration: none;
	color: #05C3DE;
}

.nonebulletlist {
	position: relative;
	text-align: center;
}

#main {
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
<c:if test="${edunum == 2}">
		<script>
			alert("이미 교육 수료를 완료한 상태입니다!");
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

						<header style="text-align: center">
							<h2>원하는 교육 지역을 선택해주세요.</h2>
						</header>
						<ul class="nonebulletlist">
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=seoul" class="reservationButton">서울, 경기,
										인천 교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=gwangju" class="reservationButton">광주
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=daegu" class="reservationButton">대구
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=daejeon" class="reservationButton">대전
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=busan" class="reservationButton">부산
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=ulsan" class="reservationButton">울산
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
							<li>
								<p>
									<a href="${cp}/manager/educate/manager_eduschdule.edu?city=cheonan" class="reservationButton">천안
										교육장&nbsp; &nbsp; &nbsp; &nbsp;></a>
								</p>
							</li>
						</ul>
					</div>
					
					
				

				
			</div>
		</div>
	</div>

	
<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

	

</body>
</html>