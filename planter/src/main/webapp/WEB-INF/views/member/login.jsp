<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
    <script src="../resources/js/login.js"></script>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="login">
                    <div class="titleArea">
                        <h2>LOGIN</h2>
                    </div><!--.titleArea-->
                    <form onsubmit="return login()">
	                    <fieldset>
	                        <legend>회원로그인</legend>
	                        <div class="login_form">
	                        	<input id="member_id" name="mid" placeholder="MEMBER ID" value="" type="text">
	                        	<input id="member_passwd" name="passwd" value="" type="password" placeholder="PASSWORD">                        
	                        </div>
	                        <div id="loginMsg"></div>        
	                        <div class="login_btn">
	                        	
	                        	
	                            <ul>
	                                <li class="left">
	                                    <a href="/member/join">JOIN</a>
	                                    <a href="/member/findId">FORGOT ID</a>
	                                    <a href="/member/findPw">FORGOT PW</a>
	                                </li>									
	                            </ul>
								
	                            <input type="submit" value="LOGIN" id="login_submit">
	
	                            <!-- <ul class="sns_login">
	                                <li class="displaynone"><a href="#none" onclick="" class="btn_facebook">FACEBOOK LOGIN</a></li>
	                                <li class="displaynone"><a href="#none" onclick="" class="btn_naver">NAVER LOGIN</a></li>    
	                                <li class="displaynone"><a href="#none" onclick="" class="btn_google">GOOGLE LOGIN</a></li>
	                                <li class="displaynone"><a href="#none" onclick="" class="btn_kakao">KAKAOTALK LOGIN</a></li>
	                            </ul> -->
	                        </div>
	                    </fieldset>
                    </form>
                </div>


            </div><!--#contents-->

<%@ include file="../includes/footer.jsp" %>