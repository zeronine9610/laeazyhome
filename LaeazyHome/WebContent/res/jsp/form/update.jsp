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
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
/*			session.setAttribute("ID", id);
			
			RequestDispatcher rd = request.getRequestDispatcher("info.jsp");
			rd.forward(request, response); */
%>
<jsp:useBean id="member" class="DTO.Login" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="data" class="DAO.Log_DAO"></jsp:useBean>
<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String post_code = request.getParameter("post_code");
String address = request.getParameter("address_1")+' '+request.getParameter("address_2")+' '+request.getParameter("address_3");

	if(! data.UpdateUser_info(pwd, phone, post_code, address, email, id)){
		%>
		<script>alert('수정에 실패하였습니다.');</script>
		<script>history.back();</script>
		<%
	}else{
		%>
		<script>alert('수정이 완료되었습니다!');</script>
		session.setAttribute("id", id);
		<script>location.href = "../mypage.jsp"; </script>
		
		<%
		
	}
%>


</body>
</html>