<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<!-- 첨부되어 있던 파일 보여주기 -->
<script type="text/javascript">
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

			// 원화표시(\) -> / 로 바꿔서 경로가 제대로 뜨게 만들기(uuid도 포함)
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
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
                    <h2>PRODUCT</h2>
                </div><!--.titleArea-->


                <div class="product_reg_table">
                	<form role="form" action="/admin/modify" method="post" enctype="multipart/form-data" >
	                    <table border="1" summary="">
	                        <tbody>
	                        	<tr class=""><!-- class="displaynone" -->
	                                <th scope="row">PNO</th>
	                                <td>
	                                    <input type="text" id="pno" name="pno" value="${detail.pno}" class="prod_reg_input">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row">CATEGORY</th>
	                                <td>
	                                    <select class="cid_selected">
	                                        <option value="1">PLANT</option>
	                                        <option value="2">FLOWER</option>
	                                        <option value="3">GARDENING</option>
	                                        <option value="4">PLANTERIOR</option>
	                                    </select>
	                                    
	                                </td>
	                                <td><input id="cid" type="hidden" name="cid" value="${detail.cid}" class="prod_reg_input"></td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">NAME</th>
	                                <td>
	                                    <input type="text" name="pname" value="${detail.pname}" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">PRICE</th>
	                                <td>
	                                    <input type="text" name="pprice" value="${detail.pprice}" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">DISCOUNT</th>
	                                <td>
	                                    <input type="text" name="pdiscount" value="${detail.pdiscount}" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">STOCK</th>
	                                <td>
	                                    <input type="text" name="pstock" value="${detail.pstock}" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">MEMO</th>
	                                <td>
	                                    <textarea name="pmemo" id="" cols="30" rows="10">${detail.pmemo}</textarea>
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                                <th scope="row">IMAGE</th>
	                                <td>
	                                    <div class="w_content_file">
	                                    	<label for="file">파일 선택</label>
                                    		<input type="file" id="file" name="uploadFile">
                                    		<input class="upload-name" value="선택된 파일없음" placeholder="" readonly>
                                            <div id="uploadResult">
                                                <!-- 업로드한 파일의 썸네일이 들어갈 공간 -->
                                                <ul></ul>
                                            </div>
	                                    </div><!--.w_content_file-->
	                                </td>
	                            </tr>
	                        </tbody>
	                        
	                    </table>
	                    <input id="prod_reg_submit" type="submit" value="SUBMIT">
    				</form>
                    
                </div><!--.product_reg_table-->
            </div><!--#contents-->
	<script type="text/javascript" src="../resources/js/uploadAjax.js"></script>
	<script type="text/javascript" src="../resources/js/admin/modify.js"></script>
<%@ include file="../includes/footer.jsp" %>