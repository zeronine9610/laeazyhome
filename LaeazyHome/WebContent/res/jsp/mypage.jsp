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
<link rel="stylesheet" href="../css/mypage.css">
<script defer src="../js/longin.js"></script>



</head>
<body>
<%String id = (String) session.getAttribute("id"); %>

<%@ include file="./header.jsp" %>

<jsp:useBean id="data" class="DAO.Log_DAO" scope="request"></jsp:useBean>
      <%
      	Login member = data.getUser_info(id);
      %>
<div  class="Page_back">
	<a href="./mypage.jsp" class="mypage_title">회원정보 확인</a> | <a href="">주문내역</a> | <a href="./mypage_ask_page.jsp">문의하기</a> | <a href="./mypage_ask_list.jsp">문의내역</a>
	<br>
	<form action="./form/update.jsp" method="post" class="mypage_form" name="mypage_user">
	<p class="p1">*아이디</p><br>
	<input type="text" name="id" value="<%=member.getId() %>" readonly="readonly">
	<p class="p1">*비밀번호</p><br>
	<input type="password" name="pwd"  value="<%=member.getPwd() %>">
	<p class="p1">*비밀번호 확인</p><br>
	<input type="password" name="pwd_check"  value="<%=member.getPwd() %>">
	<p class="p1">*이름</p><br>
	<input type="text" name="name"  value="<%=member.getName() %>" readonly="readonly">
	<p class="p1">*휴대폰번호</p><br>
	<input type="text" name="phone"  value="<%=member.getPhone() %>">
	<p class="p1">*이메일</p><br>
	<input type="text" name="email"  value="<%=member.getEmail() %>">
	<p class="p1">*주소</p><br>
	<input type="text" id="sample3_postcode" placeholder="우편번호" name="post_code" value="<%=member.getPost_code()%>">
	<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" id="post_btn"><br>
	<input type="text" id="sample3_address" placeholder="주소" name="address_1"value="<%=member.getAddress()%>"><br>
	<input type="text" id="sample3_detailAddress" placeholder="상세주소" name="address_2" >
	<input type="text" id="sample3_extraAddress" placeholder="참고항목" name="address_3">
	
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<br><br>
	<input type="button" value="변경 사항 저장하기" class="btn"  onclick="mycheckValue()">
	</form><br><br>
		<p class="p1">*가입한 날짜</p><br><br>
	<input type="text" name="reg_date" value="<%=member.getRegdate() %>" readonly="readonly"">
	<br><br><br><br><a href="./logout.jsp" class="logout">로그 아웃 하기</a>
</div>
<div style="margin-bottom: 300px;"></div>

<%@ include file="./footer.jsp" %>



</body>
</html>

