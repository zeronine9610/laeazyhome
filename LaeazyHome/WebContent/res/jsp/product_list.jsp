<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.category"%>
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
<link rel="stylesheet" href="../css/Monthly.css">


</head>
<body>

<%@ include file="./header.jsp" %>
<jsp:useBean id="datas" class="DAO.Item_DAO" scope="request"></jsp:useBean>
<%
	String category_code = request.getParameter("category_code");

	category category = datas.getCategory(category_code);
	
	//카테고리코드 -> 상품정보가져오
	ArrayList<item> dao = (ArrayList<item>)datas.getItemList(category_code);  
%>

<div class="product_page_back">
        <div class="product-list-title">
          Monthly item<br>
          2021<br>
          <div style="font-style: italic; font-weight: bold;"><%= category.getMonth() %></div>
        </div>
        <div class="product-list-title-2">
         <div><%=category.getName() %><br></div>
         <div style="font-weight: lighter;"><%=category.getTag() %></div>
        </div>
        <div class="product-list-title-3">
         <div><%=category.getContent() %><br></div>
        </div>
        <div class="product-list-back">
        <%
        	for(item ab: (ArrayList<item>) dao){
        %>    
          <div class="product-list" onclick="location.href='./product_page.jsp?prcode=<%=ab.getPrcode()%>'">
            <div class="product-title">
            <p style="font-size: 18px; font-family: Noto Sans; font-weight: normal;"><%=ab.getPrbrand() %></p>
            <p style="font-size: 18px; font-family: Noto Sans; font-weight:bold; font-style: italic; line-height: 	px;"><%=ab.getPrname() %></p>
            <p style="font-size: 18px; font-family: Noto Sans; font-weight: normal;"><%=formatter.format(ab.getPrprice()) %></p>
            </div>
            <div class="product-img"><img src="<%=ab.getPrimg() %>" alt=""></div>
          </div>
          <%
        	}
          %>
        </div>
    </div>

<div style="margin-bottom: 400px;"></div>
<%@ include file="./footer.jsp" %>


</body>
</html>


