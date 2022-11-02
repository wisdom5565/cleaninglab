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

#wrap {
	margin: 0 auto;
}

#wrap>p {
	text-align: center;
	font-weight: bold;
}

input[type=submit] {
	width: 500px;
	margin-top: 20px;
	background-color: #05C3DE;
	background-color: #05C3DE;
}

.find {
	font-size: 0.7em;
	text-align: right;
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
			<div id="wrap">
				<p>이메일찾기</p>
				<form name="FindEmailForm" action="${cp}/user/FindEmailOk.us"
					method="post" onsubmit="return sendit()">
					<input type="text" name="username" placeholder="이름을 입력하세요.">
					<input type="text" name="userphone"
						placeholder="핸드폰번호를 입력하세요.
					예 ) 010-0000-0000"> <input
						type="submit" value="이메일찾기">

				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>








</body>
<script>
	let nameTag = document.FindEmailForm.username;
	let phoneTag = document.FindEmailForm.userphone;
	function sendit() {
		if (nameTag.value == "") {
			alert("이름을 입력하세요!");
			nameTag.focus();
			return false;
		}
		if (phoneTag.value == "") {
			alert("휴대폰번호를 입력하세요!");
			phoneTag.focus();
			return false;
		}
		var phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		if (!phone_reg.test(phoneTag.value)) {
			alert("핸드폰 번호을 양식에 맞춰서 작성 해 주세요!");
			phoneTag.focus();
			return false;
		}
		return true;
	}
</script>
</html>