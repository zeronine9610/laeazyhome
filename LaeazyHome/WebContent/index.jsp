<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%DecimalFormat formatter = new DecimalFormat("###,###"); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--http://ogp.me/-->
  <meta property="og:type" content="website" />
  <meta property="og:site_name" content="LaeazyHome" />
  <meta property="og:title" content="LaeazyHome" />
  <meta property="og:description" content="LaeazyHome만의 감성 인테리어 소품샵" />
  <meta property="og:image" content="./image/" />
  <meta property="og:url" content="https://LaeazyHome.com" />
  
     <!--파비콘-->
  <!--<link rel="shortcut icon" href="favicon.ico" />-->
  <link rel="icon" href="./favicon.png" />
  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <!-- Noto Sans Kr font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" href="./res/css/main.css">
<link rel="stylesheet" href="./res/css/Monthly.css">

<!--  js 연결 -->
<script defer src="./res/js/jquery-1.8.1.min.js"></script>
<script defer src="./res/js/main.js"></script>

<title>LaeazyHome</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");

String id = (String) session.getAttribute("id");
session.setAttribute("id", id);
%>

<!-- header -->

<div class="header-back">
	<div class="header">
	<div class="header_menu">
		<img alt="menu_img" src="./res/image/1x/outline_menu_black_36dp.png" class="side_menu_img">
	</div>
	<div class="header_title">
		<p><a href="./index.jsp" >LaeazyHome</a></p>
	</div>
	<div class="header_nav">
	<form action="./res/jsp/search.jsp" class="header_form">
		<input type="text" placeholder=" 브랜드명 혹은 제품명"  name="search" ><input type="image" src="./res/image/1x/outline_search_black_36dp.png" >
	</form>	
		<div class="header_nav_search_cancle">취소</div>
		<img alt="" src="./res/image/1x/outline_search_black_36dp.png" class="header_nav_search" >
		<img alt="" src="./res/image/1x/outline_person_black_36dp.png"  class="header_nav_mypage" onclick="location.href='./res/jsp/form/login_check.jsp'">
		<img alt="" src="./res/image/1x/outline_local_grocery_store_black_36dp.png"  class="header_nav_cartPage" onclick="location.href='./res/jsp/form/cart_login_check.jsp'">
	</div>
	</div>
</div>

<!-- Side Nav -->
<div class="sideNav_back" id="sideNav_back">
	<div class="sideNav_left">
			<img src="./res/image/1x/outline_menu_black_36dp.png" class="sideNav_menu_img">
		<div class="sideNav_title"">
			<p><a href="./index.jsp">LaeazyHome</a></p>
		</div>
		<div class="sideNav_contents">
			<ul>
				<li style="margin-bottom: 28px;"><a href="">Curation</a></li>
				<li class="monthly">
					Monthly<img alt="" src="./res/image/1x/outline_expand_more_black_24dp.png">
				</li>
				<ul class="monthly_item">
						<li style="font-weight: 600; margin-top: 10px; cursor: default;">2021</li>
						<li><a href="./res/jsp/product_list.jsp?category_code=1">October</a></li>
						<li><a href="./res/jsp/product_list.jsp?category_code=2">November</a></li>
						<li><a href="./res/jsp/product_list.jsp?category_code=3">December</a></li>
				</ul>
				<li style="margin-top: 28px;"><a href="./res/jsp/aboutus.jsp">About Us</a></li>
				
			</ul>
		</div>
	</div>
	<div class="sideNav_right">
	</div>
</div>

<div class="container">
</div>
<div class="mainPage_back">
	<div class="mainPage_contents">
		<p class="mainPage_contents_title">Curation home styling service</p>
		<p class="mainPage_contents_subtitle">"Laeazy home will be your friends to perfect home for you"</p>
		<p class="mainPage_contents_write">Laeazy home is simply dummy text of the printing and typesetting industry.<br> 
		Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
		 when an unknown<br> printer took a galley of type and scrambled it to make a type
		  specimen book.</p>
	</div>
	<div class="mainPage_contents_img_1">
		<img alt="" src="./res/image/main-2.jpg" width="1500px;">
	</div>
	<div class="mainPage_contents">
		<p class="mainPage_contents_title">Choose various concept interior items every month</p>
		<p class="mainPage_contents_subtitle">Laeazy home will be your friends to perfect home for you"</p>
		<p class="mainPage_contents_write">Laeazy home is simply dummy text of the printing and typesetting industry.
		 Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
		 , when an unknown printer took a galley of type and scrambled it to make a type
		  specimen book.</p>
	</div>
	<jsp:useBean id="datas" class="DAO.Item_DAO" scope="page"></jsp:useBean>
	
	<%
		ArrayList<item> dao = (ArrayList<item>)datas.getRandIMG();
	%>
	
	<div class="product-list-back_index">
        <%
        	for(item ab: (ArrayList<item>) dao){
        %>    
          <div class="product-list" onclick="location.href='./res/jsp/product_page.jsp?prcode=<%=ab.getPrcode()%>'">
            <div class="product-title">
            <p style="font-size: 18px; font-family: Noto Sans; font-weight: normal;"><%=ab.getPrbrand() %></p>
            <p style="font-size: 18px; font-family: Noto Sans; font-weight:bold; font-style: italic; line-height: 	px;"><%=ab.getPrname() %></p>
            <p style="font-size: 18px; font-family: Noto Sans; font-weight: normal;"><%=formatter.format(ab.getPrprice()) %></p>
            </div>
            <div class="product-img"><img src="./res<%=ab.getPrimg() %>" alt=""></div>
          </div>
          <%
        	}
          %>
        </div>
        
        
    </div>
	
</div>
<div style="margin-bottom: 400px;"></div>
<%@ include file="./res/jsp/footer.jsp" %>
</body>
</html>