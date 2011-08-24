$(document).ready(function() {
   	$('.buttonLoginbg').hover(function() {
		$(this).addClass('loginHover');
	}, function() {
		$(this).removeClass('loginHover');
	});
	
	$('.menuItem_GioiThieu').click(function() {
		$('.subitem_GioiThieu').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});
	
	$('.menuItem_ToChuc').click(function() {
		$('.subitem_ToChuc').animate({opacity:'toggle', height:'toggle'}, 'fast');

	});


	$('.menuItem_HoSo').click(function() {
		$('.subitem_HoSo').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});


	$('.menuItem_TaiNguyen').click(function() {
		$('.subitem_TaiNguyen').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});


	$('.menuItem_KeHoach').click(function() {
		$('.subitem_KeHoach').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});

	
	
});