<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>청소 연구소 매니저</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
</head>
<style>
.inner {
	width: 1100px;
}

.main_image {
	width: 100%;
	max-width: 100%;
	height: 950px;
}

.main_logo {
	position: absolute;
	top: 193px;
}

.main_text {
	position: absolute;
	top: 344px;
	left: 200px;
}

.main_button {
	position: absolute;
	top: 680px;
	size: 339px;
}

#section1 {
	background-color: #000000;
}

#section2 {
	background-color: #333333;
}

#section2>div {
	text-align: center;
}

.section2_text1 {
	padding-top: 104px;
}

.section2_text2 {
	padding: 8px;
}

#section3 {
	background-color: #F7F7F7;
	padding: 20px;
	margin: 0 auto;
}

#section3>div {
	text-align: center;
}

.section3_image {
	padding: 60px;
}

.FAQ_icon {
	width: 45px;
	height: 45px;
	margin-left: 535px;
	margin-top: 100px;
}

.last_button {
	border-radius: 8px;
	width: 195px;
	height: 55px;
	font-size: 15pt;
	background-color: #05C3DE;
}
</style>
<body class="is-preload">
	<c:if test="${not empty param.delete}">
		<script>
			alert("${param.delete}님 그동안 수고하셨습니다.")
		</script>
	</c:if>
	<c:if test="${not empty param.change}">
		<script>
			alert("비밀번호 수정을 실패했습니다. 다시 시도 해주세요.")
		</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- banner -->
	<img class="main_image"
		src="${cp}/cleaninglab/images/manager_main_image.jpg" alt="">
	<div class="inner">
		<div>
			<img class="main_logo"
				src="${cp}/cleaninglab/images/manager_main_logo.png" alt=""
				width="80px">
		</div>
		<div>
			<img class="main_text"
				src="${cp}/cleaninglab/images/manger_main_text.png" alt=""
				width="370px">
		</div>
		<div>
			<a href="${cp}/manager/ManagerJoin.ma"> <img class="main_button"
				src="${cp}/cleaninglab/images/manager_main_button.png" alt=""
				width="300px" height="64px">
			</a>
		</div>
	</div>

	<section id="section1">
		<div class="inner">
			<video preload="metadata" autoplay controls="nodownload"
				style="max-width: 1100px;">
				<source
					src="https://cleanhome-dev.s3.ap-northeast-2.amazonaws.com/video/brandsite_manager_apply.mp4"
					type="video/mp4">
			</video>
		</div>
	</section>

	<section id="section2">
		<div class="inner">
			<div>
				<img class="section2_text1"
					src="${cp}/cleaninglab/images/main_section2_text1.png">
			</div>
			<div>
				<img class="section2_text2"
					src="${cp}/cleaninglab/images/main_section2_text2.png">
			</div>
			<div>
				<img src="${cp}/cleaninglab/images/main_section2_map.png">
			</div>
			<div style="padding: 60px;">
				<a href="${cp}/manager/educate/manager_educatemain.edu"><img alt=""
					src="${cp}/cleaninglab/images/main_section2_educate_button.png"></a>
			</div>
		</div>
	</section>

	<section id="section3">
		<div class="inner">
			<div>
				<img class="section3_image"
					src="${cp}/cleaninglab/images/main_section3_text.png">
			</div>
			<div>
				<img src="${cp}/cleaninglab/images/main_section3_image.png"
					width="927px" height="276px">
			</div>
		</div>
	</section>

	<section>
		<div class="inner">
			<img src="${cp}/cleaninglab/images/FAQ_icon.png" class="FAQ_icon">
			<p
				style="font-size: 36px; text-align: center; padding: 20px; font-weight: 700;">
				자주 묻는 질문</p>
			<p style="font-size: 24px; font-weight: 700;">Q. 교육 신청 방법이 궁금해요.
			</p>
			<p style="font-size: 18px; font-weight: 200;">
				청소 연구소 전문 교육을 수료한 후에 활동하실 수 있어요.<br> 아래 [매니저 시작하기] 버튼을 눌러 교육을
				신청해주세요.<br> 교육을 수료한 후에는 청소연구소 매니저 웹 이나 앱을 통해 업무를 직접 선택해 활동합니다.<br>
			</p>
			<p style="font-size: 24px; font-weight: 700;">Q. 지원 요건이 있나요?</p>
			<p style="font-size: 18px; font-weight: 200;">
				청소 연구소는 30~67세 여성으로 대한민국 국적이거나 법률상 활동이 가능한 <br> 비자
				소지자(F2,F4,F5,F6)면 지원하실 수 있습니다.<br>
			</p>
			<hr>
			<p style="font-size: 24px; font-weight: 700;">Q. 교육은 어떻게 진행되나요?</p>
			<p style="font-size: 18px; font-weight: 200;">
				전문 강사님과 함께 실습을 포함한 직무 교육이 약 5시간 진행됩니다. 충전이 완료된 핸드폰 지참이 필요합니다.<br>
			</p>
			<hr>
			<p style="font-size: 24px; font-weight: 700;">Q. 매니저가 되면 어떻게
				일하나요?</p>
			<p style="font-size: 18px; font-weight: 200;">
				청소 연구소 매니저 웹이나 앱에서 원하는 업무를 직접 잡으실 수 있습니다.<br> 일시 및 위치, 보수 확인 후
				원하는 업무를 잡아 가능한 시간만큼 스케줄을 꾸릴 수 있습니다.<br>
			</p>
			<hr>
			<p style="font-size: 24px; font-weight: 700;">Q. 업무 보수는 언제 입금되나요?</p>
			<p style="font-size: 18px; font-weight: 200;">
				보수는 업무 다음 영업일에 입금됩니다.<br>
			</p>
			<hr>

			<div style="padding: 80px; text-align: center;">
				<button class="last_button" type="button"
					onclick="location.href ='${cp}/manager/ManagerJoin.ma'">매니저
					가입</button>
				<button class="last_button" type="button"
					onclick="location.href='${cp}/manager/ManagerLogin.ma'">로그인</button>
				<button class="last_button" type="button"
					onclick="location.href='${cp}/user/UserIndex.us'">회원 홈페이지</button>
			</div>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>
</body>
</html>