/**
 * 
 */

$(document).ready(function(){
	var boardSearchForm = $("#boardSearchForm");
	
	$(".pager_button a").on("click", function(e){
		e.preventDefault();
		boardSearchForm.find("input[name='pageNum']").val($(this).attr("href"));
		boardSearchForm.submit();
	})
})