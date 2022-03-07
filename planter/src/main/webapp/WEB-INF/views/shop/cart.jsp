<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">

				<div class="titleArea">
				    <h2>CART</h2>
				</div><!--.titleArea-->
				
				<div class="cart_box">
					<div class="cart_msg displaynone">장바구니가 비어있습니다.</div>
					<form>
	                    <div class="cart_list_table">
	                        <table border="1" summary="" class="cart_list">
	                            <!-- <caption>상품 게시판 목록</caption> -->
	                            <thead class="">
	                                <tr>
	                                    <th scope="col" class="c_no displaynone">ID</th>
	                                    <th scope="col" class="c_image">IMAGE</th>
	                                    <th scope="col" class="c_name">NAME</th>
	                                    <th scope="col" class="c_price">PRICE</th>
	                                    <th scope="col" class="c_qty">QTY</th>
	                                    <th scope="col" class="c_delivery">DELIVERY</th>
	                                    <th scope="col" class="c_charge">CHARGE</th>
	                                    <th scope="col" class="c_choice">CHOICE</th>
	                                </tr>
	                            </thead>
	
	                            <tbody class="">
	
	                            	<!--<c:forEach items="${list}" var="product">
		                            	<tr>	                                    
		                                    <td scope="col" class="c_no">${product.pno}</td>
		                                    <td scope="col" class="c_image prodUploadList"><a href="/shop/detail?pno=${product.pno}"></a></td>
		                                    <td scope="col" class="c_name"><a href="/shop/detail?pno=${product.pno}">${product.pname}</a></td>
		                                    <td scope="col" class="c_price">${product.ppname}</td>
		                                    <td scope="col" class="c_qty">1</td>
		                                    <td scope="col" class="c_delivery">기본배송</td>
		                                    <td scope="col" class="c_charge">3000원<br>조건</td>
		                                    <td scope="col" class="c_choice">
		                                    	<a href="#">BUY NOW</a>
		                                    	<a href="#">WISHLIST</a>
		                                    	<a href="#">DELETE</a>
		                                    </td>
	                                    	
		                                </tr>
	                            	</c:forEach>-->
	                            		                            	
		                            	<tr>	                                    
		                                    <td scope="col" class="c_no displaynone">${product.pno}</td>
		                                    <td scope="col" class="c_image prodUploadList"><a href="/shop/detail?pno=${product.pno}"></a></td>
		                                    <td scope="col" class="c_name"><a href="/shop/detail?pno=${product.pno}">ddd</a></td>
		                                    <td scope="col" class="c_price">${product.ppname}</td>
		                                    <td scope="col" class="c_qty">1</td>
		                                    <td scope="col" class="c_delivery">기본배송</td>
		                                    <td scope="col" class="c_charge">3000원<br>조건</td>
		                                    <td scope="col" class="c_choice">
		                                    	<a href="#">BUY NOW</a>
		                                    	<a href="#">WISHLIST</a>
		                                    	<a href="#">DELETE</a>
		                                    </td>
	                                    	

		                                </tr>


	
	                            </tbody>

	                        </table>
	                        
	                        <table border="1" summary="" class="cart_total">
	                        	<thead>
									<th scope="col" class="t_price">총 상품금액</th>
									<th scope="col" class="t_delivery">총 배송비</th>
									<th scope="col" class="t_total">결제예정금액</th>
	                        	</thead>
	                        	
	                        	<tbody>
	                        		<td scope="col" class="t_price">30000원</td>
		                            <td scope="col" class="t_delivery">+ 3000원</td>
		                            <td scope="col" class="t_total">33000원</td>
	                        	</tbody>
	                        </table>
						</div><!-- .cart_box -->
						
						<div class="cart_btns">
							<input type="submit" value="전체상품주문" class="cart_all_btn">
							<input type="submit" value="선택상품주문" class="cart_sel_btn">
						</div><!-- .cart_btns -->
					</form>
            </div><!--#contents-->
<script src="../resources/js/shop/detail.js"></script>			
<%@ include file="../includes/footer.jsp" %>