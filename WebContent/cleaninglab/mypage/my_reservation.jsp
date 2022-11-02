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

.nothing {
	margin-top: 60px;
	margin-left: 60px;
}

#button {
	margin-left: 110px;
	font-weight: 700;
	background-color: #05C3DE;
}

.table-wrapper>table>thead>tr>th {
	font-weight: 900;
	font-size: 20px;
	color: #171717;
	text-align: center;
}

.table-wrapper>table>tbody>tr>td {
	font-weight: 500;
	text-align: center;
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

			<c:choose>
				<c:when test="${requestScope.reservation != null}">
					<div id="content">

						<section>
							<header>
								<h2 class="title">내 예약</h2>
								<p style="font-weight: 600;">예정된 청소</p>
							</header>
							<div class="row">
								<div class="col-12">

									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th width="20%">청소 날짜</th>
													<th width="50%">담당 매니저</th>
													<th width="30%" style="color: #05C3DE;">진행 상황</th>
												</tr>
											</thead>
											<c:forEach var="re" items="${requestScope.reservation}">
												<tbody>
													<tr>
														<td>${re.redate }</td>
														<td>${re.name} 매니저님</td>
														<td>${re.state}</td>
													</tr>
												</tbody>
											</c:forEach>
											<tfoot>
												<tr>
													<td colspan="2"></td>
												</tr>
											</tfoot>
										</table>
									</div>

								</div>
								<div class="col-12"></div>
							</div>
						</section>
					</div>
				</c:when>


				<c:otherwise>
					<div class="post">

						<h2 class="nothing">
							예약된 서비스가 없습니다.<br> 지금 바로 예약해보세요.
						</h2>
						<ul class="actions fixed">
							<li><a href="#" id="button" class="button alt fit">예약하기</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>

			<!-- Mini Posts (minimal) -->
			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/mypage/My_reservation.my">예정된 청소</a>
				</article>
				<article>
					<a href="${cp}/mypage/My_reservation2.my">완료된 청소</a>
				</article>
				<h5 style="font-weight: 600;">
					<br>진행 상황은 '매칭완료 > 자택방문중 > 청소중 > 청소완료' <br>순서로 표기됩니다.
				</h5>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>