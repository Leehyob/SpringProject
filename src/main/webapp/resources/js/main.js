$(document).ready(function(){
        	
        	$(".portfolio-thumb").on("click", function(){
        		console.log("테스트입니다")
        		var areaname = $(this).find("img").attr("alt");
        		
        		console.log(areaname);
        		
        		planService.getArea(areaname, function(data){
        	          $("#modal-area-name").text("대한민국 " + areaname);
        	          $("#modal-area-explain").text(data.aexplain);

        	          var imageUrl = "/resources/images/gallery/" + areaname + ".jpg";
        	          var altText = areaname;
        	          $("#modalimage").attr("src", imageUrl);
        	          $("#modalimage").attr("alt", altText);
        	          $("input[name='areaname']").val(altText);
        	          // 모달 열기
        	          $("#modal-toggle").prop("checked", true);
        				console.log(data)
        				})
        				
        		
        	})
        	
        	$("#makePlan").on("click", function(){
        		var areaname = $(this).val();
        		console.log(areaname)
        	});
        	
        });
        
        var planService = (function(){
        	
        	function getArea(areaname, callback){
        		
        		console.log("areaname"+areaname);
        		
        		$.ajax({
        		  type:"get",
        		  url:"/plan/getArea/" + areaname,
        		  
        		  success: function(data, status, xhr){
        			if(callback){
        				callback(data)
        			}  
        		  },
        		  
        		  error:function(xhr,status, er){
        			  if(error){
        				  error(er)
        			  }
        		  }
        		  
        		
        			
        		})
        		
        	}//end getArea
        	return{
        		getArea:getArea
        	}
        })();

jQuery(document).ready(function($) {

	'use strict';


	/************** Toggle *********************/
    // Cache selectors
    var lastId,
        topMenu = $(".menu-first"),
        topMenuHeight = 50,
        // All list items
        menuItems = topMenu.find("a"),
        // Anchors corresponding to menu items
        scrollItems = menuItems.map(function(){
          
          if($(this).hasClass('external')) {
            return;
          }
            
          var item = $($(this).attr("href"));
          if (item.length) { return item; }
        });

    // Bind click handler to menu items
    // so we can get a fancy scroll animation
    menuItems.click(function(e){
      var href = $(this).attr("href"),
          offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
      $('html, body').stop().animate({ 
          scrollTop: offsetTop
      }, 300);
      e.preventDefault();
    });

    // Bind to scroll
    $(window).scroll(function(){
       // Get container scroll position
       var fromTop = $(this).scrollTop()+topMenuHeight;
       
       // Get id of current scroll item
       var cur = scrollItems.map(function(){
         if ($(this).offset().top < fromTop)
           return this;
       });
       // Get the id of the current element
       cur = cur[cur.length-1];
       var id = cur && cur.length ? cur[0].id : "";
       
       if (lastId !== id) {
           lastId = id;
           // Set/remove active class
           menuItems
             .parent().removeClass("active")
             .end().filter("[href=#"+id+"]").parent().addClass("active");
       }                   
    });



    $(window).scroll(function(){
         $('.main-header').toggleClass('scrolled', $(this).scrollTop() > 1);
     });



    $('a[href="#top"]').click(function(){
        $('html, body').animate({scrollTop: 0}, 'slow');
        return false;
    });


    $('.flexslider').flexslider({
      slideshow: true,
      slideshowSpeed: 3000,  
      animation: "fade",
      directionNav: false,
    });


    $('.toggle-menu').click(function(){
        $('.menu-first').toggleClass('show');
        // $('.menu-first').slideToggle();
    });

    $('.menu-first li a').click(function(){
      $('.menu-first').removeClass('show');
    });


    /************** LightBox *********************/
      $(function(){
        $('[data-rel="lightbox"]').lightbox();
      });


});
