


$(".title_click").click(function(){
	
	if($(this).nextAll().slice(0,2).is(':visible')){
		$(this).nextAll().slice(0,2).hide();
		$(this).prev().css('background-color','white');
		$(this).css('background-color','white');
		$(this).css('border-bottom','.5px solid #999');
	}else{
		$(this).nextAll().slice(0,2).show();
		$(this).prev().css('background-color','#f2f2f2');
		$(this).css('background-color','#f2f2f2');
		$(this).css('border','none');
		$(this).nextAll().slice(0,2).css('border-bottom','.5px solid #999');

	}
});

