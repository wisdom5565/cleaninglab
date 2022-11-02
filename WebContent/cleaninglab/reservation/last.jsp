<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cp" value="${pageContext.request.contextPath}"/>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/reservation.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/part.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/reAddr.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/reservation/css/last.css" />
</head>
<body>
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>
	
	<input id="keyF" type="hidden" value="addr">
	<input id="keyF2" type="hidden" value="addr">
	<input id="chAddr" type="hidden" value="${rdto.addrnum }">
	<input id="newAddr" type="hidden" value="없음">
	
	<form id="frmType2" name="frmType2" enctype="multipart/form-data" method="post" >
		<input id="retype" name="retype" type="hidden" value="${rdto.retype }">
		<input id="runtime" name="runtime" type="hidden" value="${rdto.runtime }">
		<input id="addrnum" name="addrnum" type="hidden" value="${rdto.addrnum }">
		<input id="email" name="email" type="hidden" value="${rdto.email }">
		<input id="servicecnt" name="servicecnt" type="hidden" value="${rdto.servicecnt }">
		<input id="servicearea" name="servicearea" type="hidden" value="${rdto.servicearea }">
		<input id="notice" name="notice" type="hidden" value="${rdto.notice }">
		<input id="trashway" name="trashway" type="hidden" value="${rdto.trashway }">
		<input id="price" name="price" type="hidden" value="${rdto.price }">
		
		<input id="redate" name="redate" type="hidden" value="">
		<input id="retime" name="retime" type="hidden" value="">
	</form>	
	<form id="frmType" name="frmType" enctype="multipart/form-data" method="post" >	
		<input id="addrnum2" name="addrnum" type="hidden" value="${rdto.addrnum }">
		<input id="addr" name="addr" type="hidden" value="${adto.addr }">
		<input id="addrdetail" name="addrdetail" type="hidden" value="${adto.addrdetail }">
		<input id="area" name="area" type="hidden" value="${adto.area }">
		<input id="animal" name="animal" type="hidden" value="${adto.animal }">
		<input id="animaldetail" name="animaldetail" type="hidden" value="${adto.animaldetail }">
		<input id="kids" name="kids" type="hidden" value="${adto.kids }">
		<input id="cctv" name="cctv" type="hidden" value="${adto.cctv }">
		<input id="parking" name="parking" type="hidden" value="${adto.parking }">
		<input id="homename" name="homename" type="hidden" value="${adto.homename }">
		<input id="phone" name="phone" type="hidden" value="${adto.phone }">
		<input id="frontkey" name="frontkey" type="hidden" value="${adto.frontkey }">
		<input id="homekey" name="homekey" type="hidden" value="${adto.homekey }">
		<input id="cleantool" name="cleantool" type="hidden" value="${adto.cleantool }">
		<input id="homeway" name="homeway" type="hidden" value="${adto.homeway }">

	</form>
	
	<div class="modal-fade3" data-backdrop="static" data-keyboard="false" id="smartM">
		<div class="modal-dialog3">
   			<div class="modal-content"></div>
		</div>
	</div>	
	
	<div class="modal-fade2" data-backdrop="static" data-keyboard="false" id="addrch2">
		<div class="modal-dialog2">
   			<div class="modal-content"></div>
		</div>
	</div>	
	
	<div class="modal-fade" data-backdrop="static" data-keyboard="false" id="addc">
  	 	<div class="modal-dialog">
    	<div class="modal-content" id="modal-content"></div>
    	<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		</div>
		<div class="modal-body" id="addcT"></div>
		<div class="modal-footer">
		<button type="button" class="close" id="close" data-dismiss="modal">닫기</button>
		</div>
		</div>
	</div>
	
	<div id="reSubOuter2">
    	<div id="re_infor">
    	<div class="re_tttt">방문날짜와 시간을 선택해주세요.</div>
    	<div class="re_tttt2">스마트 매칭 시스템으로 예약됩니다. <button class="smartM" id="reSize5">?</button></div>
		<form method="post" enctype="Multipart/form-data" id="frm">
         	<div>
            	<input type="text" name="rel_dateStr" id="rel_dateStr" readonly="readonly" placeholder="방문날짜를 선택해주세요"/>
           	 	<img src="<c:url value="/cleaninglab/images/diary.png" />" id="btn_diray1"/>
            	<select name="rel_TimeStr" id="rel_TimeStr" disabled="disabled">
    				<option value="none">방문시간 선택</option>
    				<option value="14:00">14:00</option>
    				<option value="14:30">14:30</option>
    				<option value="15:00">15:00</option>
    				<option value="15:30">15:30</option>
    				<option value="16:00">16:00</option>
  				</select>
         	</div>
			<img src="<c:url value="/cleaninglab/images/reInfor.png" />" id="btn_diray2"/>
	
			<div id="reText2">집정보</div>
			
			<div id="reText3">주소<button  type="button" class="buthome" id="d">변경</button></div>
			<input class="addr" type="text" readonly="readonly" value="${adto.addr }    ${adto.addrdetail }"/>
			
   			<div id="reText3">출입방법 <button type="button" class="buthome"  id="c">변경</button></div>
			<input class="addr" type="text" readonly="readonly" value="공동현관 : ${adto.frontkey}"/>
			<input class="addr" type="text" readonly="readonly" value="개별현관 : ${adto.homekey}"/>
			
			<div id="reText3">상세정보 <button type="button" class="buthome"  id="f">변경</button></div>
			<input class="addr" id="etcIn" type="text" readonly="readonly" value="영유아 : ${adto.kids } / 주차공간 : ${adto.parking } / CCTV : ${adto.cctv }"/>
			<div id="reText4">※입력된 정보가 맞는지 확인해 주세요.틀린 정보 입력 시 서비스가 지연 될 수 있습니다.</div>
	
			<div id="reText2">서비스 선택</div>
	
			<div id="reText3">선택내역  <button type="button" class="buthome" id="chre">변경</button></div>
			
			<div id="reBox" class="reff"><div>
			<c:if test="${rdto.servicearea == '냉장고' }">
			${rdto.servicearea }청소   ${rdto.servicecnt }대
			</c:if>
			<c:if test="${rdto.servicearea == '화장실' }">
			${rdto.servicearea }청소   ${rdto.servicecnt }개
			</c:if>
			</div></div>
			
			<div id="reText3">전달사항 및 청소용품 위치</div>
			<input class="addr" id="trw" type="text" readonly="readonly" value="${rdto.trashway }"/>
	
			<div id="reText3">화장실 쓰레기 배출방법</div>
			<input class="addr" id="ni" type="text" readonly="readonly" value="${rdto.notice }"/>
	
			<div id="reText2">유의사항</div>
			<div>
			• 귀중품, 현금, 상품권 분실 및 파손 시, 보험처리가 불가능하며 이에 대해 책임 지지 않습니다. 반드시 미리 안전한 곳에 보관해 주세요.<br>
			• 미술품, 골동품 등의 가치환산이 어려운 제품은 파손사고 발생 시 보험 처리가 불가합니다. 서비스 진행 전 매니저님께 별도로 주의해달라고 말씀해 주시거 나 앱에 기재해 주세요.
			• 반려동물이 있는 경우 안전장치를 해주세요.<br>
			• 6시간 이상 서비스의 경우 매니저님께 간단한 점심 제공을 부탁드립니다.<br>
			• 서비스 당일 고객님과 연락이 닿지 않아 입실하지 못하는 경우 30분 대기 후<br>
			    철수합니다. 미리 출입방법을 꼭 확인해 주세요. (당일 취소로 30% 취소수수료 부과)<br>
			• 오염도가 매우 심한 경우, 매니저님의 판단에 따라 서비스를 제공하지 못할 수 있습니다.<br>
			• 서비스 전날 6시 이후부터는 결제금액의 30%
			    시작 후에는 100%의 취소 수수료가 발생합니다. 취소 수수료 정책안내
			    정기 할인은 서비스를 최소 2회 이상 받으셔야 적용됩니다. 1회만 받고 정기 서비스를 취소하시는 경우 정기 할인액 만큼의 위약금이 등록하신 카드로 자 동 결제됩니다.<br>
			 <div id="reText4"> 매니저가 직거래를 요구하면 피해 상황이 발생할 수 있으니 주의하세요. 이 경 우 즉시 고객센터로 신고해 주세요.</div>
		     <div id="reText2">위 내용을 확인하였으며 예약시 동의 하신걸로 간주합니다.</div>
			</div>
		</form>
		</div>
		<button id="reCalc" onclick="reCalc()"  value="결제하기">결제하기</button>
		<div id="re_calc">
		</div>
	
	</div>
	
	
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>
	<script src="${cp}/cleaninglab/reservation/js/last.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src='<c:url value="/assets/js/bootstrap-datepicker.min.js"/>' ></script>
</body>
</html>