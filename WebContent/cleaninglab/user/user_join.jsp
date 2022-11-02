<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>일반회원 회원가입</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
</head>
<style>
.inner {
	width: 1100px;
}

input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	cursor: pointer;
	padding-left: 25px;
}

input[type=checkbox]+label:before {
	content: "";
	width: 20px;
	height: 20px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	background-color: #f7f7f7;
	border-radius: 2px;
}

input[type=checkbox]:checked+label:before {
	content: "\2714";
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 18px;
	font-weight: 600;
	color: #fff;
	background-color: #05C3DE;
	text-align: center;
}

input[type=email], input[type=password], input[type=text], input[type=tel]
	{
	width: 650px;
	height: 50px;
	font-size: 15px;
}

input[type=button] {
	width: 150px;
	height: 50px;
	font-size: 15px;
	background-color: #05C3DE;
	padding: 0px;
}

input[type=submit] {
	width: 400px;
	height: 50px;
	font-size: 15px;
	background-color: #05C3DE;
	margin-top: 18px;
	margin-left: 350px;
}

.join_text {
	text-align: center;
	padding: 15px;
}

.th {
	text-align: center;
	font-size: 18px;
	padding: 10px;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>


	<!-- section -->
	<section>
		<div class="inner">
			<div class="join_text">
				<h2>일반 회원가입</h2>
			</div>
			<c:if test="${not empty param.join}">
				<script>
					alert("회원가입을 실패했습니다! 다시 시도해 주세요...");
				</script>
			</c:if>
			<form name="joinForm" method="post" action="${cp}/user/UserJoinOk.us" onsubmit="return sendit()">
				<table style="text-align: center; padding: 10px;">
					<tr>
						<td id="result" colspan="2"></td>
					</tr>
					<tr>
						<th class="th"><label>이메일</label></th>
						<td><input type="email" name="useremail" id="useremail"
							placeholder="이메일을 입력해주세요." style="float: left"> 
							<input type="button" value="이메일 중복검사" onclick="checkEmail()"></td>
					</tr>
					<tr>
						<th class="th"><label>비밀번호</label></th>
						<td><input type="password" name="userpw" id="userpw"
							placeholder="영문,숫자,특수문자 조합(8~20자)"></td>

					</tr>
					<tr>
						<th class="th"><label>비밀번호 확인</label></th>
						<td><input type="password" name="userpw_re" id="userpw_re"
							placeholder="비밀번호 재입력"></td>

					</tr>
					<tr>
						<th class="th"><label>이름</label></th>
						<td><input type="text" name="username" id="username"
							placeholder="이름을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="th"><label>핸드폰 번호</label></th>
						<td>
							<input type = "tel" name="userphone" id="userphone" 
							placeholder="예) 010-0000-0000">
						</td>
					</tr>
					<tr>
						<th class ="th"><label>집 명칭</label></th>
						<td><input name ="homename"type = "text" placeholder="예)우리집">
					</tr>
					<tr class="zipcode_area">
						<th class="th"><label>우편번호</label></th>
						<td><input readonly name="zipcode" type="text"
							id="sample6_postcode" placeholder="우편번호"
							style="width: 200px; float: left"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>

					</tr>
					<tr class="addr_area">
						<th class="th"><label>주소</label></th>
						<td><input readonly name="addr" type="text"
							id="sample6_address" placeholder="주소"></td>

					</tr>
					<tr>
						<th class="th"><label>상세 주소</label></th>
						<td><input name="addrdetail" type="text"
							id="sample6_detailAddress" placeholder="상세주소"></td>
					</tr>
					<tr>
						<th class="th"><label>참고항목</label></th>
						<td><input readonly name="addretc" type="text"
							id="sample6_extraAddress" placeholder="참고항목"></td>
					</tr>
					<tr>
						<th class="th"><label>평수</label></th>
						<td><input name="area" type="text" id="area"
							placeholder="공급면적을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="th"><label>마케팅 및 이벤트 알림 수신 동의</label></th>
						<td>
							<div>
								<input type="checkbox" name="emailagree" value=""
									id="join_checkbox">
									<label for="join_checkbox">이메일 수신동의</label>
							</div>
							<div>
								<input type="checkbox" name="phoneagree" value=""
									id="join_checkbox2">
									<label for="join_checkbox2" style="margin-left: -15px;">
									문자 수신동의</label>

							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="가입완료"></th>
					</tr>
				</table>
			</form>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
<script>
	let cp = "${pageContext.request.contextPath}"
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/cleaninglab/user/user.js"></script>
</html>