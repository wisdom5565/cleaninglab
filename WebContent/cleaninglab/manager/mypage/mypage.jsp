<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>매니저 마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
</head>
<style>
.inner {
	width: 1100px;
}

#manager_info {
	width: 200px;
	height: 200px;
	padding: 30px;
}

input[type=button], input[type=submit] {
	border-radius: 9px;
	font-size: 14px;
	background-color: #05C3DE;
	width: 250px;
}

.manager_modify_text {
	padding: 12px;
	text-align: center;
}
</style>

<body class="is-preload">
	<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<c:set var="managerphone" value="${requestScope.managerphone}"/>
	<c:set var="managername" value="${requestScope.managername}"/>
	<c:set var="addr" value="${requestScope.addr}"/>
	<c:set var="addrdetail" value="${requestScope.addrdetail}"/>
	<c:set var="managerbank" value="${requestScope.managerbank}"/>
	<c:set var="account" value="${requestScope.manageraccount}"/>
	<c:set var="workspace" value="${requestScope.workspace}"/>
	
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>
	<section>
		<div class="inner">
			<div class="manager_modify_text">
				<h2>${managername} 매니저님의 마이페이지 입니다.</h2>
			</div>
			<div
				style="display: inline-block; padding-bottom: 80px; margin-left: 85px;">
				<a href="${cp}/manager/infoModify.mmy"> <img id="manager_info"
					src="${cp}/cleaninglab/images/manager_info_icon.png">
				</a>
				<h3>내 정보 수정하기</h3>
				<input type="button" value="더보기"
					onclick="location.href='${cp}/manager/infoModify.mmy'">
			</div>

			<div
				style="display: inline-block; padding-bottom: 80px; margin-left: 85px;">
				<a href="${cp}/manager/matching/matchingmain.mac"><img
					id="manager_info"
					src="${cp}/cleaninglab/images/manager_match_icon.png"></a>
				<h3>매칭 하기</h3>
				<input type="button" value="더보기"
					onclick="location.href='${cp}/manager/matching/matchingmain.mac'">
			</div>
			<div
				style="display: inline-block; padding-bottom: 80px; margin-left: 85px;">
				<a href=""> <img id="manager_info"
					src="${cp}/cleaninglab/images/manager_educate_icon.png">
				</a>

				<h3>교육일정 확인하기</h3>
				<input type="button" value="더보기"
					onclick="location.href='${cp}/manager/educate/cheakmyedu.edu'">
			</div>
		</div>

	</section>

	<!-- footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

</body>
</html>


