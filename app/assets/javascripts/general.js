! function(window,$,undefined){
	function configureNoticeFadeOut(time){
		window.setTimeout(function(){
			$('.notice').fadeOut('slow');
		}, time);
	}
	$(document).ready(function() {
	  configureNoticeFadeOut(1500);
	});
}(window, jQuery);