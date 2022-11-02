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
				<h1 style="width: 500px; font-weight: 700;">유료 서비스 ▼</h1>
				<p>
					기본 서비스에서 추가 비용을<br>지불하고 받을 수 있는 서비스입니다.
				</p>
			</div>
			<dl>
				<dt class="place">냉장실 청소 (부분청소 가능)</dt>
				<dd>
					<p style="font-weight: 600; font-size: 18px; color: #05C3DE;">냉장실 청소만 단독으로 서비스 받을 수 있습니다.</p>
					<ul class="service_detail">
						<li>분류된 음식물 배출</li>
						<li>냉장실 유리 선발 및 내부 청소</li>
						<li>버린 음식물 반찬통 설거지</li>
						<li>냉장고 겉면 먼지 제거</li>
					</ul>
					<p style="font-weight: 600; color: #ffa726">※ 정기 서비스 혜택</p>
					<ul class="service_detail">
						<li>냉장실 청소 무료</li>
					</ul>
					<p style="font-weight: 500; font-size: 15px;">정기 서비스를 이용하시면 매니저님과 협의 후 <br>기본 청소와 대체하여 서비스 가능합니다.
				</dd>
				<dt class="place">다림질</dt>
				<dd>
					<ul class="service_detail">
						<li>3장 내외로 간단한 일상 다림질 진행</li>
					</ul>
				</dd>
			</dl>

		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>