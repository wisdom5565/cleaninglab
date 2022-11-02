<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>계정정보</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
</head>
<style>
.inner {
	width: 1100px;
}

.main {
	margin-top: 50px;
	text-align: center;
}

.main>h2 {
	font-weight: 900;
}

#article {
	display: flex;
	justify-content: center;
}

#button {
	display: flex;
	justify-content: center;
	margin-left: 11px;
}

.mypage_logo {
	display: flex;
	justify-content: center;
	cursor: pointer;
	margin-bottom: 20px;
}
</style>



<body>

	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/user/UserLoginMain.us");
		</script>
	</c:if>
	-

	<c:if test="${not empty param.modify}">
		<c:set var="m" value="${param.modify}" />
		<c:choose>
			<c:when test="${m=='RO'}">
				<script>
					alert("지역 수정 완료!");
				</script>
			</c:when>
			<c:when test="${m=='RN'}">
				<script>
					alert("지역 수정 실패!");
				</script>
			</c:when>
			<c:when test="${m=='NO'}">
				<script>
					alert("탈퇴 실패!");
				</script>
			</c:when>
			<c:when test="${m=='CO'}">
				<script>
					alert("카드 수정 완료!");
				</script>
			</c:when>
			<c:when test="${m=='CN'}">
				<script>
					alert("카드 수정 실패!");
				</script>
			</c:when>
			<c:when test="${m=='MO'}">
				<script>
					alert("정보 수정 성공!");
				</script>
			</c:when>
			<c:when test="${m=='MN'}">
				<script>
					alert("정보 수정 실패!");
				</script>
			</c:when>
		</c:choose>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Main -->
	<div class="inner">
		<div class="main">
			<h2>계정정보</h2>
			<br>
			<section>
				<section class="mini-posts small">
					<!-- 정보수정 -->
					<article id="article">
						<div class="col-6 col-12-small" style="background-color: #FFFFFF">
							<div class="submit">
								<h2 style="text-align: center">정보수정</h2>
								<a class="mypage_logo" href="${cp}/mypage/informationModify.my">
									<img src="${cp}/cleaninglab/images/pencil_icon.png" width="90"
									height="80" style="margin-left: 10px;">
								</a>

								<ul class="actions fixed">
									<li><a href="${cp}/mypage/informationModify.my"><input
											type="submit" id="button" style="background-color: #05C3DE"
											value="수정"></a></li>
								</ul>
							</div>
						</div>
					</article>

					<!-- 지역수정 -->
					<article id="article">
						<div class="col-6 col-12-small">
							<div class="submit">
								<h2 style="text-align: center">지역설정</h2>

								<a class="mypage_logo" href="${cp}/mypage/regionModify.my">
									<img src="${cp}/cleaninglab/images/location_icon.png"
									width="90" height="80">
								</a>
								<ul class="actions fixed">
									<li><a href="${cp}/mypage/regionModify.my"><input
											type="submit" id="button" style="background-color: #05C3DE"
											value="수정"></a></li>
								</ul>
							</div>
						</div>
					</article>

					<!-- 카드수정 -->
					<article id="article">
						<div class="col-6 col-12-small">
							<div class="submit">
								<h2 style="text-align: center">카드설정</h2>

								<a class="mypage_logo" href="${cp}/mypage/cardModify.my"> <img
									src="${cp}/cleaninglab/images/card_icon.png" width="90"
									height="80"></a>
								<ul class="actions fixed">
									<li><a href="${cp}/mypage/cardModify.my"><input
											type="submit" id="button" style="background-color: #05C3DE"
											value="수정"></a></li>
								</ul>
							</div>
						</div>
					</article>

					<!-- 회원탈퇴 -->
					<article id="article">
						<div class="col-6 col-12-small">
							<div class="submit" style="height: 300px">
								<h2 style="text-align: center">회원탈퇴</h2>
								<a class="mypage_logo" href="${cp}/mypage/delete.my"> <img
									src="${cp}/cleaninglab/images/delete_icon.png" width="70"
									height="70"></a>

								<ul class="actions fixed">
									<li><a href="${cp}/mypage/delete.my"><input
											type="submit" id="button" style="background-color: #05C3DE"
											value="탈퇴"></a></li>
								</ul>
							</div>
						</div>
					</article>
			
					 <article id="article">
						<div class="col-6 col-12-small">
							<ul class="actions fixed">
								<li><a href="${cp}/mypage/Mypage.my"><input
										type="submit" id="button" style="background-color: #05C3DE"
										value="돌아가기"></a></li>
							</ul>
						</div>
					</article> 
				</section>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>