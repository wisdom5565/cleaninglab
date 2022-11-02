<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>내 정보 수정</title>
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
	margin: 0 auto;
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

	<c:if test="${not empty param.update}">
		<c:set var="u" value="${param.update}" />
		<c:choose>
			<c:when test="${u=='PO'}">
				<script>
					alert("비밀번호 수정 완료!")
				</script>
			</c:when>
			<c:when test="${u=='PN'}">
				<script>
					alert("비밀번호 수정 실패!");
				</script>
			</c:when>
			<c:when test="${u=='BO'}">
				<script>
					alert("은행, 계좌번호 수정 완료!");
				</script>
			</c:when>
			<c:when test="${u=='BN'}">
				<script>
					alert("은행, 계좌번호 수정 실패!");
				</script>
			</c:when>
			<c:when test="${u=='AO'}">
				<script>
					alert("자택 수정 완료!");
				</script>
			</c:when>
			<c:when test="${u=='AN'}">
				<script>
					alert("자택 수정 실패!");
				</script>
			</c:when>
			<c:when test="${u=='TO'}">
				<script>
					alert("핸드폰 수정 완료!");
				</script>
			</c:when>
			<c:when test="${u=='TN'}">
				<script>
					alert("핸드폰 수정 실패!");
				</script>
			</c:when>
			<c:when test="${u=='WO'}">
				<script>
					alert("희망 근무지 수정 완료!");
				</script>
			</c:when>
			<c:when test="${u=='WN'}">
				<script>
					alert("희망 근무지 수정 실패!");
				</script>
			</c:when>
			<c:when test="${u=='NO'}">
				<script>
					alert("매니저 탈퇴 실패! 다시 시도해주세요..");
				</script>
			</c:when>
		</c:choose>
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
				<h2>${managername} 매니저님</h2>
				<h3>반갑습니다~</h3>
			</div>
			<div class="manager">
				<table>
					<tr>
						<th class="th">비밀번호</th>
						<td></td>
						<td><input type="button" value="비밀번호 수정"
							onclick="location.href='${cp}/manager/pwModify.mmy'">
							<div style="font-size: 10pt;">새로운 비밀번호로 수정할 수 있습니.</div></td>
					<tr>
						<th class="th">핸드폰 번호</th>
						<td>${managerphone}</td>
						<td><input type="button" value="번호 수정"
							onclick="location.href='${cp}/manager/phoneModify.mmy'">
							<div style="font-size: 10pt;">근무 시 연락받을 번호로 수정 할 수 있습니다.</div></td>
					</tr>
					<tr>
						<th class="th">계좌 정보</th>
						<td>${managerbank}, ${account}</td>
						<td><input type="button" value="계좌수정"
							onclick="location.href='${cp}/manager/bankModify.mmy'">
							<div style="font-size: 10pt;">페이를 지급 받을 계좌로 수정 할 수 있습니다.</div></td>
					</tr>
					<tr>
						<th class="th">자택 주소</th>
						<td>${addr} ${addrdetail}</td>
						<td><input type="button" value="주소 수정"
							onclick="location.href='${cp}/manager/addrModify.mmy'">
							<div style="font-size: 10pt;">현재 거주하는 주소를 수정 할 수 있습니다.</div></td>
					</tr>
					<tr>
						<th class="th">희망 근무지</th>
						<td>${workspace}</td>
						<td><input type="button" value="희망 근무지 수정"
							onclick="location.href='${cp}/manager/workspaceModify.mmy'">
							<div style="font-size: 10pt;">희망하는 근무지를 수정 할 수 있습니다.</div></td>
					</tr>
					<tr>
						<th class="th">매니저 탈퇴</th>
						<td></td>
						<td><input type="button" value="매니저 탈퇴"
							onclick="location.href='${cp}/manager/delete.mmy'"></td>
					</tr>
				</table>
				<div style="text-align: center; padding: 12px;">
					<input type="button" value="돌아가기"
						onclick="location.href='${cp}/manager/ManagerMypage.mmy'"
						style="width: 200px;">
				</div>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>
</body>
</html>