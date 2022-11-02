<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>내정보_카드수정</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<style>
#nav .menu {
	color: black;
	font-weight: 700;
}

#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
}

.main {
	margin-top: 100px;
	margin-bottom: 40px;
}

.submit {
	display: flex;
	justify-content: center;
	margin-bottom: 150px;
}

.name {
	display: flex;
	justify-content: center;
	width: 200px
}

.box {
	display: flex;
	justify-content: center;
}

.tbl {
	display: flex;
	justify-content: center;
	margin-left: -100px;
}

.inner {
	width: 1100px;
}
</style>
</head>

<c:if test="${loginUser == null}">
	<script>
		alert("로그인 후 이용하세요!");
		location.replace("${cp}/user/UserLoginMain.us");
	</script>
</c:if>

<body>

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<c:set var="cardnum" value="${requestScope.cardnum}" />

	<!-- Main -->
	<div class="inner">
		<div class="main">

			<!-- 카드수정 -->
			<div class="reinformation" style="text-align: center">
				<h2>카드수정</h2>
			</div>
			<form name="cardForm" method="post"
				action="${cp}/mypage/CardModifyOk.my" onsubmit="return sendit();">
				<div class="table-wrapper">
					<table class="tbl">
						<colgroup>
							<col width="200">
							<col>
						</colgroup>
						<tr>
							<td class="name">카드번호</td>
							<td style="font-weight: bold;">
								<h4>${cardnum}</h4>
							</td>
						</tr>

						<tr>
							<td class="name">새 카드번호</td>
							<td style="font-weight: bold"><input id="box"
								name="newcardnum" type="text" placeholder="카드번호를 적어주세요."
								style="width: 300px"></td>
						</tr>

						<tr>
							<td class="name">카드날짜</td>
							<td><input id="box" name="newcarddate" type="text"
								placeholder="카드날짜를 적어주세요." style="width: 300px;"></td>
						</tr>

						<tr>
							<td class="name">생년월일</td>
							<td><input id="box" name="newcvc" type="text"
								placeholder="생년 월일 6자리를 작성해 주세요."
								onkeypress='return checkNumber(event)' style="width: 300px;">
							</td>
						</tr>

						<tr>
							<td class="name">비밀번호</td>
							<td><input id="box" name="cardpw" type="password"
								placeholder="비밀번호를 적어주세요(네자리)"
								onkeypress='return checkNumber(event)' style="width: 300px;">
							</td>
						</tr>
					</table>
					<div class="submit">
						<ul class="actions fixed">
							<li><input type="submit" style="background-color: #05C3DE"
								value="확인"></li>
						</ul>
						<div class="card" style="text-align: center; margin-left: 10px;">
							<input type="button" style="background-color: #05C3DE"
								value="돌아가기"
								onclick="location.href='${cp}/mypage/MypageMain.my'">
						</div>
					</div>
				</div>
			</form>
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
	<script>
		let cardnumTag = document.cardForm.newcardnum;
		let carddateTag = document.cardForm.newcarddate;
		let cvcTag = document.cardForm.newcvc;
		let passwordTag = document.cardForm.newpassword;

		function sendit() {
			if (cardnumTag.value == "") {
				alert("카드번호를 입력하세요 ('-'포함)")
				cardnumTag.focus;
				return false;
			}

			if (carddateTag.value == "") {
				alert("카드 날짜를 입력하세요('/'포함)")
				carddateTag.focus;
				return false;
			}

			if (cvcTag.value == "") {
				alert("생년월일을 입력하세요.(6자리)")
				cvcTag.focus;
				return false;
			}


			if (passwordTag.value == "") {
				alert("비밀번호를 입력하세요 (4자리)")
				passwordTag.focus;
				return false;
			}

			return true;
		}


	</script>

</body>
</html>