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
	String id = request.getParameter("id");
	//int prcode = Integer.parseInt(request.getParameter("prcode"));
	String prcode =request.getParameter("prcode");
	
	if(! data.cartlistDel(id, prcode)){
		%>
		<script>alert('문제가 생겼습니다. 로그인 상태 혹은 제품을 확인하고 다시 시도해주세요.');</script>
		<script>history.go(-1);</script>
		<%
	}else{
		%>
		<script>alert('장바구니에서 삭제되었습니다.');
			location.href = "../cart_page.jsp"; 
		</script>
		<%
		
	}
	%>


</body>
</html>