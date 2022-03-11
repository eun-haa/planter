/**
 * 
 */
// shop - list
$(document).ready(function(){

	
	// * uploaded file 보여주기 *
	// 상품 목록 페이지가 시작되자마자 이미지를 출력하기 위한 ajax
	// 별도의 자바스크립트 파일로 만들어서 detail.jsp에 연결해도 됨 -> 여기서는 그냥 detail.js에 작성
	$.getJSON("/shop/prodInfoList" + ".json", function(list){

		$.getJSON("/shop/prodFileList" + ".json", function(data){// noticeController에 있는 fileList를 통해 얻어진 select 결과를 data에 저장한 후,
			
			// /shop/list.jsp에 뿌리기
			console.log(data)
			
			//var str = ["","","","",""];
			var str = new Array(list.length);
			console.log(str)
			
			$(list).each(function(i1,obj1){
				
				str[i1] ="";
				
				$(data).each(function(i,obj){ // data : select된 결과
					
					if(list[i1].pno == data[i].pno){
						console.log("원하는 이미지출력")
						
						if(obj.image){// 사용자가 업로드 한 파일의 타입이 이미지이면(jpg,png,gif) img 태그를 사용해서 웹브라우저에 이미지 출력
							// 원화표시(\) -> / 로 바꿔서 경로가 제대로 뜨게 만들기(uuid도 포함)
							// pno 값
							
							var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
							console.log(fileCallPath); // 콘솔 확인
							
							
							// img 태그를 사용해서 웹브라우저에 이미지 출력
							str[i1] += "<div data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
							str[i1] += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
							str[i1] += "<img src='/display?fileName=" + fileCallPath + "'></div>"

							console.log(str[i1])
							$(".prodUploadList").eq(i1).html(str[i1]);
						}
						
					}
					
				})
			})
		})
	})
	
	/* 상품 가격 세자리마다 콤마(,) 찍히게 표시 */
	let productPrice = parseInt($(".p_priceInput").val()); // input 태그 value는 String이라 parseInt 사용해서 숫자로 바꾸기
	$(".p_priceSpan").text(productPrice.toLocaleString()); // toLocaleString() 사용하여 콤마 찍기
	
	// 검색
	var headerSearchForm = $("#headerSearchForm");
	/* 검색 버튼을 누르면 1페이지로 가서 전체 검색이 되게끔 검색 버튼에 클릭 이벤트를 적용 */
	// button[='submit']인 것을 클릭하면
	$("#search_btn").on("click", function(e){

		if($(".header_sc").val() == ""){
			alert("검색어를 입력해주세요.")
			// submit 속성을 죽이고
			e.preventDefault();
		}else{
			// submit 속성을 죽이고
			e.preventDefault();
			// pageNum의 값을 1로 변경하고
			headerSearchForm.find("input[name='pageNum']").val("1");
			// submit
			headerSearchForm.submit();
		}

	})
})