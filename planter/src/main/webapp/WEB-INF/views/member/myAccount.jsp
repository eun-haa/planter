<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
 
            <div id="contents">               
                <div id="myAccount_wrap">
    
                    <div class="titleArea">
                        <h2>MY ACCOUNT</h2>
                    </div><!--.titleArea-->
                    
                    <div class="myshop_orderstate">
                        <ul class="order">
                            <li>
                                <a href="#" class="count">
                                    <strong>입금전</strong>
                                        <span id="xans_myshop_orderstate_shppied_before_count">0</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" class="count">
                                    <strong>배송준비중</strong>
                                    <span id="xans_myshop_orderstate_shppied_standby_count">0</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" class="count">
                                    <strong>배송중</strong>
                                    <span id="xans_myshop_orderstate_shppied_begin_count">0</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" class="count">
                                    <strong>배송완료</strong>
                                    <span id="xans_myshop_orderstate_shppied_complate_count">0</span>
                                </a>
                            </li>
                            <li class="cs">
                                <p>
                                    <a href="#">
                                        <strong>취소</strong>
                                        <span id="xans_myshop_orderstate_order_cancel_count">0</span>
                                    </a>
                                    <a href="#">
                                        <strong>교환</strong>
                                        <span id="xans_myshop_orderstate_order_exchange_count">0</span>
                                    </a>
                                    <a href="#">
                                        <strong>반품</strong>
                                        <span id="xans_myshop_orderstate_order_return_count">0</span>
                                    </a>
                                </p>
                                
                            </li>
                        </ul>
                    </div><!--.myshop_orderstate-->
                    
                    
                    
                    <div class="myshop_bankbook">
                        <ul>
                            <li class="myAccount_ico"><a href="#"><img src="../resources/img/member/myAccount_ico_order.png"></a></li>
                            
                            <li>
                                <p class="mb_title">ORDER</p>
                                <p class="mb_data"><a href="#">0/0회</a></p>
                            </li>
                        </ul>
                        
                        <ul class="xans-element- xans-layout xans-layout-orderbasketcount ">
                            <li class="myAccount_ico"><a href="#"><img src="../resources/img/member/myAccount_ico_cart.png"></a></li>

                            <li>
                                <p class="mb_title">CART</p>
                                <p class="mb_data"><a href="#">0</a></p>
                            </li>
                        </ul>

                        <ul class="">
                            <li class="myAccount_ico"><a href="#"><img src="../resources/img/member/myAccount_ico_point.png"></a></li>
                            <li>
                                <p class="mb_title">MILEAGE</p>
                                <p class="mb_data"><a href="/myshop/mileage/historyList.html">0원</a></p>
                            </li>
                        </ul>
                    </div><!--.myshop_bankbook-->

                    <div class="myAccount_wrap">
                        <ul>
                            <li><a href="#"><strong>ORDER TRACKING</strong> 주문내역조회</a></li>
                            <li><a href="/member/myAccountModify?mid=${login.mid}"><strong>PROFILE</strong> 내 정보수정</a></li>
                            <li class="myAccount_last"><a href="#"><strong>WISHLIST</strong>관심상품</a></li>
                            <li><a href="#"><strong>MY WRITING</strong>내가쓴글</a></li>
                            <li><a href="#"><strong>MILEAGE</strong> 적립금</a></li>
                            <li class="myAccount_last"><a href="#"><strong>COUPON</strong> 쿠폰</a></li>
                        </ul>
                    </div><!--.mypage_wrap-->
                </div><!--.myAccount_wrap-->

            </div><!--#contents-->

<%@ include file="../includes/footer.jsp" %>