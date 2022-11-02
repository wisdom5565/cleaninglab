<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/reservation.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/part.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
</head>
<body>
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>
	<form id="frmRes" name="frmRes" enctype="multipart/form-data" method="post" >
		<input id="retype" name="retype" type="hidden" value="${type }">
		<input id="runtime" name="runtime" type="hidden" value="">
		<input id="addrnum" name="addrnum" type="hidden" value="${addrnum }">
		<input id="email" name="email" type="hidden" value="11">
		<input id="servicecnt" name="servicecnt" type="hidden" value="">
		<input id="servicearea" name="servicearea" type="hidden" value="">
		<input id="notice" name="notice" type="hidden" value="">
		<input id="trashway" name="trashway" type="hidden" value="">
		<input id="price" name="price" type="hidden" value="">
	</form>
	
 	<div id="reSubOuter">
		<div id="reAddTitle">상품을<br>선택해 주세요.</div>
		<div>원하는 구역만 단독으로 서비스 받을 수 있습니다.</div>
		<div id="reBox" class="reB"><div>화장실 청소</div><label id="relabelB">✔</label></div>
		<div id="reBox" class="reR"><div>냉장실 청소</div><label id="relabelR">✔</label></div>
	
		<form id="calc" method="post">
		<div id="dd">
		
		
		
		</div>
		<div id="tt">
		
		
		</div>
		<br>
		<div class="reMoney">총 금액:0원</div>
		<input id="reMoney" type="hidden" value="0" readonly="readonly">
		<button id="reNextB" type="button" onclick="reNext()">다음</button>
		</form>
	</div>
	
	
		<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

	<script src="${cp}/cleaninglab/reservation/js/main.js"></script>
	<script src="${cp}/cleaninglab/reservation/js/part.js"></script>
</body>
</html>