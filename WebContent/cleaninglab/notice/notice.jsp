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
						<h2 class="title">공지사항</h2>
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
									<c:forEach var="notice" items="${requestScope.noticelist}">
									<tbody>
										<tr>
											<td>${notice.regdate}</td>
											<td><a href="${cp}/notice/NoticeView.no?title=${notice.title}"
												class="review">${notice.title}</a></td>
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


			<!-- Mini Posts (minimal) -->
			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/faq/FAQ.fq">자주 묻는 질문</a>
				</article>
				<article>
					<a href="${cp}/notice/Notice.no">공지사항</a>
				</article>
				<article>
					<a href="#">문의 게시판</a>
				</article>
			</section>
		</div>
	</div>

	<!-- Footer -->
		<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>