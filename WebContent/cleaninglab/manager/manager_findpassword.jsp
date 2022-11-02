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
<title>비밀번호찾기-청소연구소매니저</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<script>
	let cp = "${pageContext.request.contextPath}"
</script>
<style>
.inner {
	width: 1100px;
}

input[type=submit], input[type=button] {
	width: 500px;
	margin-top: 20px;
	border-radius: 9px;
	font-size: 14px;
	background-color: #05C3DE;
}

.th {
	text-align: center;
	margin: 0 auto;
	font-size: 18px;
	padding: 20px;
	font-size: 18px;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div class="inner">

		<!-- Content -->
		<div style="text-align: center; padding: 20px;">
			<h3>비밀번호찾기</h3>
		</div>
		<form name="FindPasswordForm" action="${cp}/manager/ChangePwOk.ma"
			method="post" onsubmit="return sendit()">
			<table style="text-align: center;">
				<tr>
					<td id="result" colspan="2"></td>
				</tr>
				<tr>
					<th class="th"><label>이메일</label></th>
					<td><input type="email" name="manageremail"
						placeholder="이메일을 입력해주세요."></td>
				</tr>
				<tr>
					<th class="th"><label>핸드폰 번호</label></th>
					<td><input type="tel" name="managerphone"
						placeholder="예) 010-0000-0000"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="비밀번호 찾기"
						onclick="findPw()"></td>
				</tr>

				<tr>
					<td id="result" colspan="2"></td>
				</tr>
				<tr>
					<th class="th"><label>새 비밀번호</label></th>
					<td><input type="password" name="managerpw"
						placeholder="새 비밀번호"></td>
				</tr>
				<tr>
					<th class="th"><label>새 비밀번호 확인</label></th>
					<td><input type="password" name="managerpw_re"
						placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="비밀번호변경"></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>
</body>
<script>
	function sendit() {
		let emailTag = document.FindPasswordForm.manageremail;
		let phoneTag = document.FindPasswordForm.managerphone;
		let pwTag = document.FindPasswordForm.managerpw;
		let pw_reTag = document.FindPasswordForm.managerpw_re;
		var resultTag = document.getElementById("result");

		if (emailTag.value == "") {
			alert("이메일을 입력하세요!");
			emailTag.focus();
			return false;
		}
		if (resultTag.innerHTML == "") {
			alert("비밀번호 찾기를 시도해주세요!");
			return false;
		}
		if (resultTag.innerHTML != "비밀번호 찾기를 완료했습니다.") {
			alert("비밀번호 변경을 해주세요!");
			emailTag.focus();
			return false;
		}

		if (phoneTag.value == "") {
			alert("핸드폰 번호를 입력해 주세요!");
			phoneTag.focus();
			return false;
		}
		var phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		if (!phone_reg.test(phoneTag.value)) {
			alert("핸드폰 번호을 양식에 맞춰서 작성 해 주세요!");
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

	function findPw() {
		var manageremail = document.FindPasswordForm.manageremail.value;
		var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!email_reg.test(manageremail)) {
			alert("이메일 형식에 맞춰서 작성 해 주세요 ! 예)cleanlab17@cleaninglab.com")
			manageremail.focus();
			return false;
		}
		var resultTag = document.getElementById("result");
		var xhr = new XMLHttpRequest();
		// 통신할 곳과의 연결 통로 열기
		xhr.open("GET", cp + "/manager/FindPwOk.ma?manageremail="
				+ manageremail, true);

		// xhr의 상태가 변할 때 호출될 함수 미리 설정
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				if (xhr.status == 200 || xhr.status == 201) {
					let txt = xhr.responseText;
					// 문자열.trim() : 문자열의 양쪽에 있는 공백 제거
					txt = txt.trim();

					if (txt == "O") {
						resultTag.innerHTML = "비밀번호 찾기를 완료했습니다.";
					} else {
						resultTag.innerHTML = "비밀번호 찾기를 실패했습니다.";
					}
				}

			}
		}
		// 통신하기
		xhr.send();
	}
</script>
</html>