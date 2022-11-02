<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Apex by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>이메일찾기-청소연구소매니저</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
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

#main {
	background-color: white;
}

input[type=button] {
	width: 150px;
	height: 50px;
	font-size: 15px;
	background-color: #05C3DE;
	border-radius: 9px;
	margin-top: 20px;
}

</style>
</head>
<body class="is-preload">
	<c:set var="managername" value="${requestScope.managername}" />
	<c:set var="manageremail" value="${requestScope.manageremail}" />

	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="content">
				<div class="fisdiv">
					<header style="text-align: center">
						<h2>${managername} 매니저님의 이메일입니다.</h2>
					</header>
					<p style="text-align: center">Email : ${manageremail}</p>
					<div style="text-align: center">
						<input class="pw" type="button" value="비밀번호 찾기"
							onclick="location.href='${cp}/manager/FindPwOk.ma'"> <input
							class="login" type="button" value="로그인하러가기"
							onclick="location.href='${cp}/manager/ManagerLogin.ma'">
					</div>

				</div>
			</div>

		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>


</body>
</html>