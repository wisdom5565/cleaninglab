<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
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


.service_detail {
	list-style-type: circle;
}
.service_detail > li{
	font-weight: 540;
}
.place {
	font-weight: 700;
	font-size: 30px;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>


	<!-- Main -->
	<div id="main">
		<div class="inner">
			<div class="content">
				<h1 style="width: 500px; font-weight: 700;">기본 서비스 ▼</h1>
				<p>
					1회 및 정기 서비스에서 <br>제공하는 청소 범위입니다.
				</p>
			</div>
			<dl>
				<dt class="place">거실</dt>
				<dd>
					<ul class="service_detail">
						<li>소파와 가구 위 먼지 제거</li>
						<li>청소기 및 막대걸레로 바닥 청소</li>
						<li>테이블 위 물건 제자리 정리정돈</li>
						<li>건조된 빨래 개켜서 마무리</li>
					</ul>
				</dd>
				<dt class="place">방</dt>
				<dd>
					<ul class="service_detail">
						<li>책상, 화장대 등 가구 위 먼지 제거</li>
						<li>청소기 및 막대걸레로 바닥 청소</li>
						<li>물건 제자리 정리정돈</li>
						<li>침구 정리정돈</li>
					</ul>
				</dd>
				<dt class="place">주방</dt>
				<dd>
					<ul class="service_detail">
						<li>소파와 가구 위 먼지 제거</li>
						<li>청소기 및 막대걸레로 바닥 청소</li>
						<li>테이블 위 물건 제자리 정리정돈</li>
						<li>건조된 빨래 개켜서 마무리</li>
					</ul>
					<p style="font-weight: 600; color: #ffa726">※ 정기 서비스 혜택</p>
					<ul class="service_detail">
						<li>가스 후드 망 청소</li>
						<li>냉장실 청소</li>
					</ul>
					<p style="font-weight: 500; font-size: 15px;">
					정기 서비스를 이용하시면 매니저님과 협의 후 <br>기본 청소와 대체하여 서비스 가능합니다.</p>
				</dd>
				<dt class="place">화장실 (부분청소 가능)</dt>
				<dd>
					<ul class="service_detail">
						<li>거울 물때 제거</li>
						<li>전면 선반 청소 후 제자리 정돈</li>
						<li>수전, 세면대, 변기 등 내/외부 청소</li>
						<li>배수구 머리카락 제거 및 청소</li>
						<li>바닥 물기 제거</li>
					</ul>
				</dd>
				<dt class="place">현관</dt>
				<dd>
					<ul class="service_detail">
						<li>바닥 먼지 청소</li>
						<li>현관 앞 신발 정리정돈</li>
					</ul>
				</dd>
				<dt class="place">쓰레기 배출</dt>
				<dd>
					<ul class="service_detail">
						<li>일반 / 음식물 / 재활용 선택 시 배출</li>
					</ul>
				</dd>
				<dt class="place" style="color: #009688">▼ 무료 선택 서비스</dt>
				<dd>
				<p style="font-weight: 540;">1회 서비스 이용 시 아래 세 가지 서비스 중 하나를 선택하여 서비스를 받을 수 있습니다.</p>
				<p style="font-weight: 600;">정기 서비스 이용 시 매니저님과 협의 후 서비스 추가 진행도 가능합니다.</p>
				</dd>
				<dt class="place">세탁</dt>
				<dd>
					<ul class="service_detail">
						<li>분류된 세탁물에 한해서 1회 진행</li>
						<li>건조된 빨래 개켜서 마무리</li>
					</ul>
					<p style="font-weight: 600; color: #ffa726">※ 정기 서비스 혜택</p>
					<ul class="service_detail">
						<li>침구 세탁</li>
					</ul>
					<p style="font-weight: 500; font-size: 15px;">
					정기 서비스를 이용하시면 매니저님과 협의 후 <br>기본 청소와 대체하여 서비스 가능합니다.</p>
				</dd>
				<dt class="place">실내 창틀 먼지</dt>
				<dd>
					<ul class="service_detail">
						<li>먼지 제거 위주로 진행</li>
						<li>30분 이내 서비스 제공</li>
					</ul>
				</dd>
				<dt class="place">베란다 바닥</dt>
				<dd>
					<ul class="service_detail">
						<li>막대걸레 및 빗자루로 바닥 청소</li>
						<li>30분 이내 서비스 제공</li>
					</ul>
				</dd>
			</dl>

		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>