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
</head>
<style>
.inner {
	width: 1100px;
}

#nav .menu {
	color: black;
	font-weight: 700;
}

#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
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
a:hover {
	cursor:pointer;
}
</style>

<body class="is-preload">
<c:set var="managername" value="${requestScope.managername}"/>
<c:if test="${edunum != 2}">
		<script>
			alert("교육 수료 후 이용 가능한 서비스입니다.");
			location.replace("${cp}/manager/ManagerMain.ma");
		</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>
	<section>
		<div class="inner">
			<div class="manager_modify_text">
				<h2>${managername}매니저님 의 매칭페이지입니다.</h2>
			</div>
			<div style="display: inline-block; padding-bottom: 80px; margin-left: 85px;">
				<a href="${cp}/cleaninglab/manager/manager_matching.jsp"> <img
					id="manager_info" src="${cp}/cleaninglab/images/find.png">
				</a>
				<h3 style="text-align: center;">매칭하기</h3>
				<input type="button" value="더보기"
					onclick="location.href='${cp}/manager/matching/matchlist.mac?workspace=${loginManager.workspace} '">
			</div>

			<div
				style="display: inline-block; padding-bottom: 80px; margin-left : 85px;">
				<a href="${cp}/cleaninglab/manager/manager_matchinghistory.jsp"><img id="manager_info"
					src="${cp}/cleaninglab/images/매니저_broom_icon.png"></a>
				<h3 style="text-align: center;">매칭내역</h3>
				<input type="button" value="더보기" onclick="location.href='${cp}/manager/matching/matchhistory.mac'">
			</div>
			<div style="display: inline-block; padding-bottom: 80px; margin-left : 85px;">
				<a href="${cp}/cleaninglab/manager/manager_progress.jsp"> <img id="manager_info"
					src="${cp}/cleaninglab/images/process.png">
				</a>
				<h3 style="text-align: center;">청소 진행 상황</h3>
				<input type="button" value="더보기" onclick="location.href='${cp}/manager/matching/progress.mac'">
			</div>
		</div>

	</section>

<!-- footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

</body>
</html>


