// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $(".hamburguer").click(function(){
        lockScroll();
      $("nav").toggleClass("open");  
      $(this).toggleClass("toggle");
    });
    $(".form-edit-campo .actions input").val('Atualizar');
  });
  $(window).on('scroll', function() {
      if ($(this).scrollTop() > 10) {
        $(".home header").addClass("ativo");
      } else {
        $("header").removeClass("ativo");
      }
      if ($(this).scrollTop() > 200) {
        $(".icon-scroll").addClass("icon-scroll-gone");
      } else {
        $(".icon-scroll").removeClass("icon-scroll-gone");
      }
  });
  
  function lockScroll() {
    if ($('body').hasClass('lock-scroll')) {
        $('body').removeClass('lock-scroll');
    }
    else {
        $('body').addClass('lock-scroll');
    }
  }


/*  $(document).ready(function(){
    $('.owl-carousel').owlCarousel({
        loop:false,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            700:{
                items:2,
            },
            1050:{
                items:3,
            },
            1350:{
                items:4,
            }
        }
    })
});


*/