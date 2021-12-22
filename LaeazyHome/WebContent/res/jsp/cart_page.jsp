<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%DecimalFormat formatter = new DecimalFormat("###,###"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LaeazyHome</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <!-- Noto Sans Kr font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- css 연결 -->
<link rel="stylesheet" href="../css/cart.css">
<script type="text/javascript">
   function cartlistDelete(id,prcode) {
      if(confirm("장바구니에서 삭제 하시겠습니까?")== true){
      document.location.href="./form/cart_list_del.jsp?id="+id+"&prcode="+prcode;
      

      }else{
    	  return;
      }
   }
</script>


</head>
<body>
<jsp:useBean id="cartlist" class="DAO.Item_DAO" scope="page"></jsp:useBean>
<jsp:useBean id="alltotal" class="DAO.Item_DAO" scope="request"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("id");
	response.setContentType("text/html; charset=utf-8");
	
	ArrayList<cart> dao = (ArrayList<cart>)cartlist.getCartList(id);
	
	cart alltotalCart = alltotal.getTotal(id);
	
	int result = alltotalCart.getAlltotal();
	int result2 = alltotalCart.getAlltotal()+2500;
%>

<%@ include file="./header.jsp" %>

<div class="cart_back">
<p class="cart_title">장바구니</p>
<table>
	<tr class="table_title"><th>제품</th><th>상품명</th><th>수량</th><th>가격</th><th>배송비</th><th>삭제</th></tr>
	<%
			
		for(cart ab: (ArrayList<cart>) dao){
			%>
				<tr class="tr" onclick="./mypage.jsp"style="cursor: pointer;"><td><img alt="" src="<%=ab.getPrimg() %>"> <td class="td"><%=ab.getPrname() %></td></td><td class="td"><%=ab.getQuantity() %></td><td class="td"><%=formatter.format(ab.getTotal()) %></td><td class="td">2,500</td><td class="td"><input type="button" value="X" onclick="cartlistDelete('<%=id%>','<%=ab.getPrcode()%>')"> </tr>
			<%
				
			
		}
		
		
	%>
	
</table>

	<div class="cart_result">
		<table class="table2">
			<tr><th>상품 합계</th><td><%=formatter.format(result) %>원</td></tr>
			<tr><th>배송비</th><td>2,500원</td></tr>
		</table>
		<hr>
		<table  class="table2">
			<tr><th>합계</th><td><%=formatter.format(result2)%>원</td></tr>
		</table>
		<input type="button" value="주문하기" onclick="" class="payBtn">
	</div>
	

</div>
<div style="margin-bottom: 800px;"></div>
<%@ include file="./footer.jsp" %>
</body>
</html>

