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
<title>매니저 로그인</title>
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

#wrap {
	margin: 0 auto;
}

#wrap>p {
	text-align: center;
	font-weight: bold;
}

input[type=submit] {
	width: 500px;
	margin-top: -5px;
	background-color: #05C3DE;
	border-radius: 9px;
}

.find {
	font-size: 0.7em;
	text-align: right;
}
</style>
</head>
<body class="is-preload">
	<c:if test="${not empty param.login}">
		<script>
			alert("로그인 실패! 다시 시도해 주세요...");
		</script>
	</c:if>
	<c:if test="${not empty param.change}">
		<script>
			alert("비밀번호 수정을 완료했습니다.");
		</script>
	</c:if>

	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="wrap">
				<p>매니저로그인</p>
				<form name="loginForm" action="${cp}/manager/ManagerLoginOk.ma"
					method="post" onsubmit="sendit()">
					<input type="text" name="manageremail" placeholder="이메일을 입력하세요"
						value=${param.manageremail != null?param.manageremail:''}>
					<input type="password" name="managerpw" placeholder="비밀번호를 입력하세요">
					<p class="find">
						<a href="${cp}/manager/FindEmail.ma">이메일
							찾기</a> | <a href="${cp}/manager/FindPw.ma">비밀번호찾기</a>
					</p>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>








</body>

<script>
	let idTag = document.loginForm.manageremail;
	let pwTag = document.loginForm.managerpw;
	function sendit() {
		if (idTag.value == "") {
			alert("이메일을 입력하세요!");
			idTag.focus();
			return false;
		}
		if (pwTag.value == "") {
			alert("비밀번호를 입력하세요!");
			pwTag.focus();
			return false;
		}
		return true;
	}
</script>
</html>