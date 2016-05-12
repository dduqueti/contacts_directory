! function(window,$,undefined){

  $(document).ready(function() {
    configureNoticeFadeOut(1500);
  });

  function configureNoticeFadeOut(time){
    window.setTimeout(function(){
      $('.notice').fadeOut('slow');
    }, time);
  }
}(window, jQuery);