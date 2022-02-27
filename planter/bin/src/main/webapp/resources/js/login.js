/**
 * 
 */
function login(){
	$.ajax({
	    url: "/member/login",
	    type: "POST",
	    data: {
	    	"mid":$("#member_id").val(),
	    	"passwd":$("#member_passwd").val()
	    },
	    dataType: "json",
	    success:function(data){
	    	console.log(data)
	    	if(data == 1){
	        	let url = "/main";
	        	location.replace(url); 
	        }
	    	else{
	        	$("#loginMsg").html("아이디와 비밀번호를 확인해주세요.");
	        	$("#loginMsg").css("color","red");
	        	
	    	}
	    	
	        console.log("data : " + data);
	    },
	    error:function(){
	    	console.log("error")
	        alert("error");
	    }
	})// ajax 끝
	return false;
}
$(document).ready(function(){


	$("#login_submit").on("click", function(){
		
		

		
			
		
	})// $("#login_submit").on("click", function() 끝
	
})//$(document).ready(function() 끝

