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

<!-- js -->
<script defer src="../js/longin.js"></script>


</head>
<body>

<%@ include file="./header.jsp" %>

<div  class="Page_back">
	<p class="mypage_title">회원 가입</pc>
	<br>
	<form action="./form/register_check.jsp" method="post" name="userinfo">
	<p class="p1">*아이디</p><br>
	<input type="text" name="id" id="reg_id_css" readonly="readonly"  placeholder=" 중복 확인을 먼저 클릭해주세요.">
	<input type="button" value="중복확인" id="reg_btn" onclick="idCheck()">
	<input type="hidden" name="" value="">
	<p class="p1">*비밀번호</p><br>
	<input type="password" name="pwd" autocomplete="new-password" placeholder=" 최소 8자리 이상 가능합니다.">	
	<p class="p1">*비밀번호 확인</p><br>
	<input type="password" name="pwd_check" autocomplete="new-password" placeholder=" 한번 더 입력해주세요.">
	<p class="p1">*이름</p><br>
	<input type="text" name="name" placeholder=" 이름을 입력해주세요.">
	<p class="p1">*휴대폰번호</p><br>
	<input type="text" name="phone" placeholder=" 휴대펀 번호를 입력해주세요.">
	<p class="p1">*이메일</p><br>
	<input type="text" name="email" placeholder=" 이메일을 입력해주세요.">
	<p class="p1">*주소</p><br>
	<input type="text" id="sample3_postcode" placeholder="우편번호" name="post_code">
	<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" id="post_btn"><br>
	<input type="text" id="sample3_address" placeholder="주소" name="address_1"><br>
	<input type="text" id="sample3_detailAddress" placeholder="상세주소" name="address_2">
	<input type="text" id="sample3_extraAddress" placeholder="참고항목" name="address_3">
	
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<br><br>
	
	<input type="button" value="가입하기" class="btn" onclick="checkValue()">
	</form><br><br>
</div>
<div style="margin-bottom: 300px;"></div>

<%@ include file="./footer.jsp" %>



</body>
</html>

