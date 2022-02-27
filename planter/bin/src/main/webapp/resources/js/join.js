// ck
var idCk = false;
var pwCk = false;
var pwcfCk = false;
var nameCk = false;
var phoneCk = false;
var emailCk = false;
var agreeCk = false;

$(document).ready(function(){
	// * 기본 설정 *
	// 페이지가 로딩됐을때 #mid 를 가진 input 태그부터 선택
	$("#mid").focus();
	
	// id 입력부분에서 엔터키를 쳤을 경우 pw 입력부분으로 포커스 이동
	$("#mid").keydown(function(event){ 
		if(event.keyCode == 13){ 
			$("#passwd").focus();
		} 
	});
	
	// 정규식
	// id : 영문 소문자/숫자를 조합, 4~16글자
	var idCheck = RegExp(/^[a-z0-9]{4,16}$/);
	// pw : 영문 소문자/숫자/특수문자를 조합, 8~16글자
	var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	// name : 2~6글자의 한글만 입력하였는지 검사
	var nameCheck = RegExp(/^[가-힣]{2,6}$/);
	// phoneCheck : 숫자로만 11~12
	var phoneCheck = RegExp(/^[0-9]{11,12}$/);
	// email : 이메일 형식에 맞게 썼는지 검사 ex)aaa@gmail.com
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	// 유효성 검사 - ajax
	// 1.아이디 유효성 검사
	 $("#mid").blur(function(){
		$.ajax({
		    url: "/member/id_check",
		    type: "post",
		    data: {"mid":$("#mid").val()},
		    dataType: "json",
		    success:function(data){

		    	if(data != 0 && $("#mid").val() != ""){
				      $("#idMsg").html("이미 존재하는 아이디입니다.")
				      $("#idMsg").css("color","red")
					  idCk = false;
					  console.log("id fail")
		        }
		    	else if($("#mid").val() == ""){
		    		  $("#idMsg").html("아이디를 입력해주세요.")
		        	  //$("#idMsg").html("아이디는 영문소문자와 숫자를 조합하여 4-16자로 입력해 주세요.")
					  idCk = false;
					  console.log("id fail")
		    	}
		        else if(!idCheck.test($("#mid").val())){
		        	  $("#idMsg").html("아이디는 영문소문자와 숫자를 조합하여 4-16자로 입력해 주세요.")
					  idCk = false;
					  console.log("id fail")
		        }
		        else if(data == 0){
					  $("#idMsg").html("사용가능한 아이디입니다.")
					  $("#idMsg").css("color","blue")
				      idCk = true;
				      console.log("id ok")
		        }

		        console.log("data : " + data);
		    },
		    error:function(){
		        alert("error");
		    }
		})
	 });
	 
	// 2.비밀번호 유효성 검사
	$("#passwd").blur(function(){
	  if(!pwCheck.test($("#passwd").val())){
		  $("#pwMsg").html("비밀번호는 영문 소문자/숫자/특수문자 중 2가지 이상 조합으로 10-16글자로 입력해 주세요.")
		  pwCk = false;
		  console.log('pwCk fail')
	  }
	  else if($("#passwd").val() == ""){
		  $("#pwMsg").text("비밀번호는 영문 소문자/숫자/특수문자 중 2가지 이상 조합으로 10-16글자로 입력해 주세요.")
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
		
	// 3.비밀번호 확인 유효성 검사
	$("#passwd_confirm").blur(function(){
	  if($("#passwd_confirm").val() == ""){
		  $("#pwConfirmMsg").html("")
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
	
	// 4.이름 유효성 검사
	$("#name").blur(function(){
		if($("#name").val() == ""){
			$("#nameMsg").html("이름을 입력해주세요.")
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
	
	// 5.번호 유효성 검사	
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

	

	
	// 6.이메일 유효성 검사(아이디와 마찬가지로 중복이 불가하게 처리)
	 $("#email").blur(function(){
			$.ajax({
			    url: "/member/email_check",
			    type: "post",
			    data: {"email":$("#email").val()},
			    dataType: "json",
			    success:function(data){

			    	if(data != 0 && $("#email").val() != ""){
					      $("#emailMsg").html("이미 가입된 이메일입니다.")
					      $("#idMsg").css("color","red")
						  emailCk = false;
						  console.log("emailCk fail")
			        }
			    	else if($("#email").val() == ""){
			    		  $("#emailMsg").html("이메일을 입력해주세요.")
			        	  $("#emailMsg").css("color","red")
						  emailCk = false;
						  console.log("emailCk fail")
			    	}
			        else if(!emailCheck.test($("#email").val())){
			        	  $("#emailMsg").html("이메일을 다시 확인해주세요.")
			        	  $("#emailMsg").css("color","red")
						  emailCk = false;
						  console.log("emailCk fail")
			        }
			        else if(data == 0){
						  $("#emailMsg").html("사용가능한 이메일입니다.")
						  $("#emailMsg").css("color","blue")
					      idCk = true;
					      console.log("emailCk ok")
			        }

			        console.log("data : " + data);
			    },
			    error:function(){
			        alert("error");
			    }
			})
		 });
	
	
	// 7.최종(전체) 유효성 검사
	$("#j_submit").on("click", function(){
		
		// * 이용 동의 및 개인정보제공동의 체크 여부 확인 *
		if($("input[name='agree_check']").is(":checked") == true){
			agreeCk = true;
		}else{
			agreeCk = false;
		}
		
		// * 최종 유효성 ck *
	    if(!idCk) {
	        alert("아이디를 확인해주세요.");
	        $("#mid").focus();
	        return false;
	    }
	    else if(!pwCk) {
			alert("비밀번호를 확인해주세요.");
			$("#passwd").focus();
			return false;
	    }
	    else if(!pwcfCk) {
			alert("비밀번호체크를 확인해주세요.");
			$("#passwd_confirm").focus();
			return false;
	    }
	    else if(!nameCk) {
			alert("이름을 확인해주세요.");
			$("#name").focus();
			return false;
	    }
	    else if(!phoneCk){
			alert("번호를 확인해주세요.");
			$("#phone").focus();
			return false;
	    }
	    else if(!emailCk){
			alert("이메일을 확인해주세요.");
			$("#email").focus();
			return false;
	    }
	    else if(!agreeCk){
			alert("이용약관 및 개인정보 수집/이용에 동의해주세요.");
			$("input[name='agree_check']").focus();
			return false;
	    }
	    else{
			return true;
	    }
	
		

	})// 유효성 검사 끝
	

	


	
	
	
	
	
	
// 유효성 검사 - 기본
//	// 회원가입 유효성 검사
//	$("#j_submit").on("click", function(){
//		//alert("aaa");
//		
//		// 정규식
//		// id : 영문 소문자/숫자, 4~16글자
//		var idCheck = RegExp(/^[a-z0-9]{4,16}$/);
//		// pw : 영문 소문자/숫자/특수문자 중 2가지 이상 조합, 10~16글자
//		var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{10,16}$/);
//		// name : 2~6글자의 한글만 입력하였는지 검사
//		var nameCheck = RegExp(/^[가-힣]{2,6}$/);
//		// phoneCheck : 01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사
//		var phoneCheck = RegExp(/^01[0179][0-9]{7,8}$/);
//		// email : 이메일 형식에 맞게 썼는지 검사 ex)aaa@gmail.com
//		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
//		
//		// 1-1.아이디 공백 체크
//		if($("#mid").val() == ""){
//			$("#idMsg").html("아이디는 영문소문자 또는 숫자 4-16자로 입력해 주세요.");
//			$("#mid").focus();
//			return false;
//		}
//		
//		// 1-2.아이디 정규식 체크
//		if(!idCheck.test($("#mid").val())){ 
//			//alert("아이디 작성 형식에 맞게 입력해주세요.");
//			$("#idMsg").html("아이디는 영문소문자 또는 숫자 4-16자로 입력해 주세요.");
//			$("#mid").val(""); 
//			$("#mid").focus(); 
//			return false; 
//		}
//		
//		// 2-1.아이디 비밀번호 같은지 체크
//		if($("#mid").val() == $("#passwd").val()){ 
//			$("#pwMsg").html("아이디와 비밀번호가 같습니다.");
//			$("#passwd").val(""); 
//			$("#passwd").focus(); 
//			return false;
//		}
//
//		// 2-2.비밀번호 공백 체크
//		if($("#passwd").val() == ""){
//			$("#pwMsg").html("비밀번호는 영문 소문자/숫자/특수문자 중 2가지 이상 조합으로 10-16글자로 입력해 주세요.");
//			$("#passwd").focus();
//			return false;
//		}
//		
//		// 2-3.비밀번호 정규식 체크
//		if(!pwCheck.test($("#passwd").val())){ 
//			//alert("아이디 작성 형식에 맞게 입력해주세요.");
//			$("#pwMsg").html("비밀번호는 영문 소문자/숫자/특수문자 중 2가지 이상 조합으로 10-16글자로 입력해 주세요.");
//			$("#passwd").val(""); 
//			$("#passwd").focus(); 
//			return false; 
//		}
//		
//		// 3-1.비밀번호 확인 공백 체크
//		if($("#passwd_confirm").val() == ""){
//			$("#pwConfirmMsg").html("비밀번호가 일치하지 않습니다.");
//			$("#passwd_confirm").focus();
//			return false;
//		}
//		
//		// 3-2.비밀번호 확인 유효성 체크
//		if($("#passwd").val() != $("#passwd_confirm").val()){ 
//			$("#pwConfirmMsg").html("비밀번호가 일치하지 않습니다.");
//			//$("#passwd").val(""); 
//			$("#passwd_confirm").val(""); 
//			$("#passwd_confirm").focus(); 
//			return false; 
//		}
//
//		// 4-1.이름 공백 체크
//		if($("#name").val() == ""){
//			$("#nameMsg").html("이름을 입력하세요.");
//		}
//		
//
//		
//		
//		
//	})

})