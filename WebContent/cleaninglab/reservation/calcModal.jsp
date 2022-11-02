<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body" id="calcM">
	<div class="reCardOuter">
		<div id="reText6">카드정보</div>
		<div class="reCnumOuter">
			<input type="text" id="reCnumIn" value="카드번호" readonly="readonly">
			<div id="reCnumIn2">
			<input type="text" id="reCnum1" maxlength="4" placeholder="0000">
			<input type="text" id="reCnum2" maxlength="4" onclick="chNum('reCnum2')" placeholder="0000">
			<input type="text" id="reCnum3" maxlength="4" onclick="chNum('reCnum3')" placeholder="0000">
			<input type="text" id="reCnum4" maxlength="4" onclick="chNum('reCnum4')" placeholder="0000">
			</div>
		</div>

		<div class="reCnumOuter2" id="reCnumOuter2">
			<input type="text" id="reCnumIn" value="유효기간" readonly="readonly">
			<input type="text" id="reCdate" maxlength="5" placeholder="월/년">
		</div>

		<div class="reCnumOuter2">
			<input type="text" id="reCnumIn" value="생년월일" readonly="readonly">
			<input type="text" id="rebirth" maxlength="6" onclick="chNum('rebirth')" placeholder="6자리">
		</div>

		<div class="reCnumOuter3">
			<input type="text" id="reCnumIn" value="비밀번호" readonly="readonly">
			<input type="text" id="reCpw" maxlength="2" onclick="chNum('reCpw')" placeholder="앞  2자리">
		</div>
	
		<div class="reCnumOuter4">
			<button type="button" id="addCardlast" onclick="addCard()">등록</button>
		</div>
	</div>
</div>
<div class="modal-footer">
<button type="button" class="close" id="close" data-dismiss="modal">닫기</button>
</div>
<script src="${cp}/cleaninglab/reservation/js/calc.js"></script>