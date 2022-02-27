<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
			<div id="contents">
                <div class="titleArea">
                    <h2>NOTICE</h2>
                </div><!--.titleArea-->
                
                <div class="notice_detail_in">
                    <div class="board_wrap">
                        <div class="board_top">
                            <div class="d_title">
                                <input type="hidden" id="bno" name="bno" value="${detail.bno}" readonly>
            
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
                                        <a href="/board/remove?bno=${detail.bno}">DELETE</a>
                                    </li><!--.d_del_btn-->
                                    
                                    
                                    <li class="d_write_btn">
                                        <a href="/board/modify?bno=${detail.bno}">MODIFY</a>
                                    </li><!--.d_write_btn-->
            
            
                                    <li class="d_list_btn">
                                        <a href="/board/list">LIST</a>
                                    </li><!--.d_list_btn-->
                                </ul>
                            </div><!--.d_btns-->
                        </div><!--.board_footer-->

                    </div><!--.board_wrap-->

                </div><!--.notice_detail_in-->

            </div><!--#contents-->
		
<%@ include file="../includes/footer.jsp" %>