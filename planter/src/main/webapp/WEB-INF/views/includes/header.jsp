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
	<link rel="stylesheet" href="/resources/css/style.css">
	
	<!-- js -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jquery -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- join/다음 주소 api -->
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
	    url: "/cart/cartCount",
	    type: "POST",
	    data: {
	    	"mid":$("#mid").val(),
	    },
	    dataType: "json",
	    success:function(count){
	    	console.log(count)
	    	if(count == 0){
	    		$(".bag_count").text(count);
	    		$(".bag_count").css("left","30%");
	    		$(".bag_count").css("top","0");
	        }
	    	else{
	        	$(".bag_count").text(count);
	    		$(".bag_count").css("left","36%");
	    		$(".bag_count").css("top","0");
	    	}
	    	
	        console.log("count : " + count);
	    },
	    error:function(){
	    	console.log("error")
	        alert("error");
	    }
	})// ajax 끝
})
</script>
	<div id="wrap">
	   <div id="LeftMenu">
	       <div class="LeftMenuIn">
	       	   <input type="hidden" value="${login.mid}" id="mid">
	           <h1 class="logo">
	               <a href="/main"><img src="/resources/img/header/logo.png" alt=""></a>
	           </h1><!--.logo-->
	
	           <div class="LeftFooter">
	               <div class="menu_list">
	               		
	                   <ul class="shop_list">
	                       <li class="list_title">
	                           <a href="#" id="shop_btn" class="shop_btn">SHOP</a>
	                       </li><!--.list_title-->
	                       <li class="shop_record">
	                           <a href="/shop/list">ALL</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="/shop/list1">PLANT</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="/shop/list2">FLOWER</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="/shop/list3">GARDENING</a>
	                       </li><!--.shop_record-->
	
	                       <li class="shop_record">
	                           <a href="/shop/list4">PLANTERIOR</a>
	                       </li><!--.shop_record-->
	
	                   </ul><!--.shop_list-->
	
	                   <div class="list_title">
	                       <a href="/notice/list">NOTICE</a>
	                   </div><!--list_title-->
	
	                   <div class="list_title">
	                       <a href="#">Q&amp;A</a>
	                   </div><!--list_title-->
	                   
	                   <!-- 관리자(login.role==true)인 경우만 ADMIN 메뉴 볼 수 있게 c:if문 작성 -->
						<c:if test="${login.role==true}">
							<ul class="shop_list"><li class="list_title"><a href="/admin/main">ADMIN</a></li></ul>
						</c:if>	                   

	                   
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
	                            		<a href="/member/login">LOG-IN</a>
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
	                   	   			<li><a href="/member/myAccount">MY ACCOUNT</a></li>
	                   	   		</c:when>
	                   	   		<c:otherwise>
	                   	   			<li><a href="/member/login">MY ACCOUNT</a></li>
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
	                   <form action="/shop/search" method="get" id="headerSearchForm">
	                   		<input type="text" class="header_sc" name="keyword" value="${pager.ssc.keyword}">
	                    	<button type="submit" value="search" id="search_btn"><img src="/resources/img/header/top_search.png" alt=""></button>
	                   </form>
	               	   
	               </li><!--.top_search-->
					
				   <!-- 로그인 여부에 따른 카트 분기 -->
                   <c:choose>
               	   		<c:when test="${login!=null}"><!-- 로그인이 되어있는 경우 해당 카트로 이동 -->
		               	   <li class="top_bag">
			                   <a href="/cart/list/${login.mid}">
			                       <img src="/resources/img/header/top_bag.png" alt="">
			                       <span class="bag_count_display">
			                           <span class="bag_count"></span><!--.bag_count-->
			                       </span><!--.bag_count_display-->
			                   </a>
			               </li><!--.top_bag-->
               	   		</c:when>
               	   		<c:otherwise><!-- 로그인이 안되어있는 경우 로그인 화면으로 이동 -->
               	   			<li class="top_bag">
			                   <a href="/member/login">
			                       <img src="/resources/img/header/top_bag.png" alt="">
			                       <span class="bag_count_display">
			                       	   
			                           		<span class="bag_count"></span><!--.bag_count-->
			                           
			                       </span><!--.bag_count_display-->
			                   </a>
			                </li><!--.top_bag-->
               	   		</c:otherwise>
               	   </c:choose>
               	   

	           </ul>
	       </div><!--#header-->
    <script src="/resources/js/header.js"></script>