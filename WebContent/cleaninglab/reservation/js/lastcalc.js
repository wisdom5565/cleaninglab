var regexp = /[^0-9]/gi;
$(function(){
	
	 $("#pointCh").val( $("#point").val())
	 $("#totalprice").val( $("#price").val())
	 $(".nowprice").val( $("#price").val())
	 
	 $(".addcoupline").on("propertychange change keyup paste input", function(){	
		
		 $(this).val($(this).val().replace(regexp,''))
		 
		 if($(this).val().length >= 1){
			 $("#addcoupB").attr('disabled',false)
		 }else{
			 $("#addcoupB").attr('disabled',true)
		 }
		
	});
	 $(".addpointline").on("propertychange change keyup paste input", function(){	
		 $(this).val($(this).val().replace(regexp,''))
		
		 if($(this).val().length >= 1){
			 $("#addpointB").attr('disabled',false)
		 
		 }else if($(this).val().length < 1){
			 $("#addpointB").attr('disabled',true)
		 }
	 });
 	
	$("#pointChkB").change(function(){
		
		 $("#addcoupB").css('display', 'none');
		 $(".addcoupline").attr('type', 'hidden');
		 $(".addcoupline").val('');
		 $("#addpointB").css('display', 'none');
		 $(".addpointline").attr('type', 'hidden');
		 $(".addpointline").val('');
		
		var n;
		
		if($("#pointChkB").is(":checked")){
				
			$(".ppT").attr('type','text')
			$(".nowpoDis").attr('type','text')
			$(".ppT").css('margin-bottom','30px')
			
			var d;
			if($("#nowprice").val()!=''){
				d = $("#nowprice").val()
			}else{
				d = $("#price").val()
			}
			if($("#point").val()!=null){
				n = parseInt(d) - parseInt($("#point").val())
			}else{
				n = parseInt(d) 
			}
			
			 if(parseInt(n)<0){
				$("#nowpoint").val(parseInt($("#point").val())-parseInt(d))
				$("#nowprice").val('0')
				$("#usepoint").val(parseInt($("#point").val())-parseInt($("#nowprice").val()))
				$("#Pcount").text('사용가능한 포인트 : '+ $("#nowpoint").val())
				
			 }else{
				$("#nowpoint").val('0')
				$("#nowprice").val(n)
				$("#usepoint").val($("#point").val())
				$("#Pcount").text('사용가능한 포인트 : 0')
			}
			 $(".nowpoDis").val('-'+$("#usepoint").val()+'원')	
			 $("#totalprice").val($("#nowprice").val()+'원') 
			 
		}else{
			
			$(".ppT").attr('type','hidden')
			$(".nowpoDis").attr('type','hidden')
			$(".nowpoDis").val('')
			$("#Pcount").text('사용가능한 포인트 : '+ $("#point").val())
			$("#nowprice").val(parseInt($("#usepoint").val())+parseInt($("#nowprice").val()))
			$("#usepoint").val('')
			$("#nowpoint").val('')
			$("#totalprice").val($("#nowprice").val()+'원') 
		}
		console.log($("#nowprice").val())
	});
	
	
});

addshow = function(y,a,b) {
	
	if(y=='c'){
		
		if($("#addcoup").text().trim() == '취소'){

			 $("#addcoupB").css('display', 'none');
			 $(".addcoupline").attr('type', 'hidden');
			 $(".addcoupline").val('');
			 $("#addpointB").css('display', 'none');
			 $(".addpointline").attr('type', 'hidden');
			 $(".addpointline").val('');
			 $("#addcoup").text('추가')
			 $("#addpoint").css("display",'none')
			 
		}else{
			
			if($("#addcoup").text().trim() !="추가"){
				
				$("#couponlist").modal({
					remote: '/cleaninglab/reservation/couponModal.jsp'
				});
			}else{
				
				$("#"+a).css('display', 'block');
				$("."+b).attr('type', 'text');
				$("#addpointB").css('display', 'none');
				$(".addpointline").attr('type', 'hidden');
				$(".addpointline").val('');
				$("#addcoup").text('취소')
				
			}
			
		}

	
	}else{
		
		if($("#addpoint").text().trim() == '취소'){
			
			$("#addcoupB").css('display', 'none');
			$(".addcoupline").attr('type', 'hidden');
			$(".addcoupline").val('');
			$("#addpointB").css('display', 'none');
			$(".addpointline").attr('type', 'hidden');
			$(".addpointline").val('');
			$("#addpoint").text('충전')
			$("#addpoint").css("display",'block')
		
		}else{
			
			$("#"+a).css('display', 'block');
			$("."+b).attr('type', 'text');
			$("#addcoupB").css('display', 'none');
			$(".addcoupline").attr('type', 'hidden');
			$(".addcoupline").val('');
			$("#addpoint").text('취소')
		}
	}
}

addGift = function(t) {
	
	var num ='';
	var pp = 0
	var am;
	if(t == '쿠폰'){
		num = $(".addcoupline").val()
		am = {type : t, giftnum : num, check: 'check', use : "미사용"}
	}else{
		num = $(".addpointline").val()
		if( $("#point").val()!=''){
		
			pp = $("#point").val();
		
		}else if($("#point").val()!=null){
			pp = $("#point").val();
		}
	}
	
	if(t=="포인트"){
		$.ajax({
			async : false,
			type : 'GET',
			data : {type : t, giftnum : num},
			url : "/ResdataCalc.rd",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data)
				if(data[0]!=null){
					if(t=="포인트"){
						pp= parseInt(data[0].price) + parseInt(pp)
						console.log(pp)
					}
					if(num = data[0].giftnum){
						
						$.ajax({
							async : false,
							type : 'GET',
							data :  {type : t, giftnum : num, check: 'check', point : pp },
							url : "/ResdataCalc.rd",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data) {
								
								if(data[0]){
									alert('등록완료 되었습니다')
									$("#addpointB").css('display', 'none');
									$(".addpointline").attr('type', 'hidden');
									$("#addcoupB").css('display', 'none');
									$(".addcoupline").attr('type', 'hidden');
									$(".addpointline").val('')
									$(".addcoupline").val('')
									location.reload();
									
									if(data[1]){
										if(data[2]!=null){
											
											$("#point").val(data[2]);
										}
									}
									
								}else{
									alert('등록을 완료하지 못했습니다.다시 시도해 주세요')
								}
								
							},error:function(request,status,error){
								alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							}
							
						});	 
					}
				}else{
					alert('사용완료 및 잘못된 쿠폰 번호 입니다.')
				}
				
			},error:function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
			
		});	 
	
	}else if(t == '쿠폰'){
		
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
	
	 
}

cardmodal = function() {
	
	 $("#addcoupB").css('display', 'none');
	 $(".addcoupline").attr('type', 'hidden');
	 $(".addcoupline").val('');
	 $("#addpointB").css('display', 'none');
	 $(".addpointline").attr('type', 'hidden');
	 $(".addpointline").val('');
		
	 $("#calcM").modal({
		 remote: '/cleaninglab/reservation/calcModal.jsp'
	 });
}


lastCalc = function() {
	
	if($("#usepoint").val()!=''){
		
		$("#point").val(parseInt($("#point").val())-parseInt($("#usepoint").val()))
	}
	
	if($("#nowprice").val()==''){
		$("#nowprice").val($("#price").val())
	}
	else if(parseInt($("#nowprice").val())>0){
		$("#price").val($("#nowprice").val())
		if($("#cardnum").val()==null){
			alert('카드를 등록해주세요.')
			return false;
		}
	}
	alert('결제가 완료되었습니다.')
	frmType3.encoding = "application/x-www-form-urlencoded"	
	$("#frmType3").attr('action', "/reservation/lastCalc.rs").submit();
}