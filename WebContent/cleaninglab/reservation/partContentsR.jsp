<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reRR">
	<div id="reAddTitle">냉장고 청소</div>
	<div> 미리 분류된 반찬통의 음식물 배출 및 설거지와 냉장실 내부 청소를 제공합니다</div>
	<button id="reInfor">자세히 ></button>

	<div id="reText"><br>🕓소요시간 </div>
	<div class="reTimeR" id="reSubText"> 3시간 </div>
	<input type="hidden" id="reTimeR" value="3" readonly="readonly">

	<div id="reText"><br>냉장고 대수 </div>

	<div id="reNum">
		<button type="button" id="reminus" onclick="fnMinus2()">-</button>
		<input type="text" id="reCountR" value="1" readonly="readonly">
		<button type="button" id="replus" onclick="fnPlus2()" value="+">+</button>
	</div>
	<div id="reSubText2">※냉동실 청소는 진행되지않습니다.</div>

	<div id="reText"><br>전달사항 및 청소용품 위치</div>
	<textarea id="trashwayR" rows="" cols="" placeholder="예)분류한 반찬은 그대로 놓아두세요."></textarea>

	<div id="reText"><br>냉장실 쓰레기 배출방법</div>
	<textarea id="noticeR" rows="" cols="" placeholder="예)지하 1층에 버려주세요."></textarea>

	<div id="reText"><br>주의사항</div>
	<ul id="reSubText">
		<li>버릴 음식은 미리 분료(표시)해주세요.<div id="reSubTextInner">서비스 전 분류된 음식물과 냉장고 청소 시 발생한 일반,재활용,음식물 쓰레기만 배출 및 정리합니다</div></li>
		<li>배수구 막힘 등 서비스 진행에 지장을 주는 문제가 있는 경우 서비스가 제한 될 수 있습니다.</li>
		<li>싱크볼을 비워주셔야 원활한 서비스 진행이 가능합니다.</li>
		<li>냉장고 위는 낙상 위험이 있어 서비스 진행이 어렵습니다.</li>
		<li>오염도에 따라 청소범위가 제한될 수 있습니다.</li>
	</ul>
	<div class="reMoneyR">45000원</div>
	<input id="reMoneyR" type="hidden" value="45000" readonly="readonly">
	<div id="reCheckF"><button type="button" id="reCheckFIn" onclick="fnCan()">취소</button><button type="button" onclick="fnRCheck()">선택</button></div>
</div>
<script src="/cleaninglab/reservation/js/part.js"></script>