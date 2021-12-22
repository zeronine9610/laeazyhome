<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="data" class="DAO.Log_DAO" scope="request"></jsp:useBean>

<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String post_code = request.getParameter("post_code");
String address = request.getParameter("address_1")+' '+request.getParameter("address_2")+' '+request.getParameter("address_3");


if(! data.User_Insert(id,pwd,name,phone,email,post_code,address)){
	%>
	<script>alert('아이디가 중복되었거나 입력을 잘못하셨습니다.');</script>
	<script>history.back();</script>
	<%
	}else{
	%>
	<script>alert('가입이 완료 되셨습니다! 환영합니다! 로그인 페이지로 이동합니다.');</script>
	<script>location.href = "../login_page.jsp"; </script>	
	<%
	}
	%>

</body>
</html>