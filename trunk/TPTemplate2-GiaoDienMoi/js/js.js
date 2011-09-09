$(document).ready(function() {
   	
	$('.menuItem_GioiThieu').click(function() {
		$('.gioiThieu-subitem').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});
	
	$('.menuItem_ToChuc').click(function() {
		$('.toChuc-subitem').animate({opacity:'toggle', height:'toggle'}, 'fast');

	});


	$('.menuItem_HoSo').click(function() {
		$('.hoSo-subitem').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});


	$('.menuItem_TaiNguyen').click(function() {
		$('.taiNguyen-subitem').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});


	$('.menuItem_KeHoach').click(function() {
		$('.keHoach-subitem').animate({opacity:'toggle', height:'toggle'}, 'fast');
	});

	
	
});

   $(document).ready(function() {
            var $navLi = $('#nav li'); 
        $('<span></span>').insertBefore('#nav li a');
        
        $navLi.each(function() {
           var linkText = $(this).find('a').text();
           $(this).find('span').show().text(linkText);
           //alert(linkText);
        });
        $navLi.hover(function() {
            $(this)
            .find('span')
            .stop()
            .animate({marginTop: '-40px'}, 200);
        }, function() {
            $(this)
            .find('span')
            .stop()
            .animate({marginTop: '0px'}, 200);
        });
        });
