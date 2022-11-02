<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<style>
.inner {
	width: 1100px;
}

#content>section {
	border-style: none;
}

#content {
	width: 500px;
}

.title {
	font-size: 40px;
	font-weight: 900;
}

#side {
	width: 400px;
	padding-top: 70px;
	margin-left: 80px;
}

#side>article>a {
	font-weight: 900;
}

#side>article>a:hover {
	color: #171717;
}

.side_menu {
	font-size: 40px;
	font-weight: 700;
}

.post {
	width: 620px;
}

#gift_text {
	font-size: 20px;
	font-weight: 700;
}

.button {
	background-color: #05C3DE;
	font-weight: 700;
}

.button:hover {
	background-color: #05C3DE;
}
</style>
</head>
<body class="is-preload">
<c:if test="${loginUser == null}">
	<script>
		alert("로그인 후 이용하세요!");
		location.replace("${cp}/user/UserLoginMain.us");
	</script>
</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>



	<div id="main">
		<div class="inner">

			<div id="content">
				<form method="post" action="${cp}/gift/GiftOk.gi" name="giftForm">
					<section>
						<header>
							<h2 class="title">선물하기 ▼</h2>
							<p style="font-weight: 600;">원하는 선물을 체크 후 아래로 스크롤하여 정보를
								입력해주세요.</p>
						</header>
						<section class="mini-posts small">
							<article>
								<div class="content">
									<input type="radio" id="radio-alpha" name="gift" value="30000">
									<label for="radio-alpha" id="gift_text">포인트 교환권 3만원</label>
									<div class="timestamp">마음을 전하는 부담 없는 선물</div>
								</div>
							</article>
							<article>
								<div class="content">
									<input type="radio" id="radio-beta" name="gift" value="50000">
									<label for="radio-beta" id="gift_text">포인트 교환권 5만원</label>
									<div class="timestamp">소중한 사람에게 보내는 온전한 하루</div>
								</div>
							</article>
							<article>
								<div class="content">
									<input type="radio" id="radio-gamma" name="gift" value="100000">
									<label for="radio-gamma" id="gift_text">포인트 교환권 10만원</label>
									<div class="timestamp">기억에 남을 최고의 선물</div>
								</div>
							</article>
						</section>
					</section>
					<section style="margin-top: 4rem; padding-top: 0;">
						<header>
							<h2 style="font-size: 25px; font-weight: 900;">
							받는 사람, 보내는 사람의 정보를 입력해주세요.</h2>
						</header>
						<article style="width: 350px;">
							<h3>보내는 사람</h3>
							<input type="text" name="name1" id="name1" value=""
								placeholder="실명을 입력해주세요." />
							<h3 style="margin-top: 2rem;">받는 사람</h3>
							<input type="text" name="name2" id="name2" value="" placeholder="이름을 입력해주세요." />
							<input type="text" name="phone" id="phone" value="" placeholder="받는 사람의 휴대폰 번호 (' - ' 포함)"
								style="margin-top: 1rem;" />
							<h5 style="margin-top: 1rem; font-weight: 700;">'나에게 선물하기'를 원하시면<br>본인의 휴대폰 번호를 입력해주세요.</h5>
							<h4 style="font-weight: 900; color: red;">선물하기는 환불이 불가한 상품입니다.</h4>
							<h5 style="margin-top: 1rem; font-weight: 700; color: #05C3DE">
							※ 반드시 받는 사람의 정보를 다시 확인해주세요.
							</h5>
						</article>
						<ul class="actions fixed">
							<li><a href="javascript:sendit();" class="button" type="submit">결제하기</a></li>
						</ul>
					</section>
				</form> 
			</div>

			<section id="side" class="mini-posts minimal">
				<header>
					<h2 class="side_menu">MENU</h2>
				</header>
				<article>
					<a href="${cp}/cleaninglab/question/my_question.jsp">문의하기</a>
				</article>
				<article>
					<a href="${cp}/point/PointView.po">포인트</a>
				</article>
				<article>
					<a href="${cp}/gift/Gift.gi">선물하기</a>
				</article>
			</section>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

<script>
	function sendit() {
		let gift = document.getElementsByName("gift");
		let name1 = document.giftForm.name1;
		let name2 = document.giftForm.name2;
		let phone = document.giftForm.phone;
		for (var i = 0; i < gift.length; i++) {
			if(gift[i].checked) {
				giftPrice = gift[i].value;
			}
		}
		if(giftPrice == undefined) {
			alert("선물하실 교환권을 선택해주세요.");
			return false;
		} 
		if(name1.value == "") {
			alert("보내는 분의 성함을 입력해주세요.");
			name1.focus();
			return false;
		}
		if(name2.value == "") {
			alert("받는 분의 성함을 입력해주세요.");
			name2.focus();
			return false;
		}
		if(phone.value == "") {
			alert("받는 분의 휴대폰 번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		let info = confirm("결제 금액 : " + giftPrice + "원" 
				+ "\n보내는 분 : " + name1.value 
				+ "\n받는 분\n이름 : " + name2.value 
				+ "\n휴대폰 번호 : " + phone.value
				+ "\n\n다음 정보가 맞다면 확인을 눌러주세요.");
		if(info) {
			if("${loginUser.cardnum}" != "") {
				if(confirm("결제하실 카드 번호 : ${loginUser.cardnum}\n\n결제하시겠습니까?")) {
					giftForm.submit();
				} else {
					return false;
				}
			} else {
				alert("등록된 카드 정보가 없습니다.\n카드를 등록해주세요.");
				location.href = "${cp}/mypage/Mypage.my";
			}
		} else {
			return false;
		} 
	}
</script>

</body>
</html>