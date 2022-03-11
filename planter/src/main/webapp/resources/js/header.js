
$(document).ready(function(){
	
	/* 검색 */
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
	
	//--------------------------------------------------//
	/* SHOP 버튼 누르면 전체 카테고리 닫을 수 있고,다시 클릭하면 열 수 있음 */
	// if문에 활용할 불린값 정의
	let btn = true;
	
	// 기본값 = 모두 보이게
	$(".shop_btn").show();
	$(".shop_record").show();
	
	// SHOP 버튼을 클릭했을 때
    $(".shop_btn").on("click", function(e){
    	e.preventDefault();
    	if(btn == true){
            $(".shop_record").slideUp(150);
            
            btn = false;
    	}else if(btn == false){
    		$(".shop_record").slideDown(150);
    		
    		btn = true;
    	}
    	
    });

})
