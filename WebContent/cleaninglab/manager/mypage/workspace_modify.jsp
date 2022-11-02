<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>매니저 희망근무지 수정</title>
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

.manager_modify_text {
	padding: 12px;
	text-align: center;
}

.manager {
	padding-bottom: 80px;
}

table {
	text-align: center;
	font-size: 15pt;
	padding: 10px;
}

.th {
	text-align: center;
	font-size: 18px;
	padding: 10px;
}

input[type=button], input[type=submit] {
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
	<c:set var="managerphone" value="${requestScope.managerphone}" />
	<c:set var="managername" value="${requestScope.managername}" />
	<c:set var="addr" value="${requestScope.addr}" />
	<c:set var="addrdetail" value="${requestScope.addrdetail}" />
	<c:set var="managerbank" value="${requestScope.managerbank}" />
	<c:set var="account" value="${requestScope.manageraccount}" />
	<c:set var="workspace" value="${requestScope.workspace}" />
	
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<section>
		<div class="inner">
			<div class="manager_modify_text">
				<h2>${managername} 매니저님 희망 근무지 수정하기</h2>
			</div>
			<div class="manager">
				<form name="modifyForm" method="post"
					action="${cp}/manager/workspaceModifyOk.mmy"
					onsubmit="return workspacemodify()">
					<table>
						<tr>
							<th class="th">현재 희망 근무 지역</th>
							<td>${workspace}</td>
						</tr>
						<tr>
							<th class="th">변경할 희망 근무지역</th>
							<td><input name="workspace" type="text"
								placeholder="oo구">
						</tr>
						<tr>
							<td colspan="2"><input id="input" type="submit" value="완료">
								<input type="button" value="취소"
								onclick="location.href='${cp}/manager/infoModify.mmy'"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

</body>
<script src="${cp}/cleaninglab/manager/js/manager.js"></script>
</html>