<%@page import="DTO.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="data" class="DAO.Log_DAO" scope="request"></jsp:useBean>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		Login member = data.getLogin(id, pass);
		
		String DBid = member.getId();
		String DBname = member.getName();
		String DBpass = member.getPwd();
	%>

	
	<% if(DBpass.equals(pass)){

		session.setAttribute("id", DBid);
	%>
		<script>alert('<%=DBname%> 님 환영합니다.');
		document.location.href="../../../index.jsp";
		</script>
		
	<%
	}else{
	%>
	<script>alert('비밀번호를 잘못 입력하셨습니다.');
		document.location.href="javascript:history.back()";
	</script>	
	<%
	}
	%>


</body>
</html>