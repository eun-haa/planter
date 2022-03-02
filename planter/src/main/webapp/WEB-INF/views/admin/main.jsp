<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
		<div id="contents">
                <div class="titleArea">
                    <h2>ADMIN</h2>
                </div><!--.titleArea-->
                
                <div class="admin_in">
                    <ul>
                        <li>
                            <a href="/admin/productReg"><strong>REGISTER</strong>상품 등록</a>
                        </li>

                        <li>
                            <a href="#"><strong>PRODUCT LIST</strong>상품 관리</a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a href="#"><strong>REVIEW</strong>리뷰 관리</a>
                        </li>

                        <li>
                            <a href="#"><strong>MEMBER</strong>회원 관리</a>
                        </li>
                    </ul>
                </div><!--.admin_in-->

		</div><!--#contents-->
		
<%@ include file="../includes/footer.jsp" %>