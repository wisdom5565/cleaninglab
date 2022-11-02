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
				<h2 class="title">1:1 문의하기</h2>
				<form method="post" name="questionForm" action="${cp}/cleaninglab/question/my_question.jsp">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="date" id="name" value=""
								placeholder="등록 날짜" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="username" id="manager" value=""
								placeholder="고객명" readonly />
						</div>
						<div class="col-12">
							<textarea name="textarea" id="textarea" placeholder="문의 내용"
								rows="6"></textarea>
						</div>
						<!-- Break -->
						<div class="col-12">
							<ul class="actions fixed">
								<li><input type="button" value="등록" id="button"
									onclick="sendit();" /></li>
								<li><input type="button" value="취소" class="alt"
									onclick="location.href='${cp}/cleaninglab/question/my_question.jsp'" /></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
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
	const sendit = function(){
		let questionForm = document.questionForm;
		let textarea = questionForm.textarea;
		if(textarea.value == ""){
			alert("게시글 내용을 작성하세요!")
			textarea.focus();
			return false;
		}
		questionForm.submit();
	}
</script>
</body>
</html>