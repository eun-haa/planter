<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>CART LIST</h2>
                </div><!--.titleArea-->
                <div class="notice_list_in">
                	<input type="text" value="${login.mid}">
                	<input type="text" value="">
                	<c:if test="">
                		<div>장바구니가 비었습니다.</div>
                	</c:if>
                    <div class="cart_list_table">
                        <table border="1" summary="">
                            <!-- <caption>상품 게시판 목록</caption> -->
                            <thead class="">
                                <tr>
                                    <th scope="col" class="c_no">PNO</th>
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
                            	<c:forEach items="${list}" var="cart">
	                            	<tr>	                                    
	                                    <td scope="col" class="c_no">${cart.pno}</td>
	                                    <td scope="col" class="c_image prodUploadList"><a href="#"></a></td>
	                                    <td scope="col" class="c_name"><a href="#">${cart.pname}</a></td>
	                                    <td scope="col" class="c_price">${cart.pprice}</td>
	                                    <td scope="col" class="c_qty">1</td>
	                                    <td scope="col" class="c_delivery">기본배송</td>
	                                    <td scope="col" class="c_charge">3000원</td>
	                                    <td scope="col" class="c_choice">
	                                    	<a href="#">BUY NOW</a>
	                                    	<a href="#">WISHLIST</a>
	                                    	<a href="#">DELETE</a>
	                                    </td>
	                                </tr>
                            	</c:forEach>


                            </tbody>
                        </table>
                        
                        <table border="1" summary="" class="cart_total">
                        	<tr>
                        		<th>총 상품금액</th>
                        		<th>총 배송비</th>
                        		<th>결제예정금액</th>
                        	</tr>
                        	<tr>
                        		<td>${cart.totalPrice}원</td>
                        		<td>3000원</td>
                        		<td>${cart.totalPrice + 3000}원</td>
                        	</tr>
                        </table>

                        <div class="product_sw">

						<div class="cart_btns">
							<button type="submit" class="cart_all_btn">전체상품주문</button>
							<button type="submit" class="cart_sel_btn">선택상품주문</button>
						</div>
                            
                           
                        </div><!--sw-->
                    </div>




            
                </div><!--.notice_list_in-->
            </div><!--#contents-->
    <script src="../resources/js/admin/list.js"></script>
<%@ include file="../includes/footer.jsp" %>