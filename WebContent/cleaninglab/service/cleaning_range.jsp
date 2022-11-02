<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<style>
.inner {
	width: 1100px;
}
.cleaning_title{
	margin-left: 300px;
}

.myinfo {
	width: 250px;
	height: 250px;
	padding: 30px;
}

.post {
	margin: 60px;
	margin-top: 0;
}

#button {
	width: 250px;
	font-weight: 700;
	background-color: #FFFFFF;
}


</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>


	<!-- Main -->
	<div id="main">
				<h1 class="cleaning_title" style="font-weight: 700;">청소 범위</h1>
		<div class="inner">

			<!-- Posts -->
			<div class="post">
				<div class="image fit">
					<a href="${cp}/service/Basic_Service.se"><img src="${cp}/cleaninglab/images/free_icon.png"
						class="myinfo" alt="" /></a>
				</div>
				<h3 style="margin-left: 70px; font-weight: 550;">기본 서비스</h3>
				<ul class="actions fixed">
					<li><a href="${cp}/service/Basic_Service.se" id="button"
						class="button alt fit">더 보기</a></li>
				</ul>
			</div>
			<div class="post">
				<div class="image fit">
					<a href="${cp}/service/Charged_Service.se"><img src="${cp}/cleaninglab/images/money_icon.png"
						class="myinfo" alt="" /></a>
				</div>
				<h3 style="margin-left: 70px; font-weight: 550;">유료 서비스</h3>
				<ul class="actions fixed">
					<li><a href="${cp}/service/Charged_Service.se" id="button"
						class="button alt fit">더 보기</a></li>
				</ul>
			</div>
			<div class="post">
				<div class="image fit">
					<a href="${cp}/service/Not_Service.se"><img src="${cp}/cleaninglab/images/no_icon.png"
						class="myinfo" alt="" /></a>
				</div>
				<h3 style="margin-left: 55px; font-weight: 550;">미제공 서비스</h3>
				<ul class="actions fixed">
					<li><a href="${cp}/service/Not_Service.se" id="button"
						class="button alt fit">더 보기</a></li>
				</ul>
			</div>

		</div>
		<div class="cleaning_title">
			<h1 style="font-weight: 700;">이용 방법</h1>
			<h2>1. 홈페이지에서 서비스를 신청해주세요.</h2>
				<p>주소와 평수를 입력하면, 고객님댁 평수에 맞춰 서비스 시간이 책정됩니다.</p>
			<h2>2. 스마트 매칭 시스템으로 매칭됩니다.</h2>
				<p>예약이 완료되면 내 예약정보가 매니저님에게 자동으로 보여집니다.
					<br>일정이 가능한 매니저님이 직업 수락하시면 매칭이 완료되며, 매칭 지연 시 안내드리고 있습니다.</p>
			<h2>3. 서비스 진행상황을 확인하여 안심할 수 있습니다.</h2>
				<p>매니저님의 청소 진행상황은 청소연구소 
				<a href="${cp}/mypage/My_reservation.my" style="font-weight: 600;">'홈페이지 > 마이페이지 > 내 예약 > 예정된 청소'</a>
				에서 확인이 가능합니다.
					<br>고객님이 외출하셔도 서비스가 가능하며, 방문하신 매니저님은 서비스 메뉴얼에 맞춰 청소를 진행해드립니다.</p>
			<h2>4. 서비스 품질 향상을 위해 리뷰를 남겨주세요.</h2>
				<p>서비스 완료 후 마이페이지에서 서비스에 대한 자세한 리뷰를 작성해주세요.
					<br>보내주신 소중한 리뷰는 서비스 품질향상에 도움이 됩니다.</p>
			<ul class="actions fixed">
					<li><a href="#" id="button" class="button alt fit">예약하기</a></li>
			</ul>
		</div>
	</div>
	


	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>