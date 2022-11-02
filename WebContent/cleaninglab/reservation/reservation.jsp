<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/reservation.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/reAddr.css" />
</head> 
<c:if test="${loginUser == null}">
      <script>
         alert("로그인 후 이용하세요!");
         location.replace("${cp}/user/UserLoginMain.us");
      </script>
   </c:if>
<body>

	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>
	
	<input type="hidden" id="chAddr" value="없음">
	<input type="hidden" id="newAddr" value="없음">
	
	<form id="frmType" name="frmType" enctype="multipart/form-data" method="post" >
		<input type="hidden" id="nowAddr" name="nowAddr" value="${addr.addrnum }">
		<input id="resType" name="resType" type="hidden" value="없음">
		<input id="addrnum" name="addrnum" type="hidden" value="없음">
		<input id="email" name="email" type="hidden" value="${useremail }">
		<input id="addr" name="addr" type="hidden" value="">
		<input id="addrdetail" name="addrdetail" type="hidden" value="">
		<input id="area" name="area" type="hidden" value="">
		<input id="animal" name="animal" type="hidden" value="">
		<input id="animaldetail" name="animaldetail" type="hidden" value="">
		<input id="kids" name="kids" type="hidden" value="">
		<input id="cctv" name="cctv" type="hidden" value="">
		<input id="parking" name="parking" type="hidden" value="">
		<input id="homename" name="homename" type="hidden" value="">
		<input id="phone" name="phone" type="hidden" value="">
		<input id="frontkey" name="frontkey" type="hidden" value="">
		<input id="homekey" name="homekey" type="hidden" value="">
		<input id="cleantool" name="cleantool" type="hidden" value="">
		<input id="homeway" name="homeway" type="hidden" value="">
	</form>

 	<div class="modal-fade" data-backdrop="static" data-keyboard="false" id="addAddress">
  	 	<div class="modal-dialog">
    	<div class="modal-content" id="modal-content"></div>
    	<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		</div>
		<div class="modal-body" id="modal-body" ></div>
		<div class="modal-footer">
		<button type="button" class="close" id="close" data-dismiss="modal">닫기</button>
		</div>

		</div>
	</div>

	<div class="modal-fade2" data-backdrop="static" data-keyboard="false" id="changeAddress">
		<div class="modal-dialog2">
   			<div class="modal-content"></div>
		</div>
	</div>	

	
	<div id="reOuter">
		<div id="reAddOuter">
			<input class="reAddTitle" id="reAddTitle" type="hidden" value="새 주소를 추가하거나 예약 할 주소를 선택해 주세요." readonly="readonly">
			<div id="reAddList">
			<c:if test="${addr.addrnum != null}">
				<div class="${addr.addrnum }" id="reAddName" onclick="addrChange()">[${addr.homename }]<br><br>${addr.addr } <br>${addr.addrdetail }</div>
			</c:if>
				</div>
			<div id="reAddButt"><button type="button" id="reAddButt2" >+주소찾기</button></div>
		</div>
		<a href="${cp}/cleaninglab/reservation/part.jsp" onclick="fnType('1회')"><div id="reBox"><div>1회예약</div>원하는 일정으로 1회 청소</div></a>
		<a href="${cp}/cleaninglab/reservation/part.jsp" onclick="fnType('정기')"><div id="reBox"><div>정기예약</div>원하는 주기로 정기 청소</div></a>
		<a id="part" onclick="fnType('부분')"><div id="reBox"><div>부분예약</div>화장실 냉장실 등 영역별 서비스 선택</div></a>
	</div>
	
	
	
	
	
	
	
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

	<script src="${cp}/cleaninglab/reservation/js/main.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
</body>
</html>