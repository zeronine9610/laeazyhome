<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%DecimalFormat formatter = new DecimalFormat("###,###"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LaeazyHome</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <!-- Noto Sans Kr font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" href="../css/productpage.css">
<!--  js 연결 -->
<script defer src="../js/jquery-1.8.1.min.js"></script>
<script defer src="../js/product.js"></script>

</head>
<body onload="init();">
<%
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("id");
	response.setContentType("text/html; charset=utf-8");
	session.setAttribute("id", id);
	int prcode = Integer.parseInt(request.getParameter("prcode"));
%>
<jsp:useBean id="data" class="DAO.Item_DAO" scope="request"></jsp:useBean>
<%
	item item = data.getItem(prcode);
%>
<%@ include file="./header.jsp" %>

<div class="pr_back">
	<div class="pr_img"><img alt="" src="<%=item.getPrimg()%>"> </div>
	<p class="prbrand"><%=item.getPrbrand() %></p>
	<p class="prname"><%=item.getPrname() %></p>
	<p class="prcontent"><%=item.getPrcontent() %></p>
	<p class="prprice"><%=formatter.format(item.getPrprice()) %> 원
	<table class="table_1">
		<form name="form" method="get">
			<tr><th>적립금</th><td>2%</td></tr>
			<tr><th>배송비</th><td>3,000원 (100,000원 이상 구매 시 무료)<br>제주 3,000원, 제주 외 도서 산간 5,000원 추가</td></tr>
			<tr><th>수량</th><td>
				<input type=hidden name="sell_price" value="<%=item.getPrprice()%>">
				<input type="button" value=" - " onclick="del();">
				<input type="text" name="amount" value="1" size="3" onchange="change();">
				<input type="button" value=" + " onclick="add();">
				<input type="hidden" value="<%=item.getPrcode() %>" name="prcode">
			</td></tr>
	</table>
	<hr>
	<table class="table_2">
	<tr><th>주문 수</th><td><input type="text" name="amount2" value="1" size="3" onchange="change();" class="text" readonly>개</td></tr>
	<tr><th>총 상품 금액</th><td><input type="text" name="sum" size="11" readonly onkeyup="inputNumberFormat(this);" class="text" readonly>원</td></tr>
	</table>
	<input type="submit" value="구매하기" class="btn1">
	<input type="submit" value="장바구니에 담기" class="btn2" onclick="javascript: form.action='./form/product_login_check.jsp'">
</div>
		</form>
		<div style="margin-bottom: 300px;"></div>
<%@ include file="./footer.jsp" %>



</body>
</html>