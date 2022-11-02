<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
				<!-- Form -->
				<h2 class="title">리얼후기 수정</h2>
				<form method="post" name="reviewForm" onsubmit="return sendit();" 
				action="${cp}/review/ReviewUpdateOk.re?renum=${param.renum}&retype=${param.retype}">
							<input type="hidden" name="renum" id="renum" value="${param.servicenum}">
							<input type="hidden" name="retype" id="retype" value="${param.retype}">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<input type="text" name="redate" id="redate"
										value="${param.redate }" placeholder="청소 날짜" readonly />
								</div>
								<div class="col-6 col-12-xsmall" style="padding-left: 10px;">
									<input type="text" name="username" id="username"
										value="${loginUser.username }" placeholder="고객명" readonly />
								</div>
								<div class="col-6 col-12-xsmall" id="manager_name"
									style="padding-top: 10px;">
									<input type="text" name="name" id="name"
										value="${param.name } 매니저님" placeholder="매니저명" readonly />
								</div>
								<div class="col-6 col-12-xsmall" id="manager_name"
									style="padding-top: 15px;">
									<h4 style="font-weight: bold; margin-bottom: 15px;">제목</h4>
									<input type="text" name="title" id="title"
										value="${review.title }" placeholder="리뷰 제목"/>
								</div>
								<div class="col-12" style="padding-top: 15px;">
									<h4 style="font-weight: bold; margin-bottom: 15px;">한 줄 리뷰</h4>
									<textarea name="content" id="content" style="resize: none;"
										placeholder="한 줄 리뷰" rows="6">${review.content}</textarea>
								</div>
						<div class="col-12">
							<ul class="actions fixed">
								<li><input type="button" value="완료" id="button"
									onclick="sendit();" /></li>
								<li><input type="button" value="취소" class="alt"
									onclick="location.href='${cp}/mypage/My_reservation2.my'" /></li>
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
					<a href="${cp}/mypage/My_reservation.my">예정된 청소</a>
				</article>
				<article>
					<a href="${cp}/mypage/My_reservation2.my">완료된 청소</a>
				</article>
			</section>

		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


<script>
	const sendit = function() {
		let reviewForm = document.reviewForm;
		let content = reviewForm.content;
		let title = reviewForm.title;
		if (title.value == "") {
			alert("리뷰 제목을 작성하세요!")
			title.focus();
			return false;
		}
		if(content.value == "") {
			alert("리뷰 내용을 작성하세요!")
			content.focus();
			return false;
		}
		reviewForm.submit();
	}
</script>
</body>
</html>