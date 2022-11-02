<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>내정보_정보수정</title>
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
	<c:set var="username" value="${requestScope.username}" />
	<c:set var="useremail" value="${requestScope.useremail}" />


	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Main -->
	<div class="inner">
		<div class="main">

			<!-- 정보수정 -->
			<div class="reinformation" style="text-align: center">
				<h2>정보수정</h2>
			</div>
			<form name="fixForm" method="post"
				action="${cp}/mypage/myinformationModifyOk.my"
				onsubmit="return sendit();">
				<div class="table-wrapper">
					<table class="tbl">
						<colgroup>
							<col width="200">
							<col>
						</colgroup>
						<tr>
							<td class="name">이메일</td>
							<td style="font-weight: bold">${useremail}&nbsp;</td>
						</tr>

						<tr>
							<td class="name">이름</td>
							<td style="font-weight: bold">${username}</td>
						</tr>

						<tr>
							<td class="name">핸드폰 번호</td>
							<td style="font-weight: bold"><input id="box" type="text"
								name="newphone" placeholder="전화번호를 입력해주세요 ('-'포함)" style="width: 300px">
							</td>
						</tr>

						<tr>
							<td class="name">새 비밀번호 입력</td>
							<td><input id="box" type="password" name="newpassword"
								placeholder="새비밀번호를 입력해주세요" style="width: 500px"></td>
						</tr>

						<tr>
							<td class="name">새 비밀번호 확인</td>
							<td><input id="box" type="password" name="re_newpassword"
								placeholder="새비밀번호를 재입력해주세요" style="width: 500px"></td>
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
								onclick="location.href='${cp}/cleaninglab/mypage/myinformation_main.jsp'">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


	<!-- Scripts -->
	<script>
		function sendit() {
			let fixForm = document.fixForm;
			let phoneTag = fixForm.newphone;
			let pwTag = fixForm.newpassword;
			let pw_reTag = fixForm.re_newpassword;

			if (phoneTag.value == "") {
				alert("전화번호를 입력하세요")
				phoneTag.focus;
				return false;
			}

			let phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			if (!phone_reg.test(phoneTag.value)) {
				alert("핸드폰 번호를 다시 작성 해 주세요(-포함)");
				phoneTag.focus();
				return false;
			}

			if (pwTag.value == "") {
				alert("비밀번호를 입력해주세요!");
				pwTag.focus();
				return false;
			}
			
			var pw_reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8}/;
			if (!pw_reg.test(pwTag.value)) {
				alert("비밀번호는 8자 이상, 숫자, 영어, 특수문자를 모두 포함해야 합니다!");
				pwTag.focus();
				return false;
			} else if (/(\w)\1\1\1/.test(pwTag.value)) {
				alert("같은 문자를 4번 이상 사용하실 수 없습니다!")
				pwTag.focus();
				return false;
			} else if (pwTag.value.search(/\s/) != -1) {
				alert("비밀번호는 공백을 포함할 수 없습니다!");
				pwTag.focus()
				return false;
			}
			if (pw_reTag.value == "") {
				alert("비밀번호 확인을 해주세요!");
				pw_reTag.focus();
				return false;
			}
			if (pwTag.value != pw_reTag.value) {
				alert("비밀번호 확인을 다시 해주세요!");
				pwTag.focus();
				return false;
			}
			return true;
		}
	</script>

</body>
</html>