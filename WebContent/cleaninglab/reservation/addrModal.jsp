<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="cp" value="${pageContext.request.contextPath}"/>    
 <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
	<div class="modal-body" id="reAdOuter" >
		<input id="animaladCh" type="hidden" value="1">
		<input id="kidsadCh" value="" type="hidden" >
		<input id="cctvadCh"  type="hidden" value="">
		<input id="parkingadCh" type="hidden" value="">
	
	
		<div id="reAdText">집 주소</div>
		<input type="text" id="reAddress" value="집주소다" readonly="readonly">
		<input type="text" id="reDetailAdd" maxlength="25" placeholder="상세주소를 입력해주세요.">
		
		<div id="reAdText">평수(공급면적)</div>
		<button type="button" id="reSize">선택</button>
		<button type="button" id="reSize2">변경</button>
		<select id="re_Size">
			<option value="8">8평 이하</option>
			<c:forEach begin="9" step="1" end="100" var="i">
    			<option value="${i}">${i}</option>
    		</c:forEach>
    		<option value="101">101평 이상</option>
  		</select>
		
		<div id="reAdText2">전화번호 </div>
		<input type="text" id="reTel" value="${loginUser.phone}" class="reTel" maxlength="25" readonly="readonly">
		<div>예약확인 및 매니저님과 통화용도로 쓰입니다</div>

		<div id="reAdText2">기본정보 <div id="reAdText3">선택된 내용은 더 나은 서비스를 위한 필수정보입니다.<br>서비스 가격에 영향을 미치지 않습니다</div></div>
		
		<div id="reAdText4">반려동물</div>
		<button type="button" class="rePetCh1" id="reSize3" onclick="rePetCh('rePetCh1')">개</button>
		<button type="button" class="rePetCh2" id="reSize3" onclick="rePetCh('rePetCh2')">고양이</button>
		<button type="button" class="rePetCh3" id="reSize3" onclick="rePetCh('rePetCh3')">기타</button>
		<button type="button" class="rePetCh4" id="reSize3" onclick="rePetCh('rePetCh4')">없음</button>
		
		<div class="rePet">		
			<div class="rePet">안전관련 유의사항</div>
			<input type="text" id="rePet" placeholder="예)두마리가 있어요. 문열때 조심해주세요." >
		</div>
		
		<div id="reAdText4">영유아(7세 이상)
			<span class="reSubAddOut">
				<button type="button" class="sub1Y" id="reSize4" onclick="reSubCh('sub1','Y','N')">있음</button>
				<button type="button" class="sub1N" id="reSize4" onclick="reSubCh('sub1','N','Y')">없음</button>
			</span>
		</div>
		
		<div id="reAdText5">CCTV
			<span class="reSubAddOut">
				<button type="button" class="sub2Y" id="reSize4" onclick="reSubCh('sub2','Y','N')">있음</button>
				<button type="button" class="sub2N" id="reSize4" onclick="reSubCh('sub2','N','Y')">없음</button>
			</span>
		</div>
		
		<div id="reAdText5">무료 주차
			<span class="reSubAddOut">
				<button type="button" class="sub3Y" id="reSize4" onclick="reSubCh('sub3','Y','N')">있음</button>
				<button type="button" class="sub3N" id="reSize4" onclick="reSubCh('sub3','N','Y')">없음</button>
			</span>
		</div>
		
		<div id="reAdText2">집명칭 </div>
		<input type="text" class="rehome" id="reTel" maxlength="200" placeholder="우리집" >
		
		<div class="reAdText" id="mar">출입방법 및 비밀번호</div>
		<div id="reAdText5">공동현관 </div>
		<input type="text" class="reKey1" id="reTel" maxlength="200" placeholder="출입방법 및 현관 비밀번호(*,#부호도 함께 입력)" >
		
		<div id="reAdText5">개별현관 </div>
		<input type="text"  class="reKey2" id="reTel" maxlength="200" placeholder="출입방법 및 현관 비밀번호(*,#부호도 함께 입력)" >
		
		<div class="reAdText" id="mar">부가정보</div>
		<div id="reAdText5">청소용품 </div>
		<input type="text"  class="reClean" id="reTel" maxlength="200" placeholder="청소용품의 위치를 입력해주세요" >
		
		<div id="reAdText5">오는방법 </div>
		<input type="text"  class="reway" id="reTel" maxlength="200" placeholder="집오는 방법을 설명해주세요" >
		
		<div class="reinforFin">
			<button type="button" id="reinforFin" onclick="goNewAddr()">저장</button>
			<button class="close" id="close" data-dismiss="modal">닫기</button>
		</div>
	</div>
	<div class="modal-footer"></div>
<script src="${cp}/cleaninglab/reservation/js/reAddr.js?ver=20180810"></script>