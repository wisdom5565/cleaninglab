<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>매니저 자택 수정</title>
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

.manager {
	padding-bottom: 80px;
}

input[type=button], input[type=submit] {
	border-radius: 9px;
	font-size: 14px;
	background-color: #05C3DE;
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

.text {
	text-align: center;
	padding: 20px;
}
</style>

<body class="is-preload">
	<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<c:set var="managername" value="${requestScope.managername}" />
	<c:set var="addr" value="${requestScope.addr}" />
	<c:set var="addrdetail" value="${requestScope.addrdetail}" />

	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<section>
		<div class="inner">
			<div class="manager_modify_text">
				<h2>${managername} 매니저님 자택 주소 수정하기</h2>
			</div>
			<div class="manager">
				<div class="text">
					<hr>
					<h3>현재 주소</h3>
					<h4>${addr} ${addrdetail}</h4>
					<hr>
				</div>
				<form name="modifyForm" method="post"
					action="${cp}/manager/addrModifyOk.mmy"
					onsubmit="return modifyaddr()">
					<table>
						<tr>
							<td colspan="2" style="padding: 20px;">새로운 주소 입력하기</td>
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
							<td colspan="2"><input type="submit" value="완료"> <input
								type="button" value="취소"
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${cp}/cleaninglab/manager/js/manager.js"></script>
</html>
</html>