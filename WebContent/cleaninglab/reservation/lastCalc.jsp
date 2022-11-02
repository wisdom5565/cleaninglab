<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	
<div id="reSubOuter2">	
	<input id="gprice" name="gprice" type="hidden" value="">
	<input id="greprice" name="greprice" type="hidden" value="">
	<input id="gsize" name="gsize" type="hidden" value="${gsize }">
	<input id="nowprice" name="nowprice" type="hidden" value="">
	<input id="usepoint" name="usepoint" type="hidden" value="">
	<input id="cardSh" name="cardSh" type="hidden" value="${cardSh }">
	
	<form id="frmType3" name="frmType3" enctype="multipart/form-data" method="post" >
		<input id="giftnum" name="giftnum" type="hidden" value="">
		<input id="retype" name="retype" type="hidden" value="${rdto.retype }">
		<input id="runtime" name="runtime" type="hidden" value="${rdto.runtime }">
		<input id="addrnum" name="addrnum" type="hidden" value="${rdto.addrnum }">
		<input id="email" name="email" type="hidden" value="${rdto.email }">
		<input id="servicecnt" name="servicecnt" type="hidden" value="${rdto.servicecnt }">
		<input id="servicearea" name="servicearea" type="hidden" value="${rdto.servicearea }">
		<input id="notice" name="notice" type="hidden" value="${rdto.notice }">
		<input id="trashway" name="trashway" type="hidden" value="${rdto.trashway }">
		<input id="price" name="price" type="hidden" value="${rdto.price }">
		<input id="redate" name="redate" type="hidden" value="${rdto.redate }">
		<input id="retime" name="retime" type="hidden" value="${rdto.retime }">
		<input id="point" name="point" type="hidden" value="${udto.point }">
	</form>
	<form id="frmType4" name="frmType4" enctype="multipart/form-data" method="post" >
		<input id="cardnum" name="cardnum" type="hidden" value="${udto.cardnum }">
		<input id="cvc" name="cvc" type="hidden" value="${udto.cvc }">
		<input id="carddate" name="carddate" type="hidden" value="${udto.carddate }">
		<input id="cardpw" name="cardpw" type="hidden" value="${udto.cardpw }">
	</form>
	
	<div class="modal-fade" data-backdrop="static" data-keyboard="false" id="calcM">
  		<div class="modal-dialog">
    	<div class="modal-content" id="modal-content"></div>
		</div>
	</div>
	
	<div class="modal-fade" data-backdrop="static" data-keyboard="false" id="couponlist">
  		<div class="modal-dialog">
    	<div class="modal-content" id="modal-content"></div>
		</div>
	</div>

	<div id="re_calcInner">
		<div class="re_tttt">할인 및 결제 수단을 선택해 주세요.</div>
		<div id="reText3">쿠폰과 포인트는 결제 즉시 사용됩니다.</div>
	
		<div id="reText2">쿠폰 <div id="teBIn"><button class="buthome" id ="addcoup" type="button" onclick="addshow('c','addcoupB','addcoupline')">
			<c:choose>
               <c:when test="${gsize == 0 }">
               		추가
               </c:when>
               <c:otherwise>
               		사용
               </c:otherwise>
            </c:choose>
		</button></div></div>
		<input id="CUseNow" type="hidden" readonly="readonly" value=""/>
		<div id="Ccount">
		<c:choose>
           <c:when test="${gsize == 0 }">
               	사용가능한 쿠폰이 없습니다
           </c:when>
           <c:otherwise>
               	미사용  ${gsize }장
           </c:otherwise>
         </c:choose>
		</div>
		<input type="hidden" id="addGift" maxlength="25" class ="addcoupline"  placeholder="쿠폰코드 및 번호를 입력해주세요">
		<button class="buthome2" id ="addcoupB" type="button" disabled="disabled" onclick="addGift('쿠폰')">등록</button>
		<div class="coupBWar" id="coupBWarC"></div>
		
		<div class="pointChkB" id="reText2"> 포인트<div id="teBIn"><button class="buthome" id ="addpoint" type="button" onclick="addshow('p','addpointB','addpointline')">충전</button></div></div>
		<c:if test="${udto.point != null && udto.point > 0 }">
			<label for="pointChkB" id="pointLabel"><input id="pointChkB" type="checkbox">포인트 우선 사용</label>
		</c:if>
		<div id="Pcount">
			<c:choose>
               <c:when test="${udto.point == null || udto.point == 0 }">
               		사용가능한 포인트가 없습니다
               </c:when>
               <c:otherwise>
               		사용가능한 포인트 : ${udto.point }
               </c:otherwise>
            </c:choose>
		</div>

		
		<input type="hidden" id="addGift" class="addpointline" maxlength="25"  placeholder="포인트 번호 및 코드를 입력해주세요">
		<button class="buthome2" id ="addpointB" type="button" disabled="disabled" onclick="addGift('포인트')">등록</button>
		<div class="coupBWar" id="coupBWarP"></div>
		
		<div id="reText2">카드 <div id="teBIn"><button class="buthome" id ="addcard" type="button" onclick="cardmodal()">
			<c:choose>
               <c:when test="${udto.cardnum == null }">
               		등록
               </c:when>
               <c:otherwise>
               		변경
               </c:otherwise>
            </c:choose>
		</button></div></div>
		<c:choose>
        	<c:when test="${udto.cardnum == null }">
        		<input type="text" readonly="readonly" />
          		<div id="reText4">카드를 등록해주세요</div>
            </c:when>
            <c:otherwise>
            	<input type="text" readonly="readonly" value="카드 ${cardSh }"/>
            </c:otherwise>
       </c:choose>
		
		
		<div id="reText2">결제예정내역</div>
		<div>
			<input type="text" id="Distext" value="기본금액(${rdto.runtime }시간)" readonly="readonly" /><input type="text" class="nowprice" id="Distext2" value="${rdto.price }원" readonly="readonly" />
			<input type="hidden" id="Distext" class="ccT" value="쿠폰할인" readonly="readonly" /><input type="hidden" class="nowcouDis" id="Distext2" value="" readonly="readonly" />
			<input type="hidden" id="Distext" class="ppT" value="포인트사용" readonly="readonly" /><input type="hidden" class="nowpoDis" id="Distext2" value="" readonly="readonly" />
		</div>
		<div id="reText2">총 결제 금액</div>
		<input type="text" id="totalprice" readonly="readonly" />
	
		<button id="lastCalc" onclick="lastCalc()" value="결제하기">결제하기</button>
	</div>
</div>
	
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>
	<script src="${cp}/cleaninglab/reservation/js/last.js"></script>
	<script src="${cp}/cleaninglab/reservation/js/lastcalc.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src='<c:url value="/assets/js/bootstrap-datepicker.min.js"/>' ></script>
</body>
</html>