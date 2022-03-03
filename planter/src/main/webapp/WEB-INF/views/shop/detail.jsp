<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="prod_detail_in">
                    <div class="titleArea">
                        <h2>PLANT</h2>
                    </div><!--.titleArea-->
                    
                    <div class="prod_detail">
                        <div class="left">
                            <img src="./img/shop/p1-1.png" alt="">
                        </div><!--.left-->
                        <div class="right">
                        	<input type="text" value="${detail.pno}" name="pno">
                            <div class="prod_name">${detail.pname}</div>
                            <div class="prod_memo">${detail.pmemo}</div>
                            <div class="prod_price">${detail.pprice}원</div>
                            <div class="prod_btns">
                                <div class="prod_btn_bag"><a href="#">ADD TO BAG</a></div>
                                <div class="prod_btn_wish"><a href="#">ADD TO WISH</a></div>
                            </div>
                        </div><!--.right-->
                    </div><!--.prod_detail-->
                </div><!--.prod_detail_in-->
            </div><!--#contents-->
		
<%@ include file="../includes/footer.jsp" %>