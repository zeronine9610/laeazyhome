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
	
	int prcode = Integer.parseInt(request.getParameter("prcode"));
	int quantity = Integer.parseInt(request.getParameter("amount2"));
	
	if(id == null){
		%>
			<script>alert('로그인 하셔야 장바구니 이용이 가능합니다.');
			document.location.href="../login_page.jsp";
			</script>
		<%
		
	}else{
		int cnt = data.cart_chek(id, prcode);
		if(cnt == 0){
			%>
				<script>
					confirm("장바구니에 추가 하시겠습니까??");
				</script>
			<%
			RequestDispatcher rd = request.getRequestDispatcher("./cart_insert_form.jsp");
			rd.forward(request, response);
		}else{
			%>
				<script>alert('이미 장바구니에 있는 제품입니다.');</script>
				<script>history.back();</script>
			<%
		}
	}
%>

</body>
</html>