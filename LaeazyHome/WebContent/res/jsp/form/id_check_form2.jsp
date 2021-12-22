<%@page import="DAO.Log_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	font-size: 20px;
	text-decoration: none;
}
a:hover{
	opacity: 0.7;
}
</style>
</head>
<body style="background-color: #f2f2f2; text-align: center; font-family: Noto Sans;">
	<div>
	<h3>아이디 중복 확인 결과</h3>
	<hr><br>
	<jsp:useBean id="data" class="DAO.Log_DAO" scope="request"></jsp:useBean>
	<%
		String id = request.getParameter("id");
		int cnt = data.checkID(id);
	%>
	입력하신 아이디 <%= id %>는 <%
	if(cnt == 0){
		%><div style="color:blue; display: inline-block;">사용 가능한 아이디 입니다.</div><br><br><%
		out.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");%><br><br>
		<a href="javascript:history.back()">[다른 아이디 사용하기]</a><br><br>
		
		<script>
			function apply(id){
				opener.document.userinfo.id.value=id;
				window.close();
			}
		</script>
		<%		
	}else{
		%><div style="color:red; display: inline-block;">이미 사용중인 아이디 입니다.</div><br><br>
		<a href="javascript:history.back()">[다시시도]</a><br><br>
		<a href="javascript:window.close()">[창닫기]</a>
		<%
	}
	%>
	</div>	
</body>
</html>