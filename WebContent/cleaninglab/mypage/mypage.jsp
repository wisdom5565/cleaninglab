<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<style>
.inner {
	width: 1100px;
}

.myinfo {
	width: 250px;
	height: 250px;
	padding: 30px;
}

.post {
	margin: 30px;
}

#button {
	width: 250px;
	font-weight: 700;
	background-color: #05C3DE;
}

#side {
	width: 400px;
	padding-top: 70px;
	margin-left: 80px;
}

.side_menu {
	font-size: 40px;
	font-weight: 900;
}

#side>article>a {
	font-weight: 900;
}

#side>article>a:hover {
	color: #171717;
}
</style>
</head>
<body class="is-preload">
	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/user/UserLoginMain.us");
		</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>


	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Posts -->
				<div class="post">
				<div class="image fit">
					<a href="${cp}/mypage/MypageMain.my"><img
						src="${cp}/cleaninglab/images/person.png" class="myinfo" alt="" /></a>
				</div>
				<h2 style="margin-left: 40px; font-weight: 700;">내 정보 수정</h2>
				<ul class="actions fixed">
					<li><a href="${cp}/mypage/MypageMain.my" id="button"
						class="button fit">더 보기</a></li>
				</ul>
			</div>
			<div class="post">
				<div class="image fit">
					<a href="${cp}/mypage/My_reservation.my"><img
						src="${cp}/cleaninglab/images/calender.png" class="myinfo" alt="" /></a>
				</div>
				<h2 style="margin-left: 75px; font-weight: 700;">내 예약</h2>
				<ul class="actions fixed">
					<li><a href="${cp}/mypage/My_reservation.my" id="button"
						class="button fit">더 보기</a></li>
				</ul>
			</div>

			<!-- Sidebar -->
			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/cleaninglab/question/my_question.jsp">문의하기</a>
				</article>
				<article>
					<a href="${cp}/point/PointView.po">포인트</a>
				</article>
				<article>
					<a href="${cp}/gift/Gift.gi">선물하기</a>
				</article>
			</section>

		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>