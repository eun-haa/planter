<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="titleArea">
                    <h2>PRODUCT</h2>
                </div><!--.titleArea-->


                <div class="product_reg_table">
                	<form role="form" action="/admin/productReg" method="post" enctype="multipart/form-data" >
	                    <table border="1" summary="">
	                        <tbody>
	                            <tr>
	                                <th scope="row">CATEGORY</th>
	                                <td>
	                                    <select class="cid_selected">
	                                        <option value="1">PLANT</option>
	                                        <option value="2">FLOWER</option>
	                                        <option value="3">GARDENING</option>
	                                        <option value="4">PLANTERIOR</option>
	                                    </select>
	                                    
	                                </td>
	      
	                            </tr>
	
	                            <tr>
	                                <th scope="row">NAME</th>
	                                <td>
	                                    <input type="text" id="pname" name="pname" value="" class="prod_reg_input">
	                                    <div id="nameMsg"></div>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">PRICE</th>
	                                <td>
	                                    <input type="text" name="pprice" value="" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">DISCOUNT</th>
	                                <td>
	                                    <input type="text" name="pdiscount" value="" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">STOCK</th>
	                                <td>
	                                    <input type="text" name="pstock" value="" class="prod_reg_input">
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th scope="row">MEMO</th>
	                                <td>
	                                    <textarea name="pmemo" id="" cols="30" rows="10"></textarea>
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                                <th scope="row">IMAGE</th>
	                                <td>
	                                    <div class="w_content_file">
	                                    	<label for="file">파일 선택</label>
                                    		<input type="file" id="file" name="uploadFile">
                                    		<input class="upload-name" value="선택된 파일없음" placeholder="" readonly>
                                            <div id="uploadResult">
                                                <!-- 업로드한 파일의 썸네일이 들어갈 공간 -->
                                                <ul></ul>
                                            </div>
	                                    </div><!--.w_content_file-->
	                                </td>
	                            </tr>
	                        </tbody>
	                        
	                    </table>
	                    <input id="prod_reg_submit" type="submit" value="SUBMIT">
    				</form>
                    
                </div><!--.product_reg_table-->
            </div><!--#contents-->
	<script type="text/javascript" src="../resources/js/uploadAjax.js"></script>
	
<%@ include file="../includes/footer.jsp" %>