<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
            <div id="contents">
                <div class="find">
                    <div class="titleArea">
                        <h2>FIND PW</h2>
                    </div><!--.titleArea-->
                    <form>
                        <div class="tab_box">
                            <div class="tab_contents">

                                <div class="find_id">
                                    <p class="find_texts">
                                        <span class="find_text4">이메일로 임시 비밀번호를 발송하였습니다.</span><!--.find_text4-->
                                    </p><!--.find_texts-->

                                    <a href="/member/login"><input type="button" value="LOGIN" id="findid_submit"></a>
                                </div><!--.find_id-->

                            </div><!--.tab_contents-->
                        </div><!--.tab_box-->
                    </form>
                </div><!--.login-->

            </div><!--#contents-->
            
            
	<script src="../resources/js/findPwResult.js"></script>		
<%@ include file="../includes/footer.jsp" %>