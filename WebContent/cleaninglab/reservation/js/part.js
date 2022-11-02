
$(function(){
	if($("#keyF2").val() =='addr'){

		$("#reTimeB").val($("#runtime").val())
		$(".reTimeB").text($("#runtime").val()+"시간")
		$("#reCountB").val($("#servicecnt").val())
		$("#trashwayB").text($("#trashway").val())
		$("#noticeB").text($("#notice").val())
		$(".reMoneyB").text($("#price").val()+"원")
		$("#reMoneyB").text($("#price").val())
	
		$("#reTimeR").val($("#runtime").val())
		$(".reTimeR").text($("#runtime").val()+"시간")
		$("#reCountR").val($("#servicecnt").val())
		$("#trashwayR").text($("#trashway").val())
		$("#noticeR").text($("#notice").val())
		$(".reMoneyR").text($("#price").val()+"원")
		$("#reMoneyR").text($("#price").val())
		
		
		$("#reCheckFIn").css('display','none')
	}
	
});
    	  
    	  
fnPlus = function() {
	var count = $("#reCountB").val();
	var tcount = $("#reTimeB").val();
	var money = $("#reMoneyB").val();
	
	count++;
	tcount++;
	money = parseInt(money) + 15000;
	if(count >= 4){
		count = 4;
		tcount = 4;
		money = 60000;
	}
	if(count <= 2){
		tcount = 2;
		money = 30000;
	}

	console.log(count);

	$("#reCountB").val(count);
	$("#reTimeB").val(tcount);
	$("#reMoneyB").val(money);
	$(".reTimeB").text(tcount+'시간');
	$(".reMoneyB").text(money+'원');
	
};

fnPlus2 = function() {
	var count = $("#reCountR").val();
	var tcount = $("#reTimeR").val();
	var money = $("#reMoneyR").val();
	
	count++;
	if(count >= 2){
		count = 2;
		tcount = 5;
		money = 75000;
	}
	
	$("#reCountR").val(count);
	$("#reTimeR").val(tcount);
	$("#reMoneyR").val(money);
	$(".reTimeR").text(tcount+'시간');
	$(".reMoneyR").text(money+'원');
	
};

fnMinus = function() {
	var count = $("#reCountB").val();
	var tcount = $("#reTimeB").val();
	var money = $("#reMoneyB").val();
	
	count--;
	if(count <= 1){
		count = 1;
	}
	if(count <= 2){
		tcount = 2;
		money = 30000;
	}
	if(count == 3){
		tcount = 3;
		money = 45000;
	}
	
	console.log(tcount);
	
	$("#reCountB").val(count);
	$("#reTimeB").val(tcount);
	$("#reMoneyB").val(money);
	$(".reTimeB").text(tcount+'시간');
	$(".reMoneyB").text(money+'원');
	
};

fnMinus2 = function() {
	var count = $("#reCountR").val();
	var tcount = $("#reTimeR").val();
	var money = $("#reMoneyR").val();
	
	count--;
	if(count <= 1){
		count = 1;
		tcount = 3;
		money = 45000;
	}

	$("#reCountR").val(count);
	$("#reTimeR").val(tcount);
	$("#reMoneyR").val(money);
	$(".reTimeR").text(tcount+'시간');
	$(".reMoneyR").text(money+'원');
	
};

fnBCheck = function() {
	
	var fmoney = 0;

	fmoney = parseInt($("#reMoneyB").val());
	$(".reMoney").text('총 금액:'+fmoney+'원');
	$("#reMoney").val(fmoney);
	
	$( "#reSubOuter" ).css( { height: '600px' } );
	$("#reBB").hide();
	$("#relabelB").show();
	
	if($("#reRR")){
		$("#reRR").remove();
		$("#relabelR").css('display','none');
	}
	$( "#reNextB" ).css('display','block')
	
	$( "#servicecnt" ).val($( "#reCountB" ).val())
	$( "#servicearea" ).val("화장실")
	$( "#trashway" ).val($( "#trashwayB" ).val())
	$( "#notice" ).val($( "#noticeB" ).val())
	$( "#price" ).val($( "#reMoney" ).val())
	$( "#runtime" ).val($( "#reTimeB" ).val())
	
	
	if($("#keyF2").val() =='addr'){
		
		var tt = "<div>"+$("#servicearea").val()+"청소  "+$("#reCountB").val()+"개"+"</div>"
		$(".reff").empty()
		$(".reff").append(tt)	
		$("#trw").val($("#trashwayB").val())
		$("#ni").val($("#noticeB").val())
		$("#price").val($("#reMoneyB").val())
		$("#addc").modal('hide') 
	}
	window.scrollTo(0,0);
}

fnRCheck = function() {
	
	var fmoney = 0;
	
	fmoney = parseInt($("#reMoneyR").val());
	$(".reMoney").text('총 금액:'+fmoney+'원');
	$("#reMoney").val(fmoney);
	
	$( "#reSubOuter" ).css( { height: '600px' } );
	$("#reRR").hide();
	$("#relabelR").show();
	
	if($("#reBB")){
		$("#reBB").remove();
		$("#relabelB").css('display','none');
	}
	$( "#reNextB" ).css('display','block')
	
	$( "#servicecnt" ).val($( "#reCountR" ).val())
	$( "#servicearea" ).val("냉장고")
	$( "#trashway" ).val($( "#trashwayR" ).val())
	$( "#notice" ).val($( "#noticeR" ).val())
	$( "#price" ).val($( "#reMoney" ).val())
	$( "#runtime" ).val($( "#reTimeR" ).val())
	
	if($("#keyF2").val() =='addr'){
	
		var tt = "<div>"+$("#servicearea").val()+"청소  "+$("#reCountR").val()+"대"+"</div>"
		$(".reff").empty()
		$(".reff").append(tt)	
		$("#trw").val($("#trashwayR").val())
		$("#ni").val($("#noticeR").val())
		$("#price").val($("#reMoneyR").val())
		$("#addc").modal('hide') 
	}
	
	window.scrollTo(0,0);
}
reNext = function() {
	frmRes.encoding = "application/x-www-form-urlencoded"	
	$("#frmRes").attr('action', "/reservation/check.rs").submit();
}
