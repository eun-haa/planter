/**
 * 
 */

$(document).ready(function(){
	var boardSearchForm = $("#boardSearchForm");
	/* 1.선택한 페이지 번호에 href 속성 추가(이동할 수 있게) */
	// 현재 페이지 번호를 클릭하면
	$(".pager_button a").on("click", function(e){
		// a 태그의 속성을 죽이고
		e.preventDefault();
		// input[name='pageNum']인 것을 찾아서 'href' 속성 추가
		boardSearchForm.find("input[name='pageNum']").val($(this).attr("href"));
		// submit
		boardSearchForm.submit();
	})
	
	/* 2.검색 버튼을 누르면 1페이지로 가서 전체 검색이 되게끔 검색 버튼에 클릭 이벤트를 적용 */
	// input[='submit']인 것을 클릭하면
	$("input[='submit']").on("click", function(e){
		// submit 속성을 죽이고
		e.preventDefault();
		// pageNum의 값을 1로 변경하고
		boardSearchForm.find("input[name='pageNum']").val("1");
		// submit
		boardSearchForm.submit();
	})
})