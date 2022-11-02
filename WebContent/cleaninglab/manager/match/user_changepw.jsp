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
<title>비밀번호변경-청소연구소</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />

<style>
.nonebulletlist {
	list-style-type: none;
}

#nav .menu {
	color: black;
	font-weight: 700;
}

#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: #05C3DE;
}

.inner {
	width: 1100px;
}

#wrap {
	margin: 0 auto;
	margin-top: 10%;
}

#wrap>p {
	text-align: center;
	font-weight: bold;
}

input[type=submit] {
	width: 500px;
	margin-top: -5px;
}

.find {
	font-size: 0.7em;
	text-align: right;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header" style="background-color: #FFFFFF">
		<div class="inner">
			<a class="logo" href="${cp}/index.jsp"><img src="${cp}/cleaninglab/images/청소연구소logo.png"
				width="110" height="29"
				style="vertical-align: middle; cursor: pointer;"></a>
			<nav id="nav">
				<ul>
					<li><a class="menu" href="${cp}/cleaninglab/user/user_login.jsp">로그인</a></li>
					<li><a class="menu" href="${cp}/cleaninglab/mypage/mypage.jsp">마이페이지</a></li>
					<li><a class="menu" href="${cp}/cleaninglab/reservation/reservation.jsp">예약하기</a></li>
					<li><a class="menu" href="${cp}/cleaninglab/review/reviewlist.jsp">리얼후기</a></li>
					<li><a class="menu" href="${cp}/cleaninglab/faq/faq_list.jsp">FAQ</a></li>
					<li><a class="menu" href="${cp}/cleaninglab/event/event_list.jsp">이벤트</a>
				</ul>
			</nav>
		</div>
	</header>
	
	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="wrap">
				<p>비밀번호변경</p>
				<form name="FindPasswordForm" action="${cp}/cleaninglab/user/user_login.jsp" method="post"
					onsubmit="return sendit();">
					<input type="password" name="userpw" placeholder="새 비밀번호">
					<input type="password" name="userpwcheak" placeholder="비밀번호 확인">
					<input type="submit" value="비밀번호변경">


				</form>
			</div>
		</div>
	</div>








</body>
<script>
	let pwTag = document.FindPasswordForm.userpw;
	let pwcheakTag = document.FindPasswordForm.userpwcheak;
	function sendit() {
		if (pwTag.value == "") {
			alert("새 비밀번호를 입력하세요!");
			pwTag.focus();
			return false;
		}
		if (pwcheakTag.value == "") {
			alert("비밀번호 확인을 입력하세요!");
			pwcheakTag.focus();
			return false;
		}
		if(pwcheakTag.value != pwTag.value){
			alert("비밀번호가 일치하지 않습니다 다시 확인해주세요");
			return false;
		}
		if(pwcheakTag.value == pwTag.value){
			alert("정상적으로 비밀번호를 변경하였습니다! 변경한 비밀번호로 로그인해주세요.");
			return true;
		}
	}
	
</script>
</html>