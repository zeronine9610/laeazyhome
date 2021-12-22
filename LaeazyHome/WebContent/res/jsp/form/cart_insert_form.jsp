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
	
	int prcode = Integer.parseInt(request.getParameter("prcode"));
	int quantity = Integer.parseInt(request.getParameter("amount2"));
	
	if(! data.pr_cart(id, prcode, quantity)){
		%>
		<script>alert('문제가 생겼습니다. 로그인 상태 혹은 제품을 확인하고 다시 시도해주세요.');</script>
		<script>history.go(-2);</script>
		<%
	}else{
		%>
		<script>if(confirm('장바구니에 추가되었습니다! 확인하러 가시겠습니까?') ==true){
			location.href = "../cart_page.jsp"; 
		}else{
			history.go(-1); 
		}
		</script>
		
		<%
		
	}
	%>






</body>
</html>