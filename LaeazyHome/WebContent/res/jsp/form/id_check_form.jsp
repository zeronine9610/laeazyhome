<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input[type=text]{
	height: 30px;
	}
</style>
</head>
<body style=" background-color: #f2f2f2">

	<div style="text-align: center;" > 
	<h3> 아이디 중복확인 </h3>
	<hr><br>
	 <form method="post" action="id_check_form2.jsp" onsubmit="return blankCheck(this)"> 
	 아이디 : <input type="text" name="id" maxlength="25" autofocus  pattern="[A-Za-z]+" placeholder="영어만 입력 가능합니다."> 
	 <input type="submit" value="중복확인"> 
	 </form> 

	 </div>
<script> 
function blankCheck(f){ 
	var id=f.id.value; id=id.trim(); 
	if(id.length<5){ alert("아이디는 5자 이상 입력해주십시오."); 
		return false; 
	}
	return true; 
	} 
	</script>


</body>
</html>