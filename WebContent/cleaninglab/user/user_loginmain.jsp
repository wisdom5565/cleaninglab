<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>회원 로그인 및 가입</title>
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

input[type=button] {
	font-size: 18px;
	background-color: #05C3DE;
	width: 200px;
	height : 70px;
	font-weight: bold;
}

.loginTag, .joinTag {
	display: inline-block;
	margin-top: 200px;
	margin-bottom: 200px;
	margin-left: 220px;
}
</style>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<section>
		<div class="inner">
			<div class="loginTag">
				<input type="button" value="회원 로그인"
					onclick="location.href='${cp}/user/UserLogin.us'">
			</div>

			<div class="joinTag">
				<input type="button" value="회원가입"
					onclick="location.href='${cp}/user/UserJoin.us'">
			</div>
		</div>
	</section>

	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>