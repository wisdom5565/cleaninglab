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
	font-size: 40px;
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

#gift_text {
	font-size: 20px;
	font-weight: 700;
}

.button {
	background-color: #05C3DE;
	font-weight: 700;
}

.button:hover {
	background-color: #05C3DE;
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
	<c:if test="${not empty param.charge}">
	<c:set var="c" value="${param.charge}" />
	<c:choose>
		<c:when test="${c=='Ok'}">
			<script>alert("포인트 충전이 완료되었습니다.");</script>
		</c:when>
		<c:when test="${c=='Not'}">
			<script>alert("포인트 충전이 되지 않았습니다. 다시 시도 해주세요.");</script>
		</c:when>
	</c:choose>
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
					<header>
						<h2 class="title">${loginUser.username}님의 포인트</h2>
					</header>
					<section class="mini-posts small">
						<article>
							<div class="content">
								<h2 class="title" name="totalpoint">${loginUser.point}P</h2>
							</div>
						</article>
						<!-- <input type="radio" id="radio-alpha" name="gift" value="3gift">
						<label for="radio-alpha" id="gift_text">포인트 우선 사용</label> -->
						<article>
							<div class="content">
								<div class="timestamp">
									<p style="font-weight: 700;">유료 ${loginUser.point}P / 무료 0P</p>
									<ul class="actions fixed">
										<li><a href="/point/PointCharge.po" class="button fit" id="point">포인트 충전</a></li>
									</ul>
									<p>
										유료 포인트란?<br>유료 포인트는 카드 결제, 포인트 교환권 등 구매로 충전된 포인트를 의미합니다.
									</p>
									<p>
										무료 포인트란?<br>무료 포인트는 별도의 구매 없이 이벤트 보상 혹은 제휴사로부터 무료 제공된
										포인트를 의미합니다.
									</p>
								</div>
							</div>
						</article>
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
				<p style="font-weight: 700; margin-top: 3rem;">포인트 유의사항</p>
				<article>
					<div class="content">
						<div class="timestamp">
							<ul>
								<li style="margin-bottom: 10px;">포인트를 사용하기 위해서는 잔여 사용 가능
									포인트가 최소 100P 이상이어야 합니다.</li>
								<li style="margin-bottom: 10px;">보유 중이신 포인트에서 소멸 일자가 빠른
									포인트부터 우선적으로 차감됩니다.</li>
								<li style="margin-bottom: 10px;">포인트 소멸 일자가 동일하면 무료 포인트 우선
									차감 후 유료 포인트를 차감합니다.</li>
								<li style="margin-bottom: 10px;">포인트는 100P 단위로 사용 가능합니다.</li>
								<li style="margin-bottom: 10px;">포인트는 유효기간 내 사용 가능합니다.</li>
								<li style="margin-bottom: 10px;">사용한 포인트는 반환, 환불 처리되지 않습니다.</li>
								<li style="margin-bottom: 10px;">등록한 포인트는 타인에게 양도, 이관할 수
									없습니다.</li>
							</ul>

						</div>
					</div>
				</article>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

<script>
</script>
</body>
</html>