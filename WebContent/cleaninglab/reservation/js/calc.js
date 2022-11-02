var regexp = /[^0-9]/gi;
$(function(){

	 $("#reCdate").on("propertychange change keyup paste input", function(){	
		
		if($("#reCdate").val().length<2){
			
			$(this).val($(this).val().replace(regexp,''))

		}else if($("#reCdate").val().length==2){

			$("#reCdate").val($("#reCdate").val()+"/")
		
		}else{
			 $(this).val($(this).val().substring('0','3')+$(this).val().substring('3').replace(regexp,''))
		}
	 });
	 

});

addCard = function() {
	console.log($("#reCnum1").val().length)
	console.log($("#reCnum1").val())
	if($("#reCnum1").val().length<4){
		console.log($("#reCnum1").val().length)
		alert('카드번호 4자리를 입력해주세요')
		return false;
	}
	
	if($("#reCnum2").val().length<4){
		alert('카드번호 4자리를 입력해주세요')
		return false;
	}
	
	if($("#reCnum4").val().length<4){
		alert('카드번호 4자리를 입력해주세요')
		return false;
	}
	
	if($("#reCnum3").val().length<4){
		alert('카드번호 4자리를 입력해주세요')
		return false;
	}
	
	if($("#reCdate").val().length<5){
		alert('유효기간 5자리를 입력해주세요')
		return false;
	}
	
	
	if($("#reCpw").val().length<2){
		alert('비밀번호 2자리를 입력해주세요')
		return false;
	}
	
	
	if($("#rebirth").val().length<6){
		alert('생년월일 6자리를 입력해주세요')
		return false;
	}
	
	
	var cc =  $("#reCnum1").val()+'-'+$("#reCnum2").val()+'-'+$("#reCnum3").val()+'-'+$("#reCnum4").val()
	$("#cardnum").val(cc)
	$("#cvc").val($("#rebirth").val())
	$("#carddate").val($("#reCdate").val())
	$("#cardpw").val($("#reCpw").val())
	
	var formdata = $("form[name=frmType4]").serialize();
	formdata = decodeURIComponent(formdata);
	
	$.ajax({
		async : false,
		type : 'GET',
		data : {type : '카드' , formdata : formdata},
		url : "/ResdataCalc.rd",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			if(!data){
				alert('카드 등록에 실패하였습니다. 다시 등록해주세요.')
			}else{
				$('#addcard').text('변경')
				location.reload();
			}
			console.log(data)
			},error:function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}

		});
	 $("#calcM").modal('hide')
}

chNum = function(a) {
	 
	$("#"+a).on("propertychange change keyup paste input", function(){	
			
		 $(this).val($(this).val().replace(regexp,''))
			 
	 });
}