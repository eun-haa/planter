<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>PLANT</h2>
                </div><!--.titleArea-->
                
                <ul class="prd_list">
                	<c:forEach items="${list}" var="product">
	                	<li class="prd_item">
	                		<input type="text" value="${product.pno}" id="pno" class="pno" name="pno">
	                        <div class="thumbnail">
	                            <a href="/shop/detail?pno=${product.pno}">
									<div class="prodUploadList"></div>
	                            </a>
	                        </div>
	                        
	                        <div class="description">
	                            <ul class="prod_list_name">
	                                <li class="item_name"><a href="/shop/detail?pno=${product.pno}"><span>${product.pname}</span></a></li>
	                            </ul>
	                            <ul class="prod_list_price">
	                            	<li class=" xans-record-"><span>${product.pprice}</span></li>      
	                            </ul>
	                        </div>
	                    </li>
                	</c:forEach>
                    
                </ul><!--.prd_list-->


            </div><!--#contents-->
<script src="../resources/js/shop/list.js"></script>	
<%@ include file="../includes/footer.jsp" %>