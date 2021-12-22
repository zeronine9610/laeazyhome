
$(function() {
	$(window).scroll(function() {
        if($(this).scrollTop() < 700)
            $('.header-back').css('background','rgba(242, 242, 242, 0)');
        else 
            $('.header-back').css('background','rgba(242, 242, 242, 0.7)');
        }); 
})


/* month display */ 
  $(function(){
    $('.monthly').click(function(){
      if($('.monthly_item').is(':visible')){
        $('.monthly_item').hide(300);
      }else{
       $('.monthly_item').show(300);
      }
    })
  })

/* 헤더 메뉴 눌렀을때 display */ 
  $(function(){
    $('.side_menu_img').click(function(){
    	document.getElementById("sideNav_back").style.zIndex = 4;
    	  $('.sideNav_left').show(300);
    	  $('.sideNav_right').show(300);
    	  $('.side_menu_img').hide();
    	  $('.header_title').hide();
    	  $('.header_nav_search').hide(300);
    	  $('.header_nav_mypage').hide(300);
    	  $('.header_nav_cartPage').hide(300);
    	  

    })
  })
  /* 사이드 메뉴 눌렀을때 display */ 
  $(function(){	
    $('.sideNav_menu_img').click(function(){
    	document.getElementById("sideNav_back").style.zIndex = 0;
    	  $('.sideNav_left').hide(300);
    	  $('.sideNav_right').hide(300);
    	  $('.side_menu_img').show();
    	  $('.header_title').show(200);
    	  $('.header_nav_search').show(200);
    	  $('.header_nav_mypage').show(200);
    	  $('.header_nav_cartPage').show(200);

    })
  })
  
  /* 헤더 검색 버튼 클릭 */
  
  $(function(){
	  $('.header_nav_search').click(function() {
		  $('.header_nav_search').hide(0);
		  $('.header_nav_mypage').hide(0);
		  $('.header_nav_cartPage').hide(0);
		  $('.header_form').show(300);
		  $('.header_nav_search_cancle').show(300);
	})
  })
  
   $(function(){
	  $('.header_nav_search_cancle').click(function() {
		  $('.header_nav_search').show(300);
		  $('.header_nav_mypage').show(300);
		  $('.header_nav_cartPage').show(300);
		  $('.header_form').hide(0);
		  $('.header_nav_search_cancle').hide(0);
	})
  })
 
 
  
  







