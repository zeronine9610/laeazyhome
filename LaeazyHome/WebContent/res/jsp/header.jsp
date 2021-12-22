<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="../css/header_footer.css">

<!--  js 연결 -->
<script defer src="../js/jquery-1.8.1.min.js"></script>
<script defer src="../js/header.js"></script>

</head>

<body>
<%
%>


<!-- header -->

<div class="header-back">
	<div class="header">
	<div class="header_menu">
		<img alt="menu_img" src="../image/1x/outline_menu_black_36dp.png" class="side_menu_img">
	</div>
	<div class="header_title">
		<a href="../../index.jsp" >LaeazyHome</a>
	</div>
	<div class="header_nav">
	<form action="./search.jsp" class="header_form">
		<input type="text" placeholder=" 브랜드명 혹은 제품명" id="header_search_text"  name="search" ><input type="image" src="../image/1x/outline_search_black_36dp.png" id="header_search_image">
	</form>	
		<div class="header_nav_search_cancle">취소</div>
		<img alt="" src="../image/1x/outline_search_black_36dp.png" class="header_nav_search" >
		<img alt="" src="../image/1x/outline_person_black_36dp.png"  class="header_nav_mypage" onclick="location.href='./form/login_check.jsp'">
		<img alt="" src="../image/1x/outline_local_grocery_store_black_36dp.png"  class="header_nav_cartPage" onclick="location.href='./form/cart_login_check.jsp'">
	</div>
	</div>
</div>

<!-- Side Nav -->
<div class="sideNav_back" id="sideNav_back">
	<div class="sideNav_left">
			<img src="../image/1x/outline_menu_black_36dp.png" class="sideNav_menu_img">
		<div class="sideNav_title">
			<a href="../../index.jsp">LaeazyHome</a>
		</div>
		<div class="sideNav_contents">
			<ul>
				<li style="margin-bottom: 28px;"><a href="">Curation</a></li>
				<li class="monthly" id="monthly_item_2">
					Monthly<img alt="" src="../image/1x/outline_expand_more_black_24dp.png">
				</li>
				<ul class="monthly_item">
						<li style="font-weight: 600; margin-top: 10px; cursor: default;">2021</li>
						<li><a href="./product_list.jsp?category_code=1">October</a></li>
						<li><a href="./product_list.jsp?category_code=2">November</a></li>
						<li><a href="./product_list.jsp?category_code=3">December</a></li>
				</ul>
				<li style="margin-top: 28px;"><a href="./aboutus.jsp">About Us</a></li>
				
			</ul>
		</div>
	</div>
	<div class="sideNav_right">
	</div>
</div>

</body>
</html>