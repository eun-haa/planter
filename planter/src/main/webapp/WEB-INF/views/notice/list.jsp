<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>NOTICE</h2>
                </div><!--.titleArea-->

                <div class="notice_list_in">
                    <div class="notice_list_table">
                        <table border="1" summary="">
                            <!-- <caption>상품 게시판 목록</caption> -->

							
                            <thead class="">
                                <tr>
                                    <th scope="col" class="n_no">NO</th>
                                    <th scope="col" class="n_title">TITLE</th>
                                    <th scope="col" class="n_writer">POSTED BY</th>
                                    <th scope="col" class="n_date">DATE</th>
                                    <th scope="col" class="n_hits">HIT</th>
                                </tr>
                            </thead>

                            <tbody class="">

                            	<c:forEach items="${list}" var="notice">
	                            	<tr class="xans-record-">
	                                    <td class="n_no">${notice.nno}</td>
	                                    <td class="n_title"><a href="/notice/detail?nno=${notice.nno}">${notice.title}</a></td>
	                                    <td class="n_writer">${notice.writer}</td>
	                                    <td class="n_date">${notice.regdate}</td>
	                                    <td class="n_hits">${notice.hit}</td>
	                                </tr>
                            	</c:forEach>

                            </tbody>
                        </table>

                        <div class="sw">


                            <div class="board_footer">  
                                <form id="boardSearchForm" action="/notice/list" method="get">
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
                                                        <option value="T" <c:out value="${pager.sc.search == 'T' ? 'selected' :''}"/>>제목</option>
                                                        <option value="C" <c:out value="${pager.sc.search == 'C' ? 'selected' :''}"/>>내용</option>
                                                        <option value="W" <c:out value="${pager.sc.search == 'W' ? 'selected' :''}"/>>글쓴이</option>
                                                        <option value="TC" <c:out value="${pager.sc.search == 'TC' ? 'selected' :''}"/>>제목+내용</option>
                                                    </select> 
                                                    <input id="n_keyword" name="keyword" class="inputTypeText" placeholder="" value="${pager.sc.keyword}" type="text">
                                                    <input id="n_search" type="submit" value="SEARCH">
            
                                                </p>
            
                                                
            
                                            </fieldset>
            
                                        </div>
            
                                    </form>
            
                            </div><!--.board_footer-->
                            
		                    <!-- 관리자(login.role==true)인 경우만 WRITE 버튼을 통해 글을 작성할 수 있게 c:if문 작성 -->
							<c:if test="${login.role==true}">
								<div class="nl_write_btn">
                                	<a href="/notice/write">WRITE</a>
                            	</div>
							</c:if>


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
    <script src="../resources/js/notice/list.js"></script>
<%@ include file="../includes/footer.jsp" %>