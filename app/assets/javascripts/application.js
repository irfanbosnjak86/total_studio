// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/basic-plus
//= require jquery.turbolinks
//= require cocoon
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  
   $('.navbar-nav').find("[href]").each(function() {
    if (this.href == window.location.href) {
        $(this).addClass("underline");
    }
    });
   $('.dropdown').find("[href]").each(function() {
    if (this.href == window.location.href) {
        $(this).attr("id", "underline");
    }
    });

  //Check to see if the window is top if not then display button
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('.scrollToTop').fadeIn();
    } else {
      $('.scrollToTop').fadeOut();
    }
  });
  
  //Click event to scroll to top
  $('.scrollToTop').click(function(){
    $('html, body').animate({scrollTop : 0},800);
    return false;
  });

  function displayThumbnail(input) {
    for( var i = 0;i<input.files.length;i++){
      if (input.files && input.files[i]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              if ($('#upload-image')) {
                        var $newImageThumbnail = makeElement('img',{ class: "image-frame",src: e.target.result});
                        $('#image-wrapper').append($newImageThumbnail);
                    }
          }

          reader.readAsDataURL(input.files[i]);
      }
    }
    function makeElement(element, options) {
        var $elem = document.createElement(element);
        $.each(options, function (key, value) {
            $elem.setAttribute(key, value);
        });
        return $elem;
    }
  }


  $("#upload-image").change(function(){
      displayThumbnail(this);
  });
});

