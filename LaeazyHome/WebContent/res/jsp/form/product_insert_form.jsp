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
%>

<jsp:useBean id="data" class="DAO.Item_DAO" scope="request"></jsp:useBean>
<%
String prname = request.getParameter("prname");
int category_code = Integer.parseInt(request.getParameter("category_code"));
String prbrand = request.getParameter("prbrand");
String primg = request.getParameter("primg");
int prprice = Integer.parseInt(request.getParameter("prprice"));
String hashtag = request.getParameter("hashtag");


if(! data.pr_insert(prname, category_code, prbrand, primg, prprice, hashtag)){
	%>
	<script>alert('수정에 실패하였습니다.');</script>
	<script>history.back();</script>
	<%
}else{
	%>
	<script>alert('수정이 완료되었습니다!');</script>
	<script>location.href = "product_insert.jsp"; </script>
	
	<%
	
}
%>

</body>
</html>