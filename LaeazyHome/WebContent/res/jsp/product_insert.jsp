<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

input{
	width: 400px;
	height: 40px;
	margin-bottom: 15px;
}
table{
	margin-left: 300px;
	margin-top: 200px;
}
</style>
</head>
<body style="text-align: center;">
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
	<form action="pr_insert.jsp">
	<table>
		<tr><th>제품 이름</th> <td><input type="text" name="prname"></td>
		<tr><th>카테고리(1:october, 2:november, 3:december</th> 
			<td><input type="text" name="category_code" value="3">
		<tr><th>브랜드</th> <td><input type="text" name="prbrand" value=""></td>
		<tr><th>이미지  (../image/itemList/)</th>
			 <td><input type="text" name="primg" value=""></td>
		<tr><th>가격 </th><td> <input type="text" name="prprice"></td>
		<tr><th>해쉬태그</th> <td><input type="text" name="hashtag"></td>
	</table>
		
		<br><br>
		<input type="submit" value="등록">
	</form>

</body>
</html>

<!-- 

	//제품 등록
	
	public boolean pr_insert(String prname, int category_code, String prbrand,String primg,int prprice, String hashtag ) {
		PreparedStatement pstm = null;
		String query = "insert into product (prname,category_code,prbrand,prcontent,primg,prprice,hashtag,regdate) values(?,?,?,'Red pillow cover Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin',?,?,?,now());";
		
		openConnection();
		int count = 0;
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, prname);
			pstm.setInt(2, category_code);
			pstm.setString(3, prbrand);
			pstm.setString(4, primg);
			pstm.setInt(5, prprice);
			pstm.setString(6, hashtag);
			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
	}

 -->