<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>매니저 탈퇴</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
</head>
<style>
.inner {
	width: 1100px;
}

.manager_modify_text {
	margin: 0 auto;
	padding: 12px;
	text-align: center;
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

.delete_image {
	padding: 20px;
	text-align: center;
	font-size: 20px;
	font-weight: 400;
}

input[type=submit], input[type=button] {
	margin-top: 20px;
	margin-bottom: 40px;
	border-radius: 9px;
	font-size: 14px;
	background-color: #05C3DE;
}
</style>
<body class="is-preload">
	<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<section>
		<div class="inner">
			<div class="manager_modify_text">
				<h2 style="font-weight: 600">탈퇴 전 확인해주세요!</h2>
			</div>
			<div>
				<div class="delete_image">
					<img src="${cp}/cleaninglab/images/caution_icon.png"
						style="vertical-align: middle; width: 50px; height: 50px;">
					<span>주의사항</span>
				</div>
				<ul style="text-align: center; list-style: none;">
					<li>업무, 보수지급에 관련된 모든 정보가 삭제되며 한번 삭제된 내용은 복원이 불가능합니다.</li>
					<li>탈퇴 후 재가입이 제한될 수 있습니다.</li>
				</ul>
			</div>
			<form name="deleteForm" method="post"
				action="${cp}/manager/DeleteOk.mmy" onsubmit="return deleteit()">
				<div>
					<h3>[필수] 탈퇴 사유를 남겨주세요.</h3>
				</div>
				<div>
					<input type="text" id="delete_text"
						placeholder="예) 청소할 때 다시 가입하겠습니다."
						style="width: 1100px; height: 400px; margin-bottom: 20px;">
				</div>
				<div>
					<input type="checkbox" name="deleteagree" value="" id="checkbox">
					<label for="checkbox"> 위 내용 모두 확인했으며, 이에 동의합니다.</label>
				</div>
				<div style="text-align: center;">
					<input type="submit" value="탈퇴 하기"> <input type="button"
						value="돌아가기 "
						onclick="location.href='${cp}/manager/infoModify.mmy'">
				</div>
			</form>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>
</body>
<script src="${cp}/cleaninglab/manager/js/manager.js"></script>
</html>