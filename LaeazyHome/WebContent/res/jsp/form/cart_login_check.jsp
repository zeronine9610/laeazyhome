<%@page import="DTO.item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="data" class="DAO.Item_DAO" scope="request"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String) session.getAttribute("id");
	response.setContentType("text/html; charset=utf-8");

	
	if(id == null){
		%>
			<script>alert('로그인 하셔야 장바구니 이용이 가능합니다.');
			document.location.href="../login_page.jsp";
			</script>
		<%
		
	}else{
		%>
		<script>
		document.location.href="../cart_page.jsp";
		</script>
		<%
	}
%>

</body>
</html>