
function ws_basic(c,a,b){this.go=function(d){b.find("ul").css("transform","translate3d(0,0,0)").stop(true).animate({left:(d?-d+"00%":(/Safari/.test(navigator.userAgent)?"0%":0))},c.duration,"easeInOutExpo");return d}};// -----------------------------------------------------------------------------------

jQuery("#wowslider-container1").wowSlider({effect:"basic",prev:"",next:"",duration:20*100,delay:20*100,width:960,height:360,autoPlay:true,playPause:true,stopOnHover:false,loop:false,bullets:true,caption:true,captionEffect:"slide",controls:true,onBeforeStep:0,images:0});