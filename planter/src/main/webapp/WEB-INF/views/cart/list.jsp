<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	// 수량 버튼 조작
	let quantity = $(".quantity").val();
	$(".q_plus").on("click", function(){
		++quantity;
		$(".quantity").val(quantity);
		$(".update_count").val(quantity);
		
	});
	$(".q_minus").on("click", function(){
		if(quantity > 1){
			--quantity;
			$(".quantity").val(quantity);	
			$(".update_count").val(quantity);
		}
	});
	
	// 종합 상품 및 배송 정보
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	// 접근한 <td> 객체에 있는 'individual_totalPrice_input' <input> 태그에 값을 totalPrice 변수의 값에 더해줍니다.
	// 모든 상품 <td> 객체를 순회하게 되면 totalPrice는 모든 상품의 가격이 더해져서 '총 상품 가격'이 구해지게 됩니다.
	// ※parseInt() 메서드를 사용한 이유는 <input> 태그의 값을 얻어오면 그 값은 'string' 타입으로 인식이 되어서 이를 int 타입으로 변경해주기 위함입니다.
	$(".cart_info_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_count_input").val());
	});
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
	/* 최종 가격 */
	finalTotalPrice = totalPrice + deliveryPrice;
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice);
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".totalDelivery_span").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".totalFinalPrice_span").text(finalTotalPrice);
	
	
	/* 수량 수정 버튼 */
	
	$(".q_modify").on("click", function(){
		
		$(".quantity_update_form").submit();
	});
})
</script>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>CART LIST</h2>
                </div><!--.titleArea-->
                <div class="notice_list_in">
                	
                	

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
                            	<c:forEach items="${cart}" var="cart">

	                            	<tr>	                                    
	                                    <td scope="col" class="c_no">${cart.pno}</td>
	                                    <td scope="col" class="c_image prodUploadList"><a href="#"></a></td>
	                                    <td scope="col" class="c_name"><a href="#">${cart.pname}</a></td>
	                                    <td scope="col" class="c_price">${cart.pprice}</td>
	                                    <td>
	                                    	<input type="text" value="${cart.cartId}">
	                                    </td>
	                                    <td scope="col" class="c_qty">
	                                    	<div class="list_quantity">
				                            	<input type="text" class="quantity" value="${cart.pcount}">
				                                <button class="q_plus">+</button>
				                                <button class="q_minus">-</button>
				                                
				                            </div><!-- .list_quantity -->
				                            <div><!-- 데이터 속성을 사용하여 cartId의 데이터를 심어놓기 -->
				                            	<a class="q_modify">수정</a>
				                            	<!-- <button class="q_modify" data-cartId="${cart.cartId}">
				                            		수정
				                            	</button> -->
				                            </div>
				                            
	                                    </td>
	                                    <td scope="col" class="c_delivery">기본배송</td>
	                                    <td scope="col" class="c_charge">3000원</td>
	                                    <td scope="col" class="c_choice">
	                                    	<a href="#">BUY NOW</a>
	                                    	<a href="#">WISHLIST</a>
	                                    	<a href="#">DELETE</a>
	                                    </td>
	                                </tr>
	                                
	                                <tr class="displaynone"><!-- 카트 정보를 담을 input -->
                            			<td class="cart_info_td">
                            				<input type="hidden" class="individual_price_input" value="${cart.pprice}">
											<input type="hidden" class="individual_count_input" value="${cart.pcount}">
											<input type="hidden" class="individual_totalPrice_input" value="${cart.pprice * cart.pcount}">
											<input type="hidden" name="mid" value="${cart.mid}">
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
                        		<td><span class="totalPrice_span"></span>원</td><!-- 총 금액 -->
                        		<td><span class="totalDelivery_span"></span>원</td><!-- 배송비 -->
                        		<td><span class="totalFinalPrice_span"></span>원</td><!-- 배송비 + 총 금액 -->
                        	</tr>
                        </table>

                        <div class="product_sw">

						<div class="cart_btns">
							<button type="submit" class="cart_all_btn">전체상품주문</button>
							<button type="submit" class="cart_sel_btn">선택상품주문</button>
						</div>
                            
                           
                        </div><!--sw-->
                    </div>




            <!-- 수량 조정 form -->
			<form action="/cart/update" method="post" class="quantity_update_form">
				<c:forEach items="${cart}" var="cart">
					<input type="text" name="cartId" value="${cart.cartId}" class="update_cartId" placeholder="cartId">
					<input type="text" name="pcount" value="${cart.pcount}" class="update_count" placeholder="pcount">
				</c:forEach>
				<input type="text" name="mid" value="${login.mid}">
			</form>
                </div><!--.notice_list_in-->
            </div><!--#contents-->
<script src="/resources/js/cart/list.js"></script>       
<%@ include file="../includes/footer.jsp" %>