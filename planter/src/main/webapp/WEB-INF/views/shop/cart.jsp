<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
               <div class="adminMenu">
                	<h2><a href="/admin/main">ADMIN MAIN</a></h2>
                    <h2><a href="/admin/productReg">REGISTER</a></h2>
                    <h2><a href="#">REVIEW</a></h2>
                    <h2><a href="#">MEMBER</a></h2>
                </div><!--.titleArea-->
                <div class="titleArea">
                    <h2>PRODUCT LIST</h2>
                </div><!--.titleArea-->
                <div class="notice_list_in">
                    <div class="cart_list_table">
                        <table border="1" summary="">
                            <!-- <caption>상품 게시판 목록</caption> -->
                            <thead class="">
                                <tr>
                                    <th scope="col" class="c_no displaynone">PNO</th>
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
	                                    <td scope="col" class="c_no displaynone">${product.pno}</td>
	                                    <td scope="col" class="c_image prodUploadList"><a href="/shop/detail?pno=${product.pno}"></a></td>
	                                    <td scope="col" class="c_name"><a href="/shop/detail?pno=${product.pno}">${product.pname}</a></td>
	                                    <td scope="col" class="c_price">${product.pprice}</td>
	                                    <td scope="col" class="c_qty">1</td>
	                                    <td scope="col" class="c_delivery">기본배송</td>
	                                    <td scope="col" class="c_charge">3000원</td>
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
                                    <td scope="col" class="c_name"><a href="/shop/detail?pno=${product.pno}">${product.pname}</a></td>
                                    <td scope="col" class="c_price">${product.pprice}</td>
                                    <td scope="col" class="c_qty">1</td>
                                    <td scope="col" class="c_delivery">기본배송</td>
                                    <td scope="col" class="c_charge">3000원</td>
                                    <td scope="col" class="c_choice">
                                    	<a href="#">BUY NOW</a>
                                    	<a href="#">WISHLIST</a>
                                    	<a href="#">DELETE</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <table border="1" summary="" class="cart_total">
                        	<tr>
                        		<th>총 상품금액</th>
                        		<th>총 배송비</th>
                        		<th>결제예정금액</th>
                        	</tr>
                        	<tr>
                        		<td>30000원</td>
                        		<td>3000원</td>
                        		<td>33000원</td>
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