$(document).ready(function(){
	// cid 값 select 태그에 넣어주기
	if($("#cid").val() == 1){
		var result = $("#cid").val();
		$(".cid_selected").val(result);
	}else if($("#cid").val() == 2){
		var result = $("#cid").val();
		$(".cid_selected").val(result);		
	}else if($("#cid").val() == 3){
		var result = $("#cid").val();
		$(".cid_selected").val(result);		
	}else{
		var result = $("#cid").val();
		$(".cid_selected").val(result);		
	}
	
	// select 바뀔때마다 값 바꿔주기
	$(".cid_selected").on("click propertychange change keyup paste input", function(){
		
		var cid = $(".cid_selected").val();
		 
		$("#cid").val(cid);  //hidden value set
	})
})