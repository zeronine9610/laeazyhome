
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
<title>LaeazyHome</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <!-- Noto Sans Kr font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="../css/Monthly.css">


</head>
<body>
<jsp:useBean id="searchResult" class="DAO.Item_DAO" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	
	String search = request.getParameter("search");
%>

<%@ include file="./header.jsp" %>
 <%
 	ArrayList<item> dao = (ArrayList<item>)searchResult.getSearchResult(search);
%>
<div class="page_back">
<div class="search_back">
<p class="search_Title">' <span><%=search %></span> ' 에 대한 검색 결과</p>
<p class="search_subTitle">검색어를 올바르게 입력하였는지 확인해주세요.</p>
<form action="./search.jsp">
	<input type="text" class="search_input" placeholder=" 찾으시는 제품을 입력해주세요." name="search">
	<input type="image" src="../image/1x/outline_search_black_36dp.png" class="searchImg">
</form>
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
        </div>ㄴ
    </div>
    


<div style="margin-bottom: 400px;"></div>
<%@ include file="./footer.jsp" %>

  






</body>
</html>

