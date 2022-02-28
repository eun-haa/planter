<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>planter</title>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAIN</title>
    
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500&family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
    
    <!-- css -->
	<link rel="stylesheet" href="../resources/css/style.css">
	
	<!-- js -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jquery -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- join/다음 주소 api -->
</head>
<body>
	<div id="wrap">
	   <div id="LeftMenu">
	       <div class="LeftMenuIn">
	           <h1 class="logo">
	               <a href="/main"><img src="../resources/img/header/logo.png" alt=""></a>
	           </h1><!--.logo-->
	
	           <div class="LeftFooter">
	               <div class="menu_list">
	                   <ul class="shop_list">
	                       <li class="list_title">
	                           <a href="#">SHOP</a>
	                       </li><!--.list_title-->
	                       <li class="shop_record">
	                           <a href="#">ALL</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="#">PLANT</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="#">FLOWER</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="#">GARDENING</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="#">PLANTERIOR</a>
	                       </li><!--.shop_record-->
	
	                   </ul><!--.shop_list-->
	
	                   <div class="list_title">
	                       <a href="/notice/list">NOTICE</a>
	                   </div><!--list_title-->
	
	                   <div class="list_title">
	                       <a href="#">Q&amp;A</a>
	                   </div><!--list_title-->
	
	                   <ul class="shop_list">
	                       <li class="list_title">
	                           <a href="#">ADMIN</a>
	                       </li><!--list_title-->
	                   </ul>
	               </div><!--.menu_list-->
	
	               <div class="membership_list">
	                   <ul>
	                   	   <!-- login 여부에 따른 분기(login/logout 버튼) -->
	                   	   <c:choose>
	                   	   		<c:when test="${login!=null}">
	                   	   			<li>
	                           			<a href="/member/logout">LOGOUT</a>
	                       			</li>
	                   	   		</c:when>
	                   	   		<c:otherwise>
	                   	   			<li>
	                            		<a href="/member/login">LOGIN</a>
	                       			</li>
	                   	   		</c:otherwise>
	                   	   </c:choose>

						   <!-- login 여부에 따른 분기(JOIN/MODIFY) -->
	                   	   <c:choose>
	                   	   		<c:when test="${login!=null}">
									<li>
										<a href="/member/myAccountModify">MODIFY</a>
									</li>
	                   	   		</c:when>
	                   	   		<c:otherwise>
			                        <li>
			                            <a href="/member/join">JOIN</a>
			                        </li>
	                   	   		</c:otherwise>
	                   	   </c:choose>

	
	                       <li>
	                           <a href="#">ORDER</a>
	                       </li>
	                       
	                       <!-- login 여부에 따른 분기(MY ACCOUNT를 눌렀을 때 이동하는 페이지) -->
	                   	   <c:choose>
	                   	   		<c:when test="${login!=null}">
	                   	   			<li>
	                           			<a href="/member/myAccount">MY ACCOUNT</a>
	                       			</li>
	                   	   		</c:when>
	                   	   		<c:otherwise>
	                   	   			<li>
	                            		<a href="/member/login">MY ACCOUNT</a>
	                       			</li>
	                   	   		</c:otherwise>
	                   	   </c:choose>
							
	                   </ul>
	               </div><!--.membership_list-->
	           </div><!--.LeftFooter-->
	       </div><!--.LeftMenuIn-->
	   </div><!--#LeftMenu-->
	
	   <div id="container">
	       <div id="header">
	           <ul>
	               <li class="top_search">
	                   <a href="#"><img src="../resources/img/header/top_search.png" alt=""></a>
	               </li><!--.top_search-->
	
	               <li class="top_bag">
	                   <a href="#">
	                       <img src="../resources/img/header/top_bag.png" alt="">
	                       <span class="bag_count_display">
	                           <span class="bag_count">0</span><!--.bag_count-->
	                       </span><!--.bag_count_display-->
	                   </a>
	               </li><!--.top_bag-->
	           </ul>
	       </div><!--#header-->
