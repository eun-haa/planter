// ck
var nameCk = false;
var priceCk = false;
var discountCk = false;
var stockCk = false;

$(document).ready(function(){
	
	var cid = $(".cid_selected").val();
	$("#cid").val(cid);
	
	$(".cid_selected").on("click propertychange change keyup paste input", function(){
		
		var cid = $(".cid_selected").val();
		 
		$("#cid").val(cid);  //hidden value set
	})
	
	// 1.이름 유효성 검사
	$("#pname").blur(function(){
		if($("#pname").val() == ""){
			$("#nameMsg").html("상품 이름을 입력해주세요.")
			$("#nameMsg").css("color","red")
			nameCk = false;
			console.log('nameCk fail')
		}
		else if(!nameCheck.test($("#name").val())){
			$("#nameMsg").html("이름은 한글만 입력 가능합니다.")
			$("#nameMsg").css("color","red")
			nameCk = false;
			console.log('nameCk fail')
		}
		else{
			$("#nameMsg").html("")
			nameCk = true;
			console.log('nameCk ok')

		}
	});
})