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

.review {
	text-decoration: none;
	color: #171717;
}

.post {
	width: 620px;
}

.nothing {
	margin-top: 60px;
	margin-left: 60px;
}

#button {
	font-weight: 700;
	background-color: #05C3DE;
}
.button{
	font-weight: 700;
	background-color: #05C3DE;
}
.button:hover{
	background-color: #05C3DE;
}
.table-wrapper>table>thead>tr>th {
	font-weight: 900;
	font-size: 20px;
	color: #05C3DE;
	text-align: center;
}

.table-wrapper>table>tbody>tr>td {
	font-weight: 500;
	text-align: center;
}
</style>
</head>
<body class="is-preload">

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
						<h2 class="title">
							문의하기 <a href="${cp}/cleaninglab/question/question_write.jsp" class="button alt"
								style="font-size: 15px; font-weight: 700; margin-left: 280px;">1:1 문의하기</a>
						</h2>
						<p style="font-weight: 600;">내 문의</p>
					</header>
					<div class="row">
						<div class="col-12">

							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th width="20%">등록 날짜</th>
											<th width="80%">제목</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>22.01.19</td>
											<td><a href="${cp}/cleaninglab/question/question_view.jsp" class="review">팀플 언제끝나나요?</a></td>
										</tr>
										<tr>
											<td>22.01.19</td>
											<td><a href="#" class="review">q</a></td>
										</tr>
										<tr>
											<td>22.01.19</td>
											<td><a href="#" class="review">q</a></td>
										</tr>
										<tr>
											<td>22.01.19</td>
											<td><a href="#" class="review">q</a></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"></td>
										</tr>
									</tfoot>

								</table>
								<ul class="actions fixed" style="margin-left: 280px;">
									<li><input type="button" value="뒤로가기" id="button"
									onclick="location.href='${cp}/cleaninglab/mypage/mypage.jsp'" /></li>
									<li><a href="#" class="button">전체 목록</a></li>
								</ul>
							</div>

						</div>
						<div class="col-12"></div>
					</div>
				</section>
			</div>

			<!-- Posts -->
<!-- 문의 내용이 없을 경우 -->
			<!-- <div class="post">
				
				<h2 class="nothing">예약된 서비스가 없습니다.<br>지금 바로 예약해보세요.</h2>
				<ul class="actions fixed">
					<li><a href="#" id="button" class="button alt fit">1:1 문의하기</a></li>
				</ul>
				<ul class="actions fixed">
					<li><a href="#" id="button" class="button alt fit">전체 게시판</a></li>
				</ul>
			</div> -->

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

</body>
</html>