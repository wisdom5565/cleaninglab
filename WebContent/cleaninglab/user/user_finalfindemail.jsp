<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>이메일찾기-청소연구소</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
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

#main {
	background-color: white;
}

input[type=button] {
	width: 150px;
	height: 50px;
	font-size: 15px;
	background-color: #05C3DE;
	margin-top: 20px;
}
</style>
</head>
<body class="is-preload">
	<c:set var="username" value="${requestScope.username}" />
	<c:set var="useremail" value="${requestScope.useremail}" />

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>



	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="content">
				<div class="fisdiv">
					<header style="text-align: center">
						<h2>${username} 님의 이메일입니다.</h2>
					</header>
					<p style="text-align: center">Email : ${useremail}</p>
					<div style="text-align: center">
						<input class="pw" type="button" value="비밀번호 찾기"
							onclick="location.href='${cp}/user/FindPw.us'"> <input
							class="login" type="button" value="로그인하러가기"
							onclick="location.href='${cp}/user/UserLogin.us'">
					</div>

				</div>
			</div>

		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>



</body>
</html>