<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>NOTICE</h2>
                </div><!--.titleArea-->

                <div class="write">
                    <form role="form" action="/notice/write" method="post" enctype="multipart/form-data" >
                        <div class="w_box">
                        
                            <input type="hidden" name="writer" value="${login.name}">
                            <div class="w_title">
                                <input type="text" name="title" placeholder="TITLE">
                            </div><!--.w_title--> 
        
                            <div class="w_content">
                                <textarea name="content" id="" cols="100" rows="40" placeholder="CONTENTS"></textarea>
                                <div class="w_content_file">
                                    <!-- <input id="board_write_file" type="file" name="uploadFile" class="uploadFile" multiple> -->
                                    <label for="file">파일 선택</label>
                                    <input type="file" id="file" name="uploadFile" multiple>
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
<%@ include file="../includes/footer.jsp" %>