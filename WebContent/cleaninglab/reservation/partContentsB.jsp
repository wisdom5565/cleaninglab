<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reBB">
	<div id="reAddTitle">화장실 청소</div>
	<div> 선반,수전, 세면대와 변기의 내/외부를 청소하고 바닥 물기를  제거해 마무리 합니다</div>
	<button id="reInfor">자세히 ></button>

	<div id="reText"><br>🕓소요시간 </div>
	<div class="reTimeB" id="reSubText"> 2시간 </div>
	<input type="hidden" id="reTimeB" value="2" readonly="readonly">

	<div id="reText"><br>화장실 개수 </div>

	<div id="reNum">
		<button type="button" id="reminus" onclick="fnMinus()">-</button>
		<input type="button" type="text" id="reCountB" value="2" readonly="readonly">
		<button type="button" id="replus" onclick="fnPlus()" value="+">+</button>
	</div>

	<div id="reText"><br>전달사항 및 청소용품 위치</div>
	<input id="trashwayB" placeholder="예)락스는 쓰지 말아주세요.">

	<div id="reText"><br>화장실 쓰레기 배출방법</div>
	<input id="noticeB" placeholder="예)지하 1층에 버려주세요.">

	<div id="reText"><br>주의사항</div>
	<ul id="reSubText">
		<li>배수구, 변기 막힘 등 서비스 진행에 지장을 주는 문제가 있는 경우 <br>서비스가 제한 될 수 있습니다.</li>
		<li>특수 약품 및 도구가 필요한 청소,천장 및 환풍기 청소는 제공하지 않습니다.</li>
		<li>화장실 청소 시에 발생한 일반 쓰레기만 배출가능합니다.<div id="reSubTextInner">오래된 검정 곰팡이,타일 줄눈 변색,석화질,바닥 백화 현상 특수청소로 분류되는 오염은 제거가 어려울수 있습니다.</div></li>
		<li>오염도에 따라 청소범위가 제한될 수 있습니다.</li>
	</ul>
	<div class="reMoneyB">30000원</div>
	<input id="reMoneyB" type="hidden" value="30000" readonly="readonly">
	<div id="reCheckF"><button type="button" id="reCheckFIn" onclick="fnCan()">취소</button><button type="button" onclick="fnBCheck()">선택</button></div>
</div>
<script src="/cleaninglab/reservation/js/part.js"></script>