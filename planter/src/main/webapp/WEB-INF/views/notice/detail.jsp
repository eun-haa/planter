<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<script type="text/javascript">
	
	function noticeDelete(nno) {
	
		if (confirm(nno + "번 게시글을 삭제할까요?")) {
			var uri = "/notice/delete?nno=";
			var html = "";
	
			html += '<form name="dataForm" action="' + uri + nno + '" method="post">';
			html += '<input type="hidden" name="nno" value="' + nno + '" />';
			html += '</form>';
	
			$("body").append(html);
			document.dataForm.submit();
		}
	}
</script>
		<!-- #contents 부분만 본문에 넣기-->
			<div id="contents">
                <div class="titleArea">
                    <h2>NOTICE</h2>
                </div><!--.titleArea-->
                
                <div class="notice_detail_in">
                    <div class="board_wrap">
                        <div class="board_top">
                            <div class="d_title">
                                <input type="hidden" id="bno" name="nno" value="${detail.nno}" readonly>
            
                                <div class="d_title_name">
                                   	 ${detail.title}
                                </div>
                                
                                   <ul>
                                       <li>POSTED BY : ${detail.writer}</li>
                                       <li>${detail.regdate}</li>
                                   </ul>
            
                            </div><!--.d_title-->
                        </div><!--.board_top-->

                        <div class="board_detail">
                            <div class="d_content">
                                	${detail.content}
                                <div id="uploadResult">
                                <!-- 업로드한 파일이 들어갈 공간 -->
                                    <ul></ul>
                                </div>
                            </div><!--.n_content-->
                        </div><!--.board_detail-->

                        <div class="board_footer">
                            <div class="d_btns">
                                <ul>
                                
                                    <li class="d_del_btn">
                                    	<button onclick="noticeDelete([[${detail.nno}]])">DELETE</button>
                                    </li><!--.d_del_btn-->
                                    
                                    
                                    <li class="d_write_btn">
                                        <a href="/notice/modify?nno=${detail.nno}">MODIFY</a>
                                    </li><!--.d_write_btn-->
            
            
                                    <li class="d_list_btn">
                                        <a href="/notice/list">LIST</a>
                                    </li><!--.d_list_btn-->
                                </ul>
                            </div><!--.d_btns-->
                        </div><!--.board_footer-->

                    </div><!--.board_wrap-->

                </div><!--.notice_detail_in-->

            </div><!--#contents-->
<%@ include file="../includes/footer.jsp" %>