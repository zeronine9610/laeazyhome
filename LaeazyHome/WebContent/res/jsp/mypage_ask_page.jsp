<%@page import="DTO.Login"%>
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


</head>
<body>
<%String id = (String) session.getAttribute("id"); %>
<jsp:useBean id="data" class="DAO.Log_DAO" scope="request"></jsp:useBean>
      <%
      	Login member = data.getUser_info(id);
      %>

<%@ include file="./header.jsp" %>

<div class="page_back">
	<a href="./mypage.jsp">회원정보 확인</a> | <a href="" >주문내역</a> | <a href="./mypage_ask_page.jsp"  class="mypage_title">문의하기</a> | <a href="./mypage_ask_list.jsp">문의내역</a>
	<br>
	<form action="./form/ask_insert_form.jsp">
		<table class="ask_page">
			<tr>
				<th>
					제목
				</th>
				<td>
					<input type="text" name="ask_title" placeholder=" 제목을 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th>
					이름
				</th>
				<td class="name">
					<input type="text" value="<%=member.getName() %>" readonly="readonly" name="id">
				</td>
			</tr>
			<tr>
				<th>
					분류
				</th>
				<td class="select">
					<select name="ask_category">
						<option value="1">상품</option>
						<option value="2">배송</option>
						<option value="3">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th  class="x">
					내용
				</th>
				<td>
					<textarea rows="10" cols="73" name="ask_content" placeholder="500자 이내로 입력해주세요."></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="문의하기">
	</form>
	
	
	

</div>




<div style="margin-bottom: 300px;"></div>
<%@ include file="./footer.jsp" %>

</body>
</html>

