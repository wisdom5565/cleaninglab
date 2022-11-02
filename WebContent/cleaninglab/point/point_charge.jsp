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
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<style>
.inner {
	width: 1100px;
}

#content>section {
	border-style: none;
}

#content {
	width: 500px;
}

.title {
	font-size: 30px;
	font-weight: 900;
}

#side {
	width: 400px;
	padding-top: 70px;
	margin-left: 80px;
}

#side>article>a {
	font-weight: 900;
}

#side>article>a:hover {
	color: #171717;
}

.side_menu {
	font-size: 40px;
	font-weight: 700;
}

.post {
	width: 620px;
}

input[type=submit] {
	width: 200px;
	background-color: #05C3DE;
	margin-top: 40px;
	font-weight: 900;
}

input[type=submit]:hover {
	color: #05C3DE;
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

			<!-- Content -->
			<div id="content">

				<!-- Elements -->
				<section>
					<section class="mini-posts small">
						<form action="${cp}/point/PointChargeOk.po" name="pointForm"
							method="post" onsubmit="return sendit()">
							<div class="content">
								<h2 class="title">포인트 번호 혹은 코드를 입력해주세요.</h2>
								<input type="text" style="background-image: none;" name="giftnum">
							</div>
							<div class="content">
								<div class="timestamp">
									<ul class="actions fixed">
										<li><input type="submit" value="충전하기"></li>
									</ul>
								</div>
							</div>
						</form>
					</section>
				</section>
			</div>


			<!-- Mini Posts (minimal) -->
			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/cleaninglab/question/my_question.jsp">문의하기</a>
				</article>
				<article>
					<a href="${cp}/cleaninglab/point/point.jsp">포인트</a>
				</article>
				<article>
					<a href="${cp}/cleaninglab/gift/gift.jsp">선물하기</a>
				</article>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

	<script>
		let pointTag = document.pointForm.giftnum;
		function sendit() {
			if (pointTag.value == "") {
				alert("번호 혹은 코드를 입력해주세요!");
				pointTag.focus();
				return false;
			}
			confirm("충전하시겠습니까?")
			return true;
		}
	</script>
</body>
</html>