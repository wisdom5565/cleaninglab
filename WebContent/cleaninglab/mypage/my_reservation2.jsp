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

.review {
	text-decoration: none;
	color: #05C3DE;
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
	<c:if test="${not empty param.write}">
		<script>alert("리뷰 작성이 완료되었습니다.");</script>
	</c:if>
	<c:if test="${not empty param.update}">
			<script>alert("리뷰 수정이 완료되었습니다.");</script>
	</c:if>
	<c:if test="${not empty param.delete}">
			<script>alert("리뷰 삭제가 완료되었습니다.");</script>
	</c:if>

	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<div id="main">
		<div class="inner">

			<c:choose>
				<c:when test="${requestScope.reservation2 != null}">
					<div id="content">

						<section>
							<header>
								<h2 class="title">내 예약</h2>
								<p style="font-weight: 600;">완료된 청소</p>
							</header>
							<div class="row">
								<div class="col-12">

									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th width="20%">청소 날짜</th>
													<th width="45%">담당 매니저</th>
													<th width="35%">진행 상황 (리얼후기)</th>
												</tr>
											</thead>
											<c:forEach var="re" items="${requestScope.reservation2}">
												<input type="hidden" name="renum" id="renum"
													value="${re.servicenum}">
												<input type="hidden" name="retype" id="retype"
													value="${re.retype}">
												<input type="hidden" name="redate" id="redate"
													value="${re.redate}">
												<input type="hidden" name="name" id="name"
													value="${re.name}">
												<tbody>
													<tr>
														<td>${re.redate}</td>
														<td>${re.name} 매니저님</td>
														<td><a
															href="${cp}/review/MyReview.re?renum=${re.servicenum}&retype=${re.retype}&redate=${re.redate}&name=${re.name}"
															class="review">${re.state} (REVIEW)</a></td>
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
							<li><a href="#" id="button" class="button fit">예약하기</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>

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
			</section>
		</div>
	</div>

	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>