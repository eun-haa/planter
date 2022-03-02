/**
 * 
 */

$(document).ready(function(){
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
	});
	

	
	
	// * 파일의 크기와 확장자를 검사하는 함수 선언 *
	// -> 매개변수를 통해 파일의 크기와 확장자를 받아오기
	
	// 서버에서 설정해놓은 파일 크기 설정
	var maxSize = 5242880; // 5mb로 지정
	
	// 서버에서 허용 가능한 확장자 설정
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	
	// 함수 선언
	function checkExtension(fileSize, fileName){
		// * 1.파일 크기 비교 *
		// 사용자가 선택한 파일 크기가 서버에서 설정해놓은 파일의 크기보다 크거나 같으면
		// if(사용자가 선택한 파일 크기 >= 서버에서 설정해놓은 max 파일 크기)
		if(fileName >= maxSize){
			alert("크기가 5MB 이하인 파일만 업로드 가능합니다.")
			return false;
		}
		
		
		// * 2.파일 확장자 비교 *
		// 사용자가 선택한 파일의 확장자가 서버에서 허용안되게 설정해놓은 확장자와 일치하면
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
		
		
	}// function checkExtension 끝
	//---------------------------------------------------
	
	var formObj = $("form[role='form']");
	
	// [글쓰기] 버튼을 클릭하면
	$("input[type='submit']").on("click", function(e){
		 e.preventDefault();
		 var str = "";
		 
		 // li 태그에 있는
		 $("#uploadResult ul li").each(function(i, obj){
			 console.log(obj);
			 
			 // data 선택자를 이용하여 input 태그로 value 값으로 세팅
			 str += "<input type='hidden' name ='attachList[" + i + "].fileName' value='" + $(obj).data("name") + "'>"
			 str += "<input type='hidden' name ='attachList[" + i + "].uuid' value='" + $(obj).data("uuid") + "'>"
			 str += "<input type='hidden' name ='attachList[" + i + "].uploadPath' value='" + $(obj).data("path") + "'>"
			 str += "<input type='hidden' name ='attachList[" + i + "].image' value='" + $(obj).data("type") + "'>"
		 })
		 formObj.append(str).submit();
	})
	
	//---------------------------------------------------
	// 파일 선택의 내용이 변경되면
	$("input[type='file']").on("change", function(){
		//alert("aaa");
		
		// 가상의 form 태그
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for(var i=0; i<files.length; i++){
			// 파일 크기 비교를 위해 checkExtension 함수 호출
			if(checkExtension(files[i].size, files[i].name)){
				
			}// 아니면 아래 식 실행 X
			// append를 통해서 데이터 누적시키기 위한 식
			formData.append("uploadFile", files[i]);
		}
		
		
		// ajax를 이용해서 formData 자체를 데이터로 전송
		// formData를 데이터로 전송할 때에는 processData와 contentType은 반드시 false
		$.ajax({
			url: "/uploadAjaxAction",
			type: "post",
			data: formData,
			processData: false,
			contentType: false,
			success: function(result){
				showUploadedFile(result);
			}
		})
		
		
		
	})
})// $(document).ready 밖에 선언
// showUploadFile
// 사용자가 선택한 파일을 원하는 경로에 성공적으로 업로드 한 후 웹 브라우저에 파일을 띄워라에 대한 함수 선언
function showUploadedFile(uploadresultArr){
	var str="";
	
	$(uploadresultArr).each(function(i,obj){
		console.log(obj);


		if(!obj.image){// 사용자가 업로드 한 파일의 타입이 이미지가 아니면
			fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
			
			str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
			str += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
			str += "<a href='/download?fileName=" + fileCallPath + "'>" + obj.fileName + "</a></li>"
			
		}else{// 사용자가 업로드한 파일의 타입이 이미지이면
			// 원화표시(\) -> / 로 바꿔서 경로가 제대로 뜨게하기(uuid도)
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
			console.log(fileCallPath);
			
			// img 태그를 사용해서 웹브라우저에 이미지 출력
			str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
			str += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
			str += "<img src='/display?fileName=" + fileCallPath + "'></li>"
		}
	})
	
	$("#uploadResult ul").html(str);
}