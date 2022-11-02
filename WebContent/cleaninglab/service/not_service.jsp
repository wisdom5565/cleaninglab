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
				<h1 style="width: 500px; font-weight: 700;">미제공 서비스 ▼</h1>
				<p>
					청소연구소에서는 다음 서비스들을 <br>제공하지 않습니다.
				</p>
			</div>
			<dl>
				<dt class="place">이사, 입주 청소 및 인테리어 전후</dt>
				<dd>
					<ul class="service_detail">
						<li>전문 도구와 2인 이상의 전문 인력이 필요한 특수 청소로 서비스 진행이 어렵습니다.</li>
					</ul>
				</dd>
				<dt class="place">사무실 및 사업장</dt>
				<dd>
					<ul class="service_detail">
						<li>사무실 및 사업장은 가정집과 업무범위가 다소 상이하여 서비스 진행이 어렵습니다.</li>
					</ul>
				</dd>
				<dt class="place">전문 수납 정리 및 옷장 정리</dt>
				<dd>
					<ul class="service_detail">
						<li>전문 도구와 다수의 전문 인력이 필요한 특수 청소로 서비스 진행이 어렵습니다.</li>
					</ul>
				</dd>
				<dt class="place">손이 닿지 않는 곳</dt>
				<dd>
					<ul class="service_detail">
						<li>매니저님이 낙상 위험이 있어 서비스 진행이 어렵습니다.</li>
					</ul>
					<p>예) 화장실 천장, 실내등, 유리창, 기타 가구 윗 부분 등</p>
				</dd>
				<dt class="place">TV, 컴퓨터 모니터 화면</dt>
				<dd>
					<ul class="service_detail">
						<li>파손, 변형 위험이 있어 진행이 어렵습니다.</li>
					</ul>
				</dd>
				<dt class="place">바닥 전체 무릎 꿇고 손걸레질</dt>
				<dd>
					<ul class="service_detail">
						<li>바닥 청소는 청소기 및 막대걸레를 이용하여 진행해드립니다.</li>
					</ul>
				</dd>
				<dt class="place">손빨래 및 빨래 삶기</dt>
				<dd>
					<ul class="service_detail">
						<li>파손, 변형 위험이 있어 진행이 어렵습니다.</li>
					</ul>
				</dd>
				<dt class="place">특수 청소</dt>
				<dd>
					<ul class="service_detail">
						<li>창문 내부/외부 청소</li>
					</ul>
					<p>매니저님이 낙상 위험이 있어 서비스 진행이 어렵습니다.</p>
					<ul class="service_detail">
						<li>결로에 의한 곰팡이 청소</li>
					</ul>
					<p>결로에 인한 곰팡이는 특구 곰팡이로 전문 도구가 필요하여 서비스 진행이 어렵습니다.</p>
					<ul class="service_detail">
						<li>커튼 및 블라인드 청소</li>
					</ul>
					<p>파손, 변형 위험이 있어 진행이 어렵습니다.</p>
					<ul class="service_detail">
						<li>전기 제품 내부 청소</li>
					</ul>
					<p>파손, 변형 위험이 있어 진행이 어렵습니다.</p>
				</dd>
				<dt class="place">청소 외의 가사업무</dt>
				<dd>
					<ul class="service_detail">
						<li>음식조리 및 상차리기</li>
						<li>아이 돌봄 서비스</li>
						<li>어르신 돌봄 서비스</li>
						<li>반려동물 돌봄 및 배설물 청소</li>
						<li>기타 생활청소와 무관한 업무</li>
					</ul>
				</dd>
			</dl>

		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>


</body>
</html>