var chI = 1;
var date = 0;
var tim = 0;
$(function(){
	var etS = '';
	
	if($('#kids').val()==null){
		etS="영유아 : 미입력 / "
	}else if($('#kids').val()==''){
		etS="영유아 : 미입력 / "
	}else{
		etS="영유아 : "+$('#kids').val()+" / "
	}
	if($('#parking').val()==null){
		etS+="주차 : 미입력  / "
	}else if($('#parking').val()==''){
		etS+="주차 : 미입력  / "
	}else{
		etS+="주차 : "+$('#parking').val()+" / "
	}
	if($('#cctv').val()==null){
		etS+="CCTV : 미입력"
	}else if($('#cctv').val()==''){
		etS+="CCTV : 미입력"
	}else{
		etS+="CCTV : "+$('#cctv').val()
	}
	$('#etcIn').val(etS)
	
     $('#rel_dateStr').datepicker({
           format: "yyyy/mm/dd",
           autoclose: true, 
           startView: "days", 
           minViewMode: "days",
           
           beforeShow: function(input) {

		    var i_offset= $("#btn_diray1").offset();

		    setTimeout(function(){

		       $(".").css({'top':i_offset.top, 'bottom':'', 'left':'10px'});  

		    })
           }

        }).on('change', function (ev) {
           $(this).datepicker('hide');
           $("#redate").val($('#rel_dateStr').val());
           date = 1;
      });
	
      $("#btn_diray1").click(function(){
         $("#rel_dateStr").datepicker('show');
      })
      
      $("#rel_dateStr").on("propertychange change keyup paste input", function() {
    	  $("#rel_TimeStr").attr('disabled',false)
      });
      
      $('#rel_TimeStr').on('change', function() {
  		
  			$("#retime").val($("select option:selected").val())
  			
  			if($("#retime").val() !=='none'){
  				tim = 1;
  			}
      });
      
      $(".smartM").click(function(){
    	  $("#smartM").modal({
    			remote: '/cleaninglab/reservation/smartMModal.jsp'
    		});
       })
       
       $("#d").click(function(){
    	   
    	   $("#addrch2").val("addr")
    	   
    	   $("#addrch2").modal({
    		   remote: '/cleaninglab/reservation/addrModal.jsp'
    	   });
    	   
    	   chaddrlast()
       })
       
       $("#c").click(function(){
    	   
    	   $("#addrch2").val("key")
    	   
    	   $("#addrch2").modal({
    		   remote: '/cleaninglab/reservation/addrModal.jsp'
    	   });
    	   chaddrlast()
       })
       
       $("#f").click(function(){
    	   
    	   $("#addrch2").val("etc")
    	   
    	   $("#addrch2").modal({
    		   remote: '/cleaninglab/reservation/addrModal.jsp'
    	   });
    	   chaddrlast()
       })
       
       $("#chre").click(function(){
    	  
    	   $("#addc").modal({});
    	   
    	  if($("#servicearea").val() =="화장실"){
    		   
    		$("#addcT").load("/cleaninglab/reservation/partContentsB.jsp")
   
    	  }else{
    		  $("#addcT").load("/cleaninglab/reservation/partContentsR.jsp")
    		}
  
       })
       
});

reCalc = function() {
	
	if(date ==0){
		alert('날짜을 선택해주세요')
		return false;
	}
	if(tim ==0){
		alert('시간을 선택해주세요')
		return false;
	}
	if($("#addrdetail").val()==''){
		alert('상세주소를 입력해주세요')
		return false;
	}
	if($("area").val()==''){
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

	
	
	frmType2.encoding = "application/x-www-form-urlencoded"	
	$("#frmType2").attr('action', "/reservation/last.rs").submit();
}


reImgCh = function(a) {
	
	if(a == 'r'){
		if(chI == 1){
			 $("#imgChBL").css('display', 'block')
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM2.png)')
			 chI = 2
		}else if(chI == 2){
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM3.png)')
			 chI = 3
		}else{
			 $("#imgChBR").css('display', 'none') 
			 $("#imgChBL").css('display', 'block')
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM4.png)')
			 chI = 4
		}
	}else{
		if(chI == 4){
			 $("#imgChBR").css('display', 'block')
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM3.png)')
			 chI = 3
		}else if(chI == 3){
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM2.png)')
			 chI = 2
		}else{
			 $("#imgChBR").css('display', 'block') 
			 $("#imgChBL").css('display', 'none')
			 $("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM1.png)')
			 chI = 1
		}
	}
}

returnImg = function() {
	$("#imgChBR").css('display', 'block') 
	$("#imgChBL").css('display', 'none')
	$("#modal-body").css('background-image', ' url(/cleaninglab/images/smartM1.png)')
	chI = 1
}
chaddrlast =  function() {

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