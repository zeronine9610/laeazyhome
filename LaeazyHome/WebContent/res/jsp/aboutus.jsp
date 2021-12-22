<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/aboutus.css">


</head>
<body>

<div class="about_header">
<%@ include file="./header.jsp" %>
</div>

<div class="about_back">
	<p class="about_title">LaeazyHome</p>
	<p class="about_contents">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard<br>
	 dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen <br>
	 book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It<br>
	  was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with<br>
	   desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
	<p class="about_contents">1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing<br>
	 software like Aldus PageMaker including versions of Lorem Ipsum.</p> 
	<div class="about_img">
		<img src="../image/krista-mangulsone-RnR12I78SFo-unsplash.jpg" alt="">
	</div>
	<p  class="about_contents">1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing<br>
	 software like Aldus PageMaker including versions of Lorem Ipsum.</p>
	 <div class="about_img">
	 	<img src="../image/11.jpg" alt="" class="aboutus-img-2">
	 </div>
	 <div class="ytube">
        <p>* 본 영상은 해당 페이지와 관계없는 영상입니다.<br></p>
        <iframe src="https://www.youtube.com/embed/71oUAZcGG8A?autoplay=1 " title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen width="1000px;"height="500px;"></iframe>            </div>
     </div>
</div>


<%@ include file="./footer.jsp" %>

</body>
</html>