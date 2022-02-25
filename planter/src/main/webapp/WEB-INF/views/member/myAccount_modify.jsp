<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

            <div id="contents">
                <div class="titleArea">
                    <h2>PROFILE</h2>
                </div><!--.titleArea-->
                <form id="joinForm" name="joinForm" action="/member/join" method="post" onsubmit="return valid()">
                
	                <div class="join_table">
	                    <table border="1" summary="">
	                        <!-- <caption>회원 기본정보</caption> -->
	                        <colgroup>
	                            <col style="width:200px;">
	                            <col style="width:auto;">
	                        </colgroup>
	
	                        <tbody>
	                            <tr>
	                                <th scope="row">ID</th>
	                                <td><input id="mid" name="mid" class="inputTypeText"value="${login.mid}" type="text" disabled>
		                                <div id="idMsg" class="text_guide error"></div> 
		                                <!-- <p class="text_guide">영문 소문자/숫자를 조합, 4-16자</p> -->
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">PASSWORD</th>
	                                <td><input id="passwd" name="passwd" value="" type="password">
		                                <div id="pwMsg" class="text_guide error"></div>  
		                                <p class="text_guide">영문 소문자/숫자/특수문자를 조합, 8자-16자</p>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">PASSWORD CHECK</th>
	                                <td><input id="passwd_confirm" name="user_passwd_confirm" value="" type="password"> 
	                                	<div id="pwConfirmMsg" class="text_guide error"></div>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row" id="nameTitle">NAME</th>
	                                <td>
	                                	<span id="nameContents"><input type="text" value="${login.name}" name="name" id="name" maxlength="20" disabled></span>
	                                	<div id="nameMsg" class="text_guide error"></div>  
	                                </td>
	                            </tr>
	
	                            <tr class="join_mobile">
	                                <th scope="row">MOBILE</th>
	                                <td>
	                                    <select id="select" name="p1" class="phone" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="">
	                                    	<option value="선택">선택</option>
	                                        <option value="010">010</option>
	                                        <option value="011">011</option>
	                                        <option value="016">016</option>
	                                        <option value="017">017</option>
	                                        <option value="018">018</option>
	                                        <option value="019">019</option>
	                                    </select> - <input id="mobile2" name="p2" class="phone" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">- <input id="mobile3" class="phone" name="p3" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">
	                                    
	                                    <input type="text" name="phone" id="phone" class="mobile_all" value="${login.phone}">
	                                    <div id="phoneMsg" class="text_guide error"></div> 
	                                </td>
	                            </tr>
	
	                            <!-- <tr class="">
	                                <th scope="row">SMS 수신여부 </th>
	                                <td><input id="is_sms0" name="is_sms" fw-label="is_sms" fw-msg="" class="ec-base-chk" value="T" type="checkbox" checked><label for="is_sms0">동의함</label><p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
	                                </td>
	                            </tr> -->
	
	                            <tr>
	                                <th scope="row">EMAIL</th>
	                                <td><input id="email" name="email" value="${login.email}" type="text"> 
	                                	<div id="emailMsg" class="text_guide error"></div>
	                                </td>
	                            </tr>
	
	                            <!-- <tr class="">
	                                <th scope="row">이메일 수신여부 </th>
	                                <td>
	                                    <input id="is_news_mail0" name="is_news_mail" fw-label="is_news_mail" fw-msg="" class="ec-base-chk" value="T" type="checkbox" checked><label for="is_news_mail0">동의함</label><p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
	                                </td>
	                            </tr> -->
	
	                            <tr class="adress">
	                                <th scope="row">ADRESS</th>
	                                <td>
	                                    <input id="sample6_postcode" value="${login.postcode}" class="postcode" name="postcode" type="text"><input class="postcode_btn" onclick="sample6_execDaumPostcode()" type="button" value="우편번호찾기">
	                                    <br>
	                                    <input id="sample6_address" class="address1" name="address1" type="text" value="${login.address1}">
	                                    <div class="adress_inputs">
	                                        <input id="sample6_detailAddress" value="${login.address2}" class="address2" name="address2" type="text"><input id="sample6_extraAddress" value="${login.address3}" class="address3" name="address3" type="text">
	                                    </div><!--.adress_inputs-->
	                                </td>
	                            </tr>
	                            
	                            <tr class="displaynone"><!-- 회원 권한 -->
	                                <th scope="row">ROLE</th>
	                                	<td><input id="role" name="role" value="0" type="text">
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	
	                    <!-- <div class="text-button-center">
	                        <a href="" class="btn_1000">SUBMIT</a>
	                    </div> -->
	                    <input id="j_submit" type="submit" value="MODIFY">
	                </div><!--.join_table-->
				</form>

            </div><!--#contents-->

    <script src="../resources/js/join-daum.js"></script>
<%@ include file="../includes/footer.jsp" %>