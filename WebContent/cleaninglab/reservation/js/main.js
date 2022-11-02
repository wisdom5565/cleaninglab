

$("#reAddButt2").click(function(){
		 
	$('#addAddress').modal({
		
	});
		 
	execDaumPostcode()
});
		
$("#reAddList").click(function() {
	$("#reAddTitle").attr("type", "text")
});

$("#reAddTitle").click(function() {
	
	$("#reAddTitle").attr("type", "hidden");
	var a = $("#nowAddr").val()
	
	$.ajax({
	   	async : false,
	    type : 'GET',
	    data : {addrnum : a},
	    url : "/ResdataCall.rd",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$("#reAddList").empty();
			
			if(document.getElementById('reAddList')){
				
				for (var i = 0; i < data.length; i++) {
					console.log(data[i].addrnum)
					var tt ="<div id='reAddList'><div id='reAddName' onclick='addrChange()'> ["+data[i].homename+"]<br><br>"
					tt+= data[i].addr+"<br>"+data[i].addrdetail
					tt+="</div></div>"	
					
					$("#reAddList").append(tt)	
					$("#nowAddr").val(data[i].addrnum);
				}
			}
			$( "#reOuter" ).css( { height: "600px" } );
			$(".reAddTitle").attr("type", "hidden");
	     }
	});
});	

$(".reB").click(function() {
	 $( "#reSubOuter" ).css( { height: '1400px' } );
	
	 if (document.getElementById('reRR')){
		$("#reRR").hide();
	}
	 if($("#relabelB").css("display") == "none"){
		 $("#dd").load("/cleaninglab/reservation/partContentsB.jsp");
	 }else{
		 $("#reBB").show();
	 }
	 $( "#reNextB" ).css('display','none')
});


$(".reR").click(function() {
	
	$( "#reSubOuter" ).css( { height: '1400px' } );
	
	if (document.getElementById('reBB')){
		$("#reBB").hide();
	}
	if($("#relabelR").css("display") == "none"){
		 $("#tt").load("/cleaninglab/reservation/partContentsR.jsp");
	}else{
		 $("#reRR").show();
	}
	$( "#reNextB" ).css('display','none')
});


fnCan = function() {
	window.scrollTo(0,0);
	 $("#reBB").hide();
	 $("#reRR").hide();
	 $( "#reNextB" ).css('display','none')
	 
	 if($("#relabelB").css("display") != "none"){
		 
		 $( "#reNextB" ).css('display','block')
	 }
	 if($("#relabelR").css("display") != "none"){
		 
		 $( "#reNextB" ).css('display','block')
	 }
	 
	 $( "#reSubOuter" ).css( { height: '600px' } );
}

reNext = function() {
		
		frmRes.encoding = "application/x-www-form-urlencoded"	
		$("#frmRes").attr('action', "/reservation/check.rs").submit();	
}

fnType = function(a) {
	
	if($("#nowAddr").val()==''){
		alert("주소를 먼저 입력해주세요")
	}else{
		
		$("#resType").val(a)
		frmType.encoding = "application/x-www-form-urlencoded"
		$("#frmType").attr('action', "/reservation/type.rs").submit();	
	}
	
		
}

function execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.

	var element_wrap = document.getElementById('modal-body'); 
	var address_modal = document.getElementById('addAddress');

	var currentScroll = Math.max(element_wrap.scrollTop, element_wrap.scrollTop);
    
	new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } else {
                
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("newAddr").value = addr+extraAddr;
            // 커서를 상세주소 필드로 이동한다.

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
           element_wrap.style.display = 'none';
           address_modal.style.display = 'none';
           newdetailChange();
          
            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = 500+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
    address_modal.style.display = 'block';
}

function addrChange(){
	
	$.ajax({
	   	async : false,
	    type : 'GET',
	    data : {email : '11'},
	    url : "/ResdataCall.rd",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			var wid = 0;
			
			$("#reAddName").remove();
			
			if(document.getElementById('reAddList')){
				
				for (var i = 0; i < data.length; i++) {
					
					var tt ="<br><div id='reAddName'> ["+data[i].homename+"]<br><br>"
					tt+= data[i].addr+"<br>"+data[i].addrdetail
					
					tt+="<input id='recModi' type='text' value='수정' readonly='readonly' onclick='addrdetailChange("+data[i].addrnum+")'>"
					tt+="<input id='reCheck' type='text' value='선택' readonly='readonly' onclick='addrCheck("+data[i].addrnum+")'>"
						
					tt+="</div>"	
					$("#reAddList").append(tt)	
					
					wid+=1
				}
				
				wid = (parseInt($( "#reOuter" ).css("height").substring(0,3))+ 90*wid)+'px'
				
				$( "#reOuter" ).css( { height: wid } );
				
			}
	     }
	});
}

addrCheck = function(a) {
	
	$.ajax({
	   	async : false,
	    type : 'GET',
	    data : {addrnum : a},
	    url : "/ResdataCall.rd",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$("#reAddList").empty();
			
			if(document.getElementById('reAddList')){
				
				for (var i = 0; i < data.length; i++) {
					console.log(data[i].addrnum)
					var tt ="<div id='reAddList'><div id='reAddName' onclick='addrChange()'> ["+data[i].homename+"]<br><br>"
					tt+= data[i].addr+"<br>"+data[i].addrdetail
					tt+="</div></div>"	
					
					$("#reAddList").append(tt)	
					$("#nowAddr").val(data[i].addrnum);
				}
			}
			$( "#reOuter" ).css( { height: "600px" } );
			$("#reAddTitle").attr("type", "hidden");
	     }
	});
}

newdetailChange = function() {
	
	$("#addrnum").val("없음");
	$("#changeAddress").modal({
		remote: '/cleaninglab/reservation/addrModal.jsp'
	});
	document.getElementById("reDetailAdd").focus();
	$("#reAddress").val($("#newAddr").val())
}

addrdetailChange = function(a) {
	
	$("#newAddr").val("없음");
	$("#chAddr").val(a);
	$("#addrnum").val(a);
	
	$("#changeAddress").modal({
		remote: '/cleaninglab/reservation/addrModal.jsp'
	});
	
	if(document.getElementById("reDetailAdd")){
		
		document.getElementById("reDetailAdd").focus();
	}
	$.ajax({
	   	async : false,
	    type : 'GET',
	    data : {addrnum : a},
	    url : "/ResdataCall.rd",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$("#reAddress").val(data[0].addr)
			$("#reDetailAdd").val(data[0].addrdetail)
			
			if(data[0].area!=null){
				$("#reSize").text(data[0].area)
				$("#re_Size").css('display', 'none');
				$("#reSize").attr('disabled', true);
				$("#reSize2").css('display', 'block');
			}
			$(".reTel").val(data[0].phone)
			
			if(data[0].animal !=null){
				$("#animal").val(data[0].animal)
				var k = data[0].animal.split(",");
				for (var i = 0; i < k.length; i++) {
					
					for (var t = 1; t <5; t++) {
						
						if(k[i]==$(".rePetCh"+t).text()){
							
							$(".rePetCh"+t).css('background-color', '#05C3DE');
							break;
						}
					}
				}
				if(data[0].animal !='없음'){
					$(".rePet").css('display', 'block');
					if(data[0].animaldetail !=null){
						$("#rePet").val(data[0].animaldetail)
						$("#animaldetail").val(data[0].animaldetail)
					}
				}
			}
			$(".rehome").val(data[0].homename)
			
			if(data[0].kids == "없음"){
				$(".sub1N").css('background-color', '#05C3DE');
				$("#kids").val(data[0].kids)
				$("#kidsadCh").val(data[0].kids)
			}else if(data[0].kids == "있음"){
				$(".sub1Y").css('background-color', '#05C3DE');
				$("#kids").val(data[0].kids)
				$("#kidsadCh").val(data[0].kids)
			}
			
			if(data[0].cctv == "없음"){
				$(".sub2N").css('background-color', '#05C3DE');
				$("#cctv").val(data[0].cctv)
				$("#cctvadCh").val(data[0].cctv)
			}else if(data[0].cctv == "있음"){
				$(".sub2Y").css('background-color', '#05C3DE');
				$("#cctv").val(data[0].cctv)
				$("#cctvadCh").val(data[0].cctv)
			}
			
			if(data[0].parking == "없음"){
				$(".sub3N").css('background-color', '#05C3DE');
				$("#parking").val(data[0].parking)
				$("#parkingadCh").val(data[0].parking)
			}else if(data[0].parking == "있음"){
				$(".sub3Y").css('background-color', '#05C3DE');
				$("#parking").val(data[0].parking)
				$("#parkingadCh").val(data[0].parking)
			}
			
			if(data[0].frontkey != null){
				$(".reKey1").val(data[0].frontkey)
			}
			if(data[0].homekey != null){
				$(".reKey2").val(data[0].homekey)
			}
			if(data[0].cleantool != null){
				$(".reClean").val(data[0].cleantool)
			}
			if(data[0].homeway != null){
				$(".reway").val(data[0].homeway)
			}
			
	     }
	});
}
