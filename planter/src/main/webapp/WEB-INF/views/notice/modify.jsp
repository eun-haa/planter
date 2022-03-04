<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- 첨부되어 있던 파일 보여주기 -->
<script type="text/javascript">
$(document).ready(function(){
	// pno 값
	var nno = $("#nno").val();
	// * uploaded file 보여주기 *
	// 상세페이지가 시작되자마자 이미지를 출력하기 위한 ajax
	// 별도의 자바스크립트 파일로 만들어서 detail.jsp에 연결해도 됨 -> 여기서는 그냥 detail.js에 작성
	$.getJSON("/notice/fileList/" + nno + ".json", function(data){// noticeController에 있는 fileList를 통해 얻어진 select 결과를 data에 저장한 후,
		
		// detail.jsp에 뿌리기
		console.log(data)
		
		var str = "";
		
		$(data).each(function(i,obj){ // data : select된 결과

			// 원화표시(\) -> / 로 바꿔서 경로가 제대로 뜨게 만들기(uuid도 포함)
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
			console.log(fileCallPath); // 콘솔 확인
			
			// img 태그를 사용해서 웹브라우저에 이미지 출력
			str += "<div data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
			str += "' data-name='" + obj.fileName + "' data-type='" + obj.image + "'>"
			str += "<img src='/display?fileName=" + fileCallPath + "'></div>"

			$("#uploadResult ul").html(str);
		
		})
	})
})
</script>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>NOTICE</h2>
                </div><!--.titleArea-->

                <div class="write">
                    <form role="form" action="/notice/modify" method="post">
                        <div class="w_box">
                        	
                        	<input type="hidden" name="nno" id="nno" value="${detail.nno}">
                            <input type="hidden" name="writer" value="${detail.writer}">
                            <div class="w_title">
                                <input type="text" name="title" placeholder="TITLE" value="${detail.title}">
                            </div><!--.w_title--> 
        
                            <div class="w_content">
                                <textarea name="content" id="" cols="100" rows="40" placeholder="CONTENTS">${detail.content}</textarea>
								<div class="w_content_file">
                                	<label for="file">파일 선택</label>
                               		<input type="file" id="file" name="uploadFile">
                               		<input class="upload-name" value="선택된 파일없음" placeholder="" readonly>
                                    <div id="uploadResult">
                                        <!-- 업로드한 파일의 썸네일이 들어갈 공간 -->
                                        <ul></ul>
                                    </div>
	                             </div><!--.w_content_file-->
                            </div><!--.w_content-->
        
                        </div><!--.w_box-->
        

                       	<input id="board_write_submit" type="submit" value="SUBMIT" >

                    </form>
                </div><!--.write-->

                    

            </div><!--#contents-->
    <script type="text/javascript" src="../resources/js/uploadAjax.js"></script>
	<script type="text/javascript" src="../resources/js/notice/modify.js"></script>		
<%@ include file="../includes/footer.jsp" %>