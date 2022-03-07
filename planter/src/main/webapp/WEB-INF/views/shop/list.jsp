<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>ALL</h2>
                </div><!--.titleArea-->

                <ul class="prd_list">
                	<c:forEach items="${list}" var="product">
	                	<li class="prd_item">
	                		<input type="hidden" value="${product.pno}" id="pno" class="pno" name="pno">
	                        <div class="thumbnail">
	                            <a href="/shop/detail?pno=${product.pno}">
									<div class="prodUploadList"></div>
	                            </a>
	                        </div>
	                        
	                        <div class="description">
	                        	<div><input type="text" value="${product.cid}" name="cid"></div>
	                            <ul class="prod_list_name">
	                                <li class="item_name"><a href="/shop/detail?pno=${product.pno}"><span>${product.pname}</span></a></li>
	                            </ul>
	                            <ul class="prod_list_price">
	                            	<li class=" xans-record-"><span>${product.pprice}원</span></li>      
	                            </ul>
	                        </div>
	                    </li>
                	</c:forEach>
                    
                </ul><!--.prd_list-->
                <div class="notice_list_pager">
                	<input type="hidden" name="pageNum" value="${pager.ssc.pageNum}">
                	<input type="hidden" name="amount" value="${pager.ssc.amount}">
                    <ul>
                     	<c:if test="${pager.prev}">
                      	<li class="pager_button">
                              <a href="${pager.startPage-1}">PREV</a>
                          </li>
                     	</c:if>

                         
                     	<c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
                      	<li class="pager_button ${pager.ssc.pageNum == num ? 'active':''}">
                              <a href="${num}">${num}</a>
                          </li>
                     	</c:forEach>
                     	
						<c:if test="${pager.next}">
							<li class="pager_button">
                            	<a href="${pager.endPage+1}">NEXT</a>
                          	</li>
						</c:if>

                     </ul>
                 </div><!--.notice_list_pager-->

            </div><!--#contents-->
<script src="../resources/js/shop/list.js"></script>	
<%@ include file="../includes/footer.jsp" %>