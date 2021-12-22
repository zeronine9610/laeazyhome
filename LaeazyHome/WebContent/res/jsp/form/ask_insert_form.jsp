<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="data" class="DAO.ask_DAO" scope="request"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String id = (String) session.getAttribute("id");
	int ask_category = Integer.parseInt(request.getParameter("ask_category"));
	String ask_title = request.getParameter("ask_title");
	String ask_content = request.getParameter("ask_content");
	
	if(! data.ask_Insert(id, ask_category, ask_title, ask_content)){
		%>
		<script>alert('문제가 생겼습니다. 확인하고 다시 시도해주세요.');</script>
		<script>history.go(-1);</script>
		<%
	}else{
		%>
		<script>alert('문의가 완료 되었습니다.');</script>
		<script>location.href = "../mypage_ask_list.jsp"; </script>
		<%
				
	}
	%>



</body>
</html>