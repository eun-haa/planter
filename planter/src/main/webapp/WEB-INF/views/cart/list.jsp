<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

	/* 상품 가격 세자리마다 콤마(,) 찍히게 표시 */
	let productPrice = parseInt($(".c_priceInput").val()); // input 태그 value는 String이라 parseInt 사용해서 숫자로 바꾸기
	$(".c_priceSpan").text(productPrice.toLocaleString()); // toLocaleString() 사용하여 콤마 찍기
	
	

	/* 종합 정보 호출 */ 	
	setTotalInfo();
	
	/* 체크여부에따른 종합 정보 변화 */
	$(".individual_checkbox").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));
	});
	/* 체크박스 전체 선택 */
	$(".individual_checkbox_total").on("click", function(){
		/* 체크박스 체크/해제 */
		if($(".individual_checkbox_total").prop("checked")){
			$(".individual_checkbox").prop("checked", true);
		} else{
			$(".individual_checkbox").prop("checked", false);
		}
		
		/* 총 주문 정보 세팅 */
		setTotalInfo($(".cart_info_td"));	
	
	});
	//-----------------------------------------//
	/* 수량 버튼 조작 */
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
	/* 수량 수정 버튼 */
	
	$(".q_modify").on("click", function(){
		alert("수정되었습니다.")
		$(".quantity_update_form").submit();
	});
	//-----------------------------------------//
	/* 장바구니 삭제 버튼 */
	$(".cart_delete_btn").on("click", function(){
		
		$(".quantity_delete_form").submit();
	});
	

	

	
})// document. 끝

function setTotalInfo() {
	/* 종합 정보 섹션 정보 삽입 */
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".cart_info_td").each(function(index, element){
		if($(element).find(".individual_checkbox").is(":checked") == true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_count_input").val());
		}
		

		
	});	
	
	/* 배송비 결정 */
	if(totalPrice >= 50000){
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
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".totalDelivery_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".totalFinalPrice_span").text(finalTotalPrice.toLocaleString());
	

}
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
                                    <th scope="col" class="c_no displaynone">PNO</th>
                                    
                                    <th scope="col" class="c_no"><input class="individual_checkbox_total" type="checkbox"></th>
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

                            		</tr>

	                            	<tr class="">	                                    
	                                    <td scope="col" class="c_no displaynone">${cart.pno}</td>
	                                    
	                                    <td class="cart_info_td"><!-- 카트 정보를 담을 input -->
	                           				<input type="hidden" class="individual_price_input" value="${cart.pprice}"><!-- 가격 -->
											<input type="hidden" class="individual_count_input" value="${cart.pcount}"><!-- 총 갯수 -->
											<input type="hidden" class="individual_totalPrice_input" value="${cart.pprice * cart.pcount}"><!-- 총 가격 -->
											<input class="individual_checkbox" type="checkbox">
	                           			</td>
	                                    <td scope="col" class="c_image prodUploadList"><a href="/shop/detail?pno=${cart.pno}"></a></td>
	                                    <td scope="col" class="c_name"><a href="/shop/detail?pno=${cart.pno}">${cart.pname}</a></td>
	                                    <td scope="col" class="c_price">
	                                    	<input type="hidden" class="c_priceInput" value="${cart.pprice}">
	                                    	<span class="c_priceSpan"></span>원
	                                    </td>
	                                    <td scope="col" class="c_qty">
	                                    	<div class="list_quantity">
	                                    		
	                                    		
	                                    		<button class="q_minus">-</button>
	                                    		<input type="text" class="quantity" value="${cart.pcount}">
	                                    		<button class="q_plus">+</button>
				                                	

				                                
				                            </div><!-- .list_quantity -->
				                            <div class="q_modify_div"><!-- 데이터 속성을 사용하여 cartId의 데이터를 심어놓기 -->
				                            	<a class="q_modify">수정</a>
				                            	<!-- <button class="q_modify" data-cartId="${cart.cartId}">
				                            		수정
				                            	</button> -->
				                            </div>
				                            
	                                    </td>
	                                    <td scope="col" class="c_delivery">기본배송</td>
	                                    <td scope="col" class="c_charge">3,000원</td>
	                                    <td scope="col" class="c_choice">
	                                    	<a href="#">BUY NOW</a>
	                                    	<a href="#">WISHLIST</a>
	                                    	<a href="#" class="cart_delete_btn">DELETE</a>
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
                        		<td class="displaynone"><span class="totalCount_span"></span>개</td><!-- 총 갯수 -->
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
					<input type="hidden" name="cartId" value="${cart.cartId}" class="update_cartId" placeholder="cartId">
					<input type="hidden" name="pcount" value="${cart.pcount}" class="update_count" placeholder="pcount">
				</c:forEach>
				<input type="hidden" name="mid" value="${login.mid}">
			</form>
			
			<!-- 상품 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<c:forEach items="${cart}" var="cart">
					<input type="hidden" name="cartId" value="${cart.cartId}" class="update_cartId" placeholder="cartId">
				</c:forEach>
				<input type="hidden" name="mid" value="${login.mid}">
			</form>
                </div><!--.notice_list_in-->
            </div><!--#contents-->
            
<script src="/resources/js/cart/list.js"></script>       
<%@ include file="../includes/footer.jsp" %>