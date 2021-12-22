<%@page import="sun.security.util.Length"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DTO.ask"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/ask.css">

<!-- js 연결 -->
<script defer src="../js/jquery-1.8.1.min.js"></script>
<script defer src="../js/ask.js"></script>

</head>
<body>
<jsp:useBean id="datas" class="DAO.ask_DAO" scope="page"/>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String id = (String) session.getAttribute("id");
	
	//문의 내역 가져오기
	ArrayList<ask> dao = (ArrayList<ask>)datas.getAskList(id);
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/M/dd");

%>
<%@ include file="./header.jsp" %>

<div class="list_page_back">
	<a href="./mypage.jsp">회원정보 확인</a> | <a href="">주문내역</a> | <a href="./mypage_ask_page.jsp">문의하기</a> | <a href="./mypage_ask_list.jsp" class="mypage_title">문의내역</a>
	<br>
	<table class="ask_list">
	<%
		int i = 0;
		String yn;
		String category;
		for(ask ab : (ArrayList<ask>) dao){

			
			
			if(ab.getAnsweryn().equals("y")){
				yn = "완료";
				
			}else{
				yn = "예정";
				
			}
			if(ab.getQcate_num() == 1){
				category = "상품";
			}else if(ab.getQcate_num() == 2){
				category = "배송";
			}else{
				category = "기타";
			}
			
			i ++;
		
	%>

			<tr><th class="no">No.</th><th class="date">날짜</th><th class="title">제목</th><th>답변</th></tr>
			<tr class="title_click" style="cursor: pointer;"><td><%=i %><input type="hidden" value="<%=ab.getQnum() %>"></td><td><%=dateFormat.format(ab.getQregdate()) %></td><td><%=ab.getQtitle() %></td><td class="yn"><%=yn %></td></tr>
			<tr class="a"><td style="font-weight: bold;">분류</td><td><%=category %></td><td colspan="2"><%=ab.getQcontent() %></td></tr>
			<tr class="b"><td style="font-weight: bold;">답변</td><td colspan="3"><%if(ab.getAns_content() != null){
				%>
					<%=ab.getAns_content() %>
				<%
			}else{
				%>
					아직 답변이 없습니다. 빠른 시일내에 답변 드리겠습니다.
				<%		
				}
			%></tr>


	<%
		}
	%>
	</table>

	
	
</div>

<div style="margin-bottom: 300px;"></div>

<%@ include file="./footer.jsp" %>



</body>
</html>

