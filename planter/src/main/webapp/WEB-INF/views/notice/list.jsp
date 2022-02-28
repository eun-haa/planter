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
                                <form id="boardSearchForm" name="" action="" method="get" target="_top" enctype="multipart/form-data">
                                    <input id="board_no" name="board_no" value="1" type="hidden">
                                    <input id="page" name="page" value="1" type="hidden">
                                    <input id="board_sort" name="board_sort" value="" type="hidden">
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
                                                    <select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
                                                        <option value="T">제목</option>
                                                        <option value="C">내용</option>
                                                        <option value="W">글쓴이</option>
                                                    </select> 
                                                    <input id="n_keyword" name="keyword" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
                                                    <input id="n_search" name="keyword" type="submit" value="SEARCH">
            
                                                </p>
            
                                                
            
                                            </fieldset>
            
                                        </div>
            
                                    </form>
            
                            </div><!--.board_footer-->

                            <div class="nl_write_btn">
                                <a href="/notice/write">WRITE</a>
                            </div>

                        </div><!--sw-->



                    </div>




                    <div class="notice_list_pager">
                        <ul>
                            <li>
                                <a href="#">PREV</a>
                            </li>
                            

                            <li>
                                <a href="#">1</a>
                            </li>

                            <li>
                                <a href="#">NEXT</a>
                            </li>
                        </ul>
                    </div><!--.notice_list_pager-->
                </div><!--.notice_list_in-->
            </div><!--#contents-->
		
<%@ include file="../includes/footer.jsp" %>