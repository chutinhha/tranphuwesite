$(document).ready(function() {
   	$('.buttonLoginbg').hover(function() {
		$(this).addClass('loginHover');
	}, function() {
		$(this).removeClass('loginHover');
	});
	
	$('.menuItem_GioiThieu').hover(function() {
		$('.subitem_GioiThieu').addClass('subitem_GioiThieu_display');
	}, function() {
		$('.subitem_GioiThieu').removeClass('subitem_GioiThieu_display');
	});
	
});