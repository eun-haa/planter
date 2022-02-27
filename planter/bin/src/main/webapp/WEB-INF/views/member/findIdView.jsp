<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

            <div id="contents">
                <div class="find">
                    <div class="titleArea">
                        <h2>FIND ID</h2>
                    </div><!--.titleArea-->
                    
                    <div class="tab_box">
                        <div class="tab_contents">

                            <div class="find_id">
                                <p class="find_texts">
                                    <span class="find_text4">회원님의 아이디는 <span style="font-weight:500;">${member.mid}</span> 입니다.</span><!--.find_text4-->
                                </p><!--.find_texts-->

                                <a href="/member/findPw"><input type="submit" class="fiv_btn" value="FIND PW" id="findid_submit"></a>
                                <a href="/member/login"><input type="submit" value="LOGIN" id="findid_submit"></a>
                            </div><!--.find_id-->

                        </div><!--.tab_contents-->
                    </div><!--.tab_box-->
                    
                </div><!--.login-->

            </div><!--#contents-->
            
            
		
<%@ include file="../includes/footer.jsp" %>