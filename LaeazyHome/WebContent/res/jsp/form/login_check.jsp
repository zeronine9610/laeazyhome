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
	Object DBid = session.getAttribute("id");
	String id = (String)DBid;
	
	if(id != null){
	%>
		<script>
		document.location.href="../mypage.jsp";
		</script>
		
	<%
	}else{
	%>
		<script>alert('로그인해야 이용이 가능합니다.');
		document.location.href="../login_page.jsp";
		</script>
		
	<%
	}
%>

</body>
</html>