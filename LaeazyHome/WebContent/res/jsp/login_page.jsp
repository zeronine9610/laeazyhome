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
<link rel="stylesheet" href="../css/login.css">


</head>
<body>
<div class="Page_back">
	<p class="Login_title"><a href="../../index.jsp">LaeazyHome</a></p>
	<div class="Login_form">
		<form action="./form/log_form.jsp" method="post">
			<input type="text" placeholder=" 아이디" name="id" value="admin"><br>
			<input type="password" placeholder=" 비밀번호" name="pass" id="pass" value="11111111"><br>
			<input type="submit" value="로그인하기">
		</form>
		<br><br>
		<a href="./register.jsp"> 회원가입</a>
	</div>
</div>


<%@ include file="./footer.jsp" %>


          
 

</body>
</html>
