$(function(){

	
	if($("#newAddr").val()!="없음"){
		$("#reAddress").val($("#newAddr").val())
	
	}else{
		
		var a = $("#chAddr").val()
		
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

	if($("#keyF")){
		if($("#keyF").val() == "key"){
			$(".rekey1").focus();
		}else if($("#keyF").val() == "etc"){
			$(".sub1Y").focus();
		}else{
			document.getElementById("reDetailAdd").focus();
		}
	}else{
		document.getElementById("reDetailAdd").focus();
	}
	
	$("#reSize").click(function() {
		$("#re_Size").css('display', 'block');
	});	
	
	$('#re_Size').on('change', function() {
		
		$("#reSize").text($("select option:selected").val()+'평')
		$("#re_Size").css('display', 'none');
		$("#reSize").attr('disabled', true);
		$("#reSize2").css('display', 'block');
    });
	
	$("#reSize2").click(function() {
		$("#re_Size").css('display', 'block');
	});	
	
	$('.close').click(function() {
		
		clearData()
	});
	
});

var an ='';

rePetCh = function(a) {
	
	var b = '.'+a
	var d = 1;
	
	if($(b).css('background-color') !='rgb(5, 195, 222)'){

	$(b).css('background-color', '#05C3DE');
	$(".rePet").css('display', 'block');
		
	if($(b).text()=='없음'){
			$(".rePetCh1").css('background-color', 'lightgrey');
			$(".rePetCh2").css('background-color', 'lightgrey');
			$(".rePetCh3").css('background-color', 'lightgrey');
			$(".rePet").css('display', 'none');
			$(".rePet").val('');
			an = '없음'
		}else{
			if(an=='없음'){
				an = ''
			}
			an+=$(b).text()+",";
			$(".rePetCh4").css('background-color', 'lightgrey');
			$("#animaladCh").val(parseInt($("#animaladCh").val())+d)
		}
		$("#animal").val(an)
	
	}else{
		$(b).css('background-color', 'lightgrey');
		
		if($(b).text()!='없음' ){
			
			for (var i = 0; i < an.split(",").length; i++) {
				an = ''
				if($(b).text() != an.split(",")[i]){
					an += an.split(",")[i]+","
				}
			}
		$("#animaladCh").val(parseInt($("#animaladCh").val())-1)
		}
		$("#animal").val(an)
	}
	if(parseInt($("#animaladCh").val())==1){
		$(".rePet").css('display', 'none');
		$(".rePet").val('');
	}
}

reSubCh = function(a,b,c) {
	
	var i = '.'+a+b;
	var d = '.'+a+c;
	
	$(i).css('background-color', '#05C3DE');
	$(d).css('background-color', 'lightgrey');
	
	
	if(a == 'sub1'){
		
		if($("#kidsadCh").val() == $(i).text()){
			$(i).css('background-color', 'lightgrey');
			$("#kidsadCh").val('')
				
		}else{
			$("#kidsadCh").val($(i).text())
		}
			
	}else if(a == 'sub2'){
		
		if($("#cctvadCh").val() == $(i).text()){
			
			$(i).css('background-color', 'lightgrey');
			$("#cctvadCh").val('')
				
		}else{
			$("#cctvadCh").val($(i).text())
		}
		
	}else{
		if($("#parkingadCh").val() == $(i).text()){
			$(i).css('background-color', 'lightgrey');
			$("#parkingadCh").val('')
				
		}else{
			$("#parkingadCh").val($(i).text())
		}
		$("#parking").val($("#parkingadCh").val())
	}
	
	
	
}

goNewAddr = function() {
	
	$("#addr").val($("#reAddress").val())
	$("#addrdetail").val($("#reDetailAdd").val())
	
	if($("#reSize").text() != '선택'){
		
		$("#area").val($("#reSize").text())
	}
	
	$("#animaldetail").val($("#rePet").val())
	$("#homename").val($(".rehome").val())
	$("#phone").val($(".reTel").val())
	$("#frontkey").val($(".reKey1").val())
	$("#homekey").val($(".reKey2").val())
	$("#homeway").val($(".reway").val())
	$("#cleantool").val($(".reClean").val())
	
	$("#parking").val($("#parkingadCh").val())
	$("#cctv").val($("#cctvadCh").val())
	$("#kids").val($("#kidsadCh").val())
	
	if($("#reDetailAdd").val()==null){
		alert('상세주소를 입력해주세요')
		return false;
	}
	if($("#reSize").text()==''){
		alert('평수를 선택해주세요')
		return false;
	}
	if($("#animal").val()==''){
		alert('반려동물 정보를 입력해주세요')
		return false;
	}
	if($("#kidsadCh").val()==''){
		alert('영유아 정보를 선택해주세요')
		return false;
	}
	if($("#cctvadCh").val()==''){
		alert('CCTV 정보를 선택해주세요')
		return false;
	}
	if($("#parkingadCh").val()==''){
		alert('무료주차를 선택해주세요')
		return false;
	}
	if($(".rehome").val()==''){
		alert('집명칭을 입력해주세요')
		return false;
	}

	var formdata = $("form[name=frmType]").serialize();
	formdata = decodeURIComponent(formdata);
	
	$.ajax({
	   	async : false,
	    type : 'GET',
	    data : {formdata : formdata},
	    url : "/ResdataChange.rd",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			location.reload();
	     },error:function(request,status,error){
	         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       }

	});
	
	clearData()
	
	
	$("#changeAddress").modal('hide') 
	
}

clearData = function() {
	
	$("#animaladCh").val('1')
	$("#kidsadCh").val('')
	$("#cctvadCh").val('')
	$("#parkingadCh").val('')
	
	$("#reAddress").val('')
	$("#reDetailAdd").val('')
	$("#reSize").val('')
	$("#reSize2").attr("display","none")
	$(".reTel").val('')
	$(".rePet").hide()
	$("#rePet").val('')
	$(".rehome").val('')
	
	$(".reKey1").val('')
	$(".reKey2").val('')
	$(".reClean").val('')
	$(".reway").val('')
	
	$(".rePetCh1").css('background-color', 'lightgrey');
	$(".rePetCh2").css('background-color', 'lightgrey');
	$(".rePetCh3").css('background-color', 'lightgrey');
	$(".rePetCh4").css('background-color', 'lightgrey');
	$(".rePet").css('display', 'none');
	$(".sub1N").css('background-color', 'lightgrey');
	$(".sub2N").css('background-color', 'lightgrey');
	$(".sub3N").css('background-color', 'lightgrey');
	$(".sub1Y").css('background-color', 'lightgrey');
	$(".sub2Y").css('background-color', 'lightgrey');
	$(".sub3Y").css('background-color', 'lightgrey');
	$("#reSize").text('선택')
	$("#re_Size").css('display', 'none');
	$("#reSize").attr('disabled', false);
	$("#reSize2").css('display', 'none');
}
