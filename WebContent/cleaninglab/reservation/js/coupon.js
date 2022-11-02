var regexp = /[^0-9]/gi;
$(function(){
	
	var e = $("#email").val();
	$("#couOuterInO").empty()
	$.ajax({
		async : false,
		type : 'GET',
		data : {email : e},
		url : "/ResdataCList.rd",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {
				var tt = "<div id='couOuterIn'>	<div id='couPrice'>"+data[i].price+'원 쿠폰'
					tt+="</div><input class='"+data[i].giftnum+"' id='ouCHBox' type='checkbox' onclick='chkCoupon("+data[i].giftnum+','+data[i].price+")'>"
					tt+="<div id='couDate'>"+data[i].use+"</div>"
				$("#couOuterInO").append(tt)
			}
			
			var tt = "<button id='addCo2' onclick='addCoGo()'>쿠폰등록</button>"
			tt += "<input type='hidden' id='addGift' onclick='ckcounum()' maxlength='25' class ='addcoupline2'  placeholder='쿠폰코드 및 번호를 입력해주세요'>"
			tt+="<button class='buthome2' id ='addcoupB2' type='button' disabled='disabled' onclick='addGift2()'>등록</button>"
			$("#couOuterInO").append(tt)
				
		 },error:function(request,status,error){
		     alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		  }

		});	 
	
	$(".close").click(function() {
		$("addcoupB2").attr("disabled", true)
		$("addcoupB2").csss("diplay", 'none')
		$("#addGift").attr("type", "hidden")
		$("#addCo2").text('쿠폰등록')
	});
});

chkCoupon = function(a,b) {
	
	$("#greprice").val(b)
	
	var p = parseInt($("#gsize").val())-1
	var n;
	var c;
	console.log($("#nowprice").val())
	if($("#gprice").val()!=''){
		 c = parseInt($("#nowprice").val())+parseInt($("#gprice").val())
		 console.log($("#gprice").val())
	}else{
		c = parseInt($("#nowprice").val())
	}
	
	if($("#nowprice").val()!=''){
		$("#nowprice").val(c)
		n = parseInt($("#nowprice").val())-parseInt(b)
		
	}else{
		n = parseInt($("#price").val())-parseInt(b)
	}
	if(n<0){
		n = 0;
		$("#gprice").val(parseInt(b)+n)
	}else{
		$("#gprice").val(b)
	}
	
	$("input:checkbox[id=ouCHBox]").prop("checked", false);
	$("input:checkbox[id=ouCHBox]").css('background-color', 'white');
	
	if($("#giftnum").val()!=a){
		
		$("#giftnum").val(a)
		$("."+a).prop("checked", true);
		$("."+a).css('background-color', '#05C3DE');
		$("#CUseNow").val(b+'원 쿠폰')
		$("#CUseNow").attr('type','text')
		$(".nowcouDis").attr('type','text')
		$("#addcoup").text('변경')
		$("#Ccount").text('미사용  '+p+'장')
		$(".nowcouDis").val('-'+b+'원')
		$("#nowprice").val(n)
		$(".ccT").attr('type','text')
		
		
	}else{
		$("#giftnum").val('')
		$("#gprice").val('')
		$("#CUseNow").val('')
		$("#CUseNow").attr('type','hidden')
		$(".nowcouDis").attr('type','hidden')
		$("#addcoup").text('사용')
		$("#Ccount").text('미사용  '+$("#gsize").val()+'장')
		$(".nowcouDis").val('')
		$(".ccT").attr('type','hidden')
	}
	$("#totalprice").val($("#nowprice").val()+'원')
	$("#couponlist").modal('hide')
	console.log($("#nowprice").val())
}

addCoGo = function() {
	
	if($("#addCo2").text() == '쿠폰등록'){
		
		$("#addcoupB2").css('display', 'block');
		$(".addcoupline2").attr('type', 'text');
		$("#addCo2").text('쿠폰등록취소')
	
	}else{
		$("#addcoupB2").css('display', 'none');
		$(".addcoupline2").attr('type', 'hidden');
		$("#addCo2").text('쿠폰등록')
		$("#addcoupB2").attr('disabled',true)
		$(".addcoupline2").val('');
	
	}
}

addGift2 = function() {
	
	var num =$(".addcoupline2").val();
	
	$.ajax({
		async : false,
		type : 'GET',
		data : {type : '쿠폰', giftnum : num, check: 'check', use: '미사용'},
		url : "/ResdataCalc.rd",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			if(data[0]){
				alert("등록 성공하였습니다.")
				location.reload();
			}else{
				alert("없는 쿠폰번호 입니다.")
			}
			
		 },error:function(request,status,error){
		     alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		  }

		});	 
	 
}
ckcounum = function() {
	
	 $("#addcoupB").css('display', 'none');
	 $(".addcoupline").attr('type', 'hidden');
	 $(".addcoupline").val('');
	 $("#addpointB").css('display', 'none');
	 $(".addpointline").attr('type', 'hidden');
	 
	 $(".addcoupline2").on("propertychange change keyup paste input", function(){	
		 $(this).val($(this).val().replace(regexp,''))
		
		 if( $(this).val().length >= 1){
			 
			 $("#addcoupB2").attr('disabled',false)
		 
		 }else if( $(this).val().length < 1){
			 $("#addcoupB2").attr('disabled',true)
		 }
	 });
}