<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>내정보_회원탈퇴</title>
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

#content {
	display: flex;
	justify-content: center;
	margin-top: 100px;
}
.column {
	background-color: #eeeeee;
}

.header_out {
	display: flex;
	justify-content: center;
}

.post {
	justify-content: center;
}

.label_box {
	display: flex;
	justify-content: center;
	margin-left: 60px;
}

.submit {
	display: flex;
	justify-content: center;
	margin-bottom: 150px;
	margin-top: 10px;
}

.board_head {
	margin-top: 25px;
}

.inner {
	width: 1100px;
}

input[type=checkbox]+label:before {
	content: "";
	width: 30px;
	height: 30px;
	margin-right: 10px;
	left: 0;
	background-color: #f7f7f7;
	border-radius: 2px;
}

input[type=checkbox]:checked+label:before {
	content: "\2714";
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 13px;
	font-weight: 600;
	color: #fff;
	background-color: #05C3DE;
	text-align: center;
}
</style>
</head>

<c:if test="${loginUser == null}">
	<script>
		alert("로그인 후 이용하세요!");
		location.replace("${cp}/user/UserLoginMain.us");
	</script>
</c:if>

<body id="myinformation_region">


	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Main -->
	<div class="main">
		<div class="inner">
			<div id="content" class="section_home">
				<h2>회원탈퇴</h2>
			</div>
			<div>
				<div class="delete_image" style="text-align: center; height: 70px">
					<img src="${cp}/cleaninglab/images/caution_icon.png"
						style="vertical-align: middle; width: 50px; height: 50px;">
				</div>
				<ul style="text-align: center; list-style: none;">
					<li>보유하고 계신 포인트와 쿠폰이 모두 삭제되어 복구가 불가능 하오니 신중하게 선택해주십시오!</li>
					<li>탈퇴를 하시면 가입 시 등록하신 모든 개인정보는 삭제되며 삭제된 데이터는 복구되지 않습니다.</li>
					<li>탈퇴 후 재가입이 제한될 수 있습니다.</li>
				</ul>
			</div>
			<section style="height: 1000px">
				<div class="column">
					<header class="header_out">
						<div class="board_head">
							<h3 style="font-weight: bold">탈퇴 이유를 알려주세요.</h3>
						</div>
					</header>
					<form name="deleteForm" method="post" action= "${cp}/mypage/deleteOk.my""onsubmit="return deleteit()">
						<div class="label_box">
							<div>
								<input type="checkbox" id="checkbox-One" name="checkbox">
								<label for="checkbox-One">서비스지역이 아니에요</label>

								<div>
									<input type="checkbox" id="checkbox-Two" name="checkbox">
									<label for="checkbox-Two">원하는 서비스가 없어요</label>

									<div>
										<input type="checkbox" id="checkbox-Three" name="checkbox">
										<label for="checkbox-Three">서비스를 받을 수 없는 사정이 생겼어요</label>

										<div>
											<input type="checkbox" id="checkbox-Four" name="etc">
											<label for="checkbox-Four">기타(직접입력)</label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<input type="text" id="delete_text"
								placeholder="예)기타 선택시 작성 해주세요"
								style="width: 1000px ; height: 400px; margin : 0 auto ">
						</div>

						<div style="text-align: center; margin-top: 20px;">
							<input type="checkbox" name="deleteAgree" id="checkbox"><label
								for="checkbox"> 위 내용 모두 확인했으며, 이에 동의합니다.</label>
						</div>

						<div class="submit">
							<ul class="actions fixed">
								<li><input type="submit" style="background-color: #05C3DE"
									value="탈퇴"> 
									<input type="button" style="background-color: #05C3DE" value="취소"
									onclick="location.href='${cp}/mypage/MypageMain.my'"></li>
							</ul>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
<script>
	let textTag = document.deleteForm.delete_text;
	let etcTag = document.deleteForm.etc;	
	let checkTag = document.deleteForm.checkbox
	let agreeTag = document.deleteForm.deleteAgree;
		
	function deleteit() {
		
		if(!checkTag.checked) {
			alert("탈퇴 이유를 골라주세요!")
			return false;
		}
		
		if(etcTag.checked) {
			if(textTag.value == "") {
				alert("탈퇴 이유를 적어주세요!");
				textTag.focus();
				return false;
			}
		}
		
		if(!agreeTag.checked) {
			alert("주의 사항을 확인하시고, 아래 동의 버튼을 눌러주세요!")
			return false;
		}
		
		return true;
	}
	
	</script>
</html>