/**
 * 
 */

$(document).ready(function(){

	
	// pno 값
	var pno = $("#pno").val();
	// * uploaded file 보여주기 *
	// 상세페이지가 시작되자마자 이미지를 출력하기 위한 ajax
	// 별도의 자바스크립트 파일로 만들어서 detail.jsp에 연결해도 됨 -> 여기서는 그냥 detail.js에 작성
	$.getJSON("/shop/detailFile/" + pno + ".json", function(data){// noticeController에 있는 fileList를 통해 얻어진 select 결과를 data에 저장한 후,
		
		// detail.jsp에 뿌리기
		console.log(data)
		
		var str = "";
		
		$(data).each(function(i,obj){ // data : select된 결과
			if(!obj.image){// 사용자가 업로드 한 파일의 타입이 이미지가 아니면(excel, ppt 등)
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
				
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
				str += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
				str += "<a href='/download?fileName=" + fileCallPath + "'>" + obj.fileName + "</a></li>"
				
			}else{// 사용자가 업로드 한 파일의 타입이 이미지이면(jpg,png,gif) img 태그를 사용해서 웹브라우저에 이미지 출력
				
				// 원화표시(\) -> / 로 바꿔서 경로가 제대로 뜨게 만들기(uuid도 포함)
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
				console.log(fileCallPath); // 콘솔 확인
				
				// img 태그를 사용해서 웹브라우저에 이미지 출력
				str += "<div data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
				str += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
				str += "<img src='/display?fileName=" + fileCallPath + "'></div>"
			}
			$(".left").html(str);
		
		})
	})
	
	
	
	
	
	
	
	/* 카트 담기 */
	// 수량 버튼 조작
	let quantity = $(".quantity").val();
	$(".q_plus").on("click", function(){
		$(".quantity").val(++quantity);
	});
	$(".q_minus").on("click", function(){
		if(quantity > 1){
			$(".quantity").val(--quantity);	
		}
	});
	
	// 서버로 전송할 데이터
	let form = {
			mid : $("#mid").val(),
			pno : $("#pno").val(),
			pcount : ''
	}
	
	
	// 카드 담기 버튼을 누르면
	$(".prod_btn_bag").on("click", function(e){
		// pcount에 최종 데이터 담기
		form.pcount = $(".quantity").val();
		console.log("ajax 진입 전");
		console.log("form.mid = " + form.mid, "form.pno = " + form.pno, "form.pcount = " + form.pcount);
		
		$.ajax({
			url: '/cart/add',			// 호출할 url
			type: 'POST',				// 호출 할 방법(GET/POST/PUT 등)
			data: form,					// 서버로 보낼 데이터
			dataType: "json",
			success: function(result){	// 서버가 요청을 성공적으로 수행했을 때 수행 될 메서드, 파라미터는 서버가 반환한 값
				cartAlert(result);
				console.log(result);
				
			}
		})
	});
	
	// 서버가 반환할 값에 따라 띄울 경고창 메서드
	// 위 ajax문 내부 success 내부에 넣어도 되지만 따로 빼서 작성한 뒤 ajax에서 호출하는 방식으로 진행
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가에 실패했습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("이미 장바구니에 추가된 상품입니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
})