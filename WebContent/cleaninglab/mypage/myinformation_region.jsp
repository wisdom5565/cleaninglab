<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>내정보_지역설정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<style>
.main {
	margin-top: 100px;
	text-align: center;
	font-weight: 900;
	margin-bottom: 40px;
}

#addrdetail {
	margin-top: 10px;
}

.submit {
	display: flex;
	justify-content: center;
	margin-bottom: 300px;
}

.myaddr {
	font-weight: bold;
	text-align: left;
}

.tbl {
	display: flex;
	justify-content: center;
	margin-left: -80px;
}

.title {
	display: flex;
	justify-content: center;
	width: 200px;
	margin-top: 20px;
}

.inner {
	width: 1100px;
}
</style>
</head>


<body id="myinformation_region">
	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/user/UserLoginMain.us");
		</script>
	</c:if>
	<c:set var="username" value="${requestScope.username}" />
	<c:set var="addr" value="${requestScope.addr}" />
	<c:set var="addrdetail" value="${requestScope.addrdetail}" />

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Main -->
	<div class="inner">
		<div class="main">
			<h2 style="text-align: center">지역설정</h2>

			<form name="reAddrForm" method="post"
				action="${cp}/mypage/regionModifyOk.my" onsubmit="return readdr()">
				<div class="table-wrapper">
					<table class="tbl">
						<colgroup>
							<col width="150">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td class="title">
									<h3>주소</h3>
								</td>
								<td class="myaddr">
									<h4>${addr} ${addrdetail}&nbsp;</h4> <!-- 현재 주소 -->
								</td>
							</tr>

							<tr>
								<td class="title"><h3>변경 주소</h3></td>
								<td><input readonly id="sample6_address" type="text"
									name="region" placeholder="지역을 입력하세요"
									style="width: 350px; float: left;"> <input
									type="button" value="주소 찾기" style="background-color: #05C3DE"
									onclick="sample6_execDaumPostcode()"> <input
									id="addrdetail" type="text" name="regiondetail" value=""
									placeholder="상세주소를 입력하세요" style="width: 500px"></td>
							</tr>
						</tbody>
					</table>

					<div class="submit">
						<ul class="actions fixed">
							<li><input name="confirm" type="submit"
								style="background-color: #05C3DE" value="확인"> <input
								type="button" style="background-color: #05C3DE" value="취소"
								onclick="location.href='${cp}/mypage/MypageMain.my'"></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		let addrTag = reAddrForm.sample6_address;

		function readdr() {
			if (addrTag.value == "") {
				alert("주소를 입력해주세요!");
				addrTag.focus;
				return false;
			}
			return true;
		}

		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var region = ''; // 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						region = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						region = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample6_address").value = region;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_address").focus();
				}
			}).open();
		}
	</script>

</body>
</html>