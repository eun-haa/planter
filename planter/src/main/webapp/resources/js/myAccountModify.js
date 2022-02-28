// ck
var pwCk = false;
var pwcfCk = false;
var phoneCk = false;
var emailCk = false;



$(document).ready(function(){
	// * 기본 설정 *
	// 페이지가 로딩됐을때 #passwd 를 가진 input 태그부터 선택
	$("#passwd").focus();
	
	// phone value 화면에 띄워주기
	// 길이가 11자일경우, 12자일 경우
	if($("#phone").val() <= 11){
		var allphone = $("#phone").val();
		
		var result1 = allphone.substr(0,3); // $("#select").val();
		var result2 = allphone.substr(3,3); // $("#mobile2").val();
		var result3 = allphone.substr(6,4); // $("#mobile3").val();

		$("#select").val(result1);
		$("#mobile2").val(result2);
		$("#mobile3").val(result3);
	}else{
		var allphone = $("#phone").val();
		
		var result1 = allphone.substr(0,3); // $("#select").val();
		var result2 = allphone.substr(3,4); // $("#mobile2").val();
		var result3 = allphone.substr(7,4); // $("#mobile3").val();

		$("#select").val(result1);
		$("#mobile2").val(result2);
		$("#mobile3").val(result3);
	}

	
	// 정규식
	// pw : 영문 소문자/숫자/특수문자를 조합, 8~16글자
	var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	// phoneCheck : 숫자로만 11~12
	var phoneCheck = RegExp(/^[0-9]{11,12}$/);
	// email : 이메일 형식에 맞게 썼는지 검사 ex)aaa@gmail.com
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	// 유효성 검사 - ajax
	// 1.비밀번호 유효성 검사
	$("#passwd").blur(function(){
	  if(!pwCheck.test($("#passwd").val())){
		  $("#pwMsg").html("비밀번호는 영문 소문자/숫자/특수문자 조합으로 8-16글자로 입력해 주세요.")
		  $("#pwMsg").css("color","red")
		  pwCk = false;
		  console.log('pwCk fail')
	  }
	  else if($("#passwd").val() == ""){
		  $("#pwMsg").text("비밀번호는 영문 소문자/숫자/특수문자 조합으로 8-16글자로 입력해 주세요.")
		  $("#pwMsg").css("color","red")
		  pwCk = false;
		  console.log('pwCk fail')
	  }
	  else{
		  $("#pwMsg").html("적절한 비밀번호입니다.")
		  $("#pwMsg").css("color","blue")
		  pwCk = true;
	      console.log('pwCk ok')
	  }
	});
		
	// 2.비밀번호 확인 유효성 검사
	$("#passwd_confirm").blur(function(){
	  if($("#passwd_confirm").val() == ""){
		  $("#pwConfirmMsg").html("비밀번호 확인을 입력해주세요.")
		  $("#pwConfirmMsg").css("color","red")
		  pwcfCk = false;
		  console.log('pwCk fail')
	  }
	  else if($("#passwd_confirm").val() == $("#passwd").val()){
		  $("#pwConfirmMsg").html("입력하신 비밀번호와 일치합니다.")
		  $("#pwConfirmMsg").css("color","blue")
		  pwcfCk = true;
	      console.log('pwCk ok')
	  }
	  else if($("#passwd_confirm").val() == ""){
		  $("#pwConfirmMsg").html("입력하신 비밀번호와 맞지 않습니다.")
		  $("#pwConfirmMsg").css("color","red")
		  pwcfCk = false;
		  console.log('pwCk fail')
		}
	  else if($("#passwd_confirm").val() != $("#passwd").val()){
		  $("#pwConfirmMsg").html("입력하신 비밀번호와 맞지 않습니다.")
		  $("#pwConfirmMsg").css("color","red")
		  pwcfCk = false;
		  console.log('pwCk fail')
	  }

	  else{
		  $("#pwConfirmMsg").html("입력하신 비밀번호와 맞지 않습니다.")
		  $("#pwConfirmMsg").css("color","red")
		  pwcfCk = false;
		  console.log('pwCk fail')
	  }
	});
	
	
	// 3.번호 유효성 검사	
	// 번호 input 값이 변경될 때마다 #phone(input)에 담아서 저장
	$(".phone").on("propertychange change keyup paste input", function(){

		var p1 = $("#select").val();
		var p2 = $("#mobile2").val();
		var p3 = $("#mobile3").val();
		var phone = "";
		
		phone = p1 + p2 + p3;
		 
		$("#phone").val(phone);  //hidden value set
		
		
		// #phone의 value값을 통해 유효성 검사
		if($("#phone").val() == ""){
			$("#phoneMsg").html("번호를 입력해주세요.")
			$("#phoneMsg").css("color","red")
			phoneCk = false;
			console.log('phoneCk fail')
		}
		else if(!phoneCheck.test($("#phone").val())){
			$("#phoneMsg").html("번호를 다시 확인해주세요.")
			$("#phoneMsg").css("color","red")
			phoneCk = false;
			console.log('phoneCk 형식 fail')
		}
		else if(phoneCheck.test($("#phone").val())){
			$("#phoneMsg").html("")
			//$("#phoneMsg").css("color","blue")
			phoneCk = true;
			console.log('phoneCk ok')
		}else{
			$("#phoneMsg").html("번호를 다시 확인해주세요.")
			$("#phoneMsg").css("color","red")
			phoneCk = false;
			console.log('phoneCk 형식 fail')
		}

	});

	
	
	// 3.최종(전체) 유효성 검사
	$("#j_submit").on("click", function(){
	
		// * 최종 유효성 ck *
		if(!pwCk) {
			alert("비밀번호를 확인해주세요.");
			$("#passwd").focus();
			return false;
	    }
	    else if(!pwcfCk) {
			alert("비밀번호체크를 확인해주세요.");
			$("#passwd_confirm").focus();
			return false;
	    }
	    else{
	    	alert("회원정보 변경이 완료되었습니다.");
			return true;
	    }
	
		

	})// 유효성 검사 끝
	

	

})