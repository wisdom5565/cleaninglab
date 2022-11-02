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

.title {
	font-size: 40px;
	font-weight: 900;
}

.post {
	margin: 60px;
	margin-top: 0;
	width: 700px;
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

#manager_name {
	width: 100%;
}

#textarea {
	resize: none;
}

#button {
	background-color: #05C3DE;
}
.review {
	text-decoration: none;
	color: #171717;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Posts -->
			<div class="post">
				<!-- Form -->
				<h2 class="title">
					리얼후기<a href="${cp}/review/ReviewList.re" class="button alt"
						style="font-size: 15px; font-weight: 700; margin-left: 260px;">전체
						목록</a>
				</h2>
				<form method="post">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" id="manager_name">
							<input type="text" name="manager" id="manager"
								value="${review.title}" readonly/>
						</div>
						<!-- Break -->
						<div class="col-12">
							<textarea name="textarea" id="textarea" rows="17" readonly>${review.content}</textarea>
						</div>
					</div>
				</form>
			</div>
			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/faq/FAQ.fq">자주 묻는 질문</a>
				</article>
				<article>
					<a href="${cp}/cleaninglab/mypage/my_reservation2.jsp">공지사항</a>
				</article>
				<article>
					<a href="${cp}/cleaninglab/mypage/my_reservation2.jsp">문의 게시판</a>
				</article>
			</section>

		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>