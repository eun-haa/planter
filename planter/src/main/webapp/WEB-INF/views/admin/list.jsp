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
                    <div class="product_list_table">
                        <table border="1" summary="">
                            <!-- <caption>상품 게시판 목록</caption> -->
                            <thead class="">
                                <tr>
                                    <th scope="col" class="p_no">ID</th>
                                    <th scope="col" class="p_cate">CATEGORY</th>
                                    <th scope="col" class="p_image">IMAGE</th>
                                    <th scope="col" class="p_name">NAME</th>
                                    <th scope="col" class="p_stock">STOCK</th>
                                    <th scope="col" class="p_hit">HIT</th>
                                    <th scope="col" class="p_regdate">FIRST DATE</th>
                                    <th scope="col" class="p_update">RECENT DATE</th>
                                    <th scope="col" class="p_modify">MODIFY</th>
                                    <th scope="col" class="p_delete">DELETE</th>
                                </tr>
                            </thead>

                            <tbody class="">

                            	<c:forEach items="${list}" var="product">
	                            	<tr>	                                    
	                                    <td scope="col" class="p_no">${product.pno}</td>
	                                    <td scope="col" class="p_cate">${product.cid}</td>
	                                    <td scope="col" class="p_image prodUploadList"><a href="/shop/detail?pno=${product.pno}"></a></td>
	                                    <td scope="col" class="p_name"><a href="/shop/detail?pno=${product.pno}">${product.pname}</a></td>
	                                    <td scope="col" class="p_stock">${product.pstock}</td>
	                                    <td scope="col" class="p_hit">${product.phit}</td>
	                                    <td scope="col" class="p_regdate">${product.pregdate}</td>
	                                    <td scope="col" class="p_update">${product.pupdate}</td>
	                                    <td scope="col" class="p_modify"><a href="/admin/modify?pno=${product.pno}">MODIFY</a></td>
                                    	<td scope="col" class="p_delete"><a href="/admin/delete?pno=${product.pno}">DELETE</a></td>
	                                </tr>
                            	</c:forEach>

                            </tbody>
                        </table>

                        <div class="product_sw">


                            <div class="board_footer">  
                                <form id="adminSearchForm" action="/admin/list" method="get">
                                		<input type="hidden" name="pageNum" value="${pager.sc.pageNum}">
                                		<input type="hidden" name="amount" value="${pager.sc.amount}">
                                        <div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
                                            <fieldset class="boardSearch">
                                                <legend>게시물 검색</legend>
                                                <p class="category displaynone"></p>
                                                <p>
                                                    <!-- <select id="search_date" name="search_date" fw-filter="" fw-label="" fw-msg="">
                                                        <option value="week">일주일</option>
                                                        <option value="month">한달</option>
                                                        <option value="month3">세달</option>
                                                        <option value="all">전체</option>
                                                    </select>  -->
                                                    <select id="search_key" name="search">
                                                    	<option value="C" <c:out value="${pager.sc.search == 'C' ? 'selected' :''}"/>>카테고리</option>
                                                        <option value="I" <c:out value="${pager.sc.search == 'I' ? 'selected' :''}"/>>상품 아이디</option>
                                                        <option value="N" <c:out value="${pager.sc.search == 'N' ? 'selected' :''}"/>>상품 이름</option>
                                                    </select> 
                                                    <input id="n_keyword" name="keyword" class="inputTypeText" placeholder="" value="${pager.sc.keyword}" type="text">
                                                    <input id="n_search" type="submit" value="SEARCH">
            
                                                </p>
            
                                                
            
                                            </fieldset>
            
                                        </div>
            
                                    </form>
            
                            </div><!--.board_footer-->
                           
                        </div><!--sw-->
                    </div>




                    <div class="notice_list_pager">
                        <ul>
                        	<c:if test="${pager.prev}">
	                        	<li class="pager_button">
	                                <a href="${pager.startPage-1}">PREV</a>
	                            </li>
                        	</c:if>

                            
                        	<c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
	                        	<li class="pager_button ${pager.sc.pageNum == num ? 'active':''}">
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
                </div><!--.notice_list_in-->
            </div><!--#contents-->
    <script src="../resources/js/admin/list.js"></script>
<%@ include file="../includes/footer.jsp" %>