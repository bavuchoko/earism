$(window).on('scroll', function(){
    var v =$(window).scrollTop();
    if(v >70){
        $("#top_fixbar").css("position","fixed");
        $("#top_fixbar").css("top","0");
    }
    if(v <=70){
        $("#top_fixbar").css("position","relative");
     
    }
})

//스크롤 위치 찾기

$("document").ready(function(){
    $(window).scroll(function(){
        var postion =$(window).scrollTop();
        console.log(postion);
    });
})


//sectortwo 글자 애니메이션
$(window).scroll(function(){
    var high =$(document).scrollTop();
    if(high<1100){
        $("#pa").css("transform","scale(1.5)");
    }

    if(high<1150){
        $("#pb").css("transform","scale(1.5)");
    }

   if(high<1290){
        $("#pc").css("transform","scale(1.5)");
    }

   if(high<1350){
        $("#pd").css("transform","scale(1.5)");
    }

   if(high<1490){
        $("#pe").css("transform","scale(1.5)");
    }

   if(high<1550){
        $("#pf").css("transform","scale(1.5)");
    }

   if(high<1590){
        $("#pg").css("transform","scale(1.5)");
    }
})

// 673  803 923 1044 1164 1180 1285 1420
 //마우스 휠없다운
$(window).bind('wheel', function(event){
    if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
        // 휠위로
 
    }
    else {
        // 휠 아래로

    }
});



var s =skrollr.init();


$(window).scroll(function(){
    var high =$(document).scrollTop();
    if(high>2356){
        $("#sectorthreehtag").css("position","fixed");
        $("#sectorthreehtag").css("top","0px");
    }else{
        $("#sectorthreehtag").css("position","absolute");
    }
    if(high>2450){
        $(".ca").css("position","fixed");
        $(".ca").css("top","200px");
    }else{
        $(".ca").css("position","absolute");
        $(".ca").css("top","300px");
    }
    if(high>3150){
        $(".cb").css("position","fixed");
        $(".cb").css("top","200px");
    }else{
        $(".cb").css("top","1000px");
        $(".cb").css("position","absolute");
  
    }
    if(high>3850){
        $(".cc").css("position","fixed");
        $(".cc").css("top","200px");
    }else{
        $(".cc").css("position","absolute");
        $(".cc").css("top","1700px");
    }
    if(high>4550){
        $(".cd").css("position","fixed");
        $(".cd").css("top","200px");
    }else{
        $(".cd").css("position","absolute");
        $(".cd").css("top","2400px");
    }
    if(high>5250){
        $(".ce").css("position","fixed");
        $(".ce").css("top","200px");
    }else{
        $(".ce").css("position","absolute");
        $(".ce").css("top","3100px");
    }

    if(high>5350){
        $(".cardview").css("position","absolute");
        $(".cardview").css("top","3150px");
        $("#sectorthreehtag").css("position","absolute");
        $("#sectorthreehtag").css("top","2980px");
        
    }
})



//로그인


//로그인 클릭시 로그인창 팝업 메서드 호출
$(".fa-user-circle").click(function(){
    loignpopup();
  })
  
  //회색배경 클릭시 로그인창 팝아웃 메서드 호출
  $("#login_dim").click(function(){
    loignpopout();
  })
  
  function loignpopup(){
    $("#login").removeClass("popout");
    $("#join").addClass("disphidden");
    $("#login_dim").removeClass("disphidden");
    $("#login_dim").show();
    setTimeout(function() {
      $("#loginleft").removeClass("disphidden");
      $("#loginright").removeClass("disphidden");
      $("#login").removeClass("disphidden");
      $("#login").addClass("flex");
      $("#login").addClass("popin");
    }, 50);
  }
  
  //회색 배경 클릭시 로그인창 팝 아웃
  function loignpopout(){
  
    if($("#forgotleft").hasClass("sutoc")||$("#joinleft").hasClass("sltoc")){
      setTimeout(function() {
      $("#login").removeClass("popin");
      $("#login").addClass("popout");
      }, 1000);
      setTimeout(function() {
        $("#login_dim").addClass("disphidden");
        $("#loginleft").addClass("disphidden");
        $("#loginright").addClass("disphidden");
        if(!$("#join").hasClass("disphidden")){
          $("#join").addClass("disphidden");}
          if(!$("#forgot").hasClass("disphidden")){
          $("#forgot").addClass("disphidden");}
          if(!$("#login").hasClass("disphidden")){
            $("#login").addClass("disphidden");}
          if($("#login").hasClass("disphidden")){
          $("#login").removeClass("flex");}
      }, 1400);
    }else if(!$("#forgotleft").hasClass("sutoc")&&!$("#joinleft").hasClass("sltoc")){
        $("#login").removeClass("popin");
        $("#login").addClass("popout");
        setTimeout(function() {
        $("#login_dim").addClass("disphidden");
        $("#loginleft").addClass("disphidden");
        $("#loginright").addClass("disphidden");
        if(!$("#join").hasClass("disphidden")){
          $("#join").addClass("disphidden");}
          if(!$("#forgot").hasClass("disphidden")){
          $("#forgot").addClass("disphidden");}
          if(!$("#login").hasClass("disphidden")){
          $("#login").addClass("disphidden");}
          if($("#login").hasClass("disphidden")){
          $("#login").removeClass("flex");}
      }, 600);
    }
      
    $("#joinleft").removeClass("sltoc");
    $("#joinright").removeClass("srtoc");
    if(!$("#joinleft").hasClass("sctol")){
    $("#joinleft").addClass("sctol");}
    if(!$("#joinleft").hasClass("sctor")){
    $("#joinright").addClass("sctor");}
    $("#forgotleft").removeClass("sutoc");
    $("#forgotright").removeClass("sdtoc");
    if(!$("#forgotleft").hasClass("sctou")){
    $("#forgotleft").addClass("sctou");}
    if(!$("#forgotleft").hasClass("sctod")){
    $("#forgotright").addClass("sctod");}
  
  
  }
  
  // join  클릭시 회원가입창 으로
  $(".join").click(function(){
    joinpopup();
  })
  function joinpopup(){
    $("#login").addClass("disphidden"); 
    $("#join").removeClass("disphidden");
    $("#join").show();
    // $("#loginright").addClass("disphidden");
    // $("#loginleft").addClass("disphidden");
    $("#joinleft").removeClass("disphidden");
    $("#joinright").removeClass("disphidden");
    $("#joinleft").removeClass("sctol");
    $("#joinright").removeClass("sctor");
    $("#joinleft").addClass("sltoc");
    $("#joinright").addClass("srtoc");
  }
  
  // 회원가입에서 login  클릭시 로그인창 으로
  $(".login").click(function(){
    joinpopout();
  })
  function joinpopout(){
    $("#joinleft").removeClass("sltoc");
    $("#joinright").removeClass("srtoc");
    $("#joinleft").addClass("sctol");
    $("#joinright").addClass("sctor");
    // $("#login").removeClass("disphidden"); 
    setTimeout(function() {
      
      $("#join").addClass("disphidden");
    }, 1000);
  }
  
  
  // 비밀번호 찾기 클릭시 비밀번호 찾기로
  $("#findpw").click(function(){
    findpopup();
  })
  function findpopup(){
    $("#login").addClass("disphidden"); 
    $("#forgot").removeClass("disphidden");
    $("#forgot").show();
    // $("#loginright").addClass("disphidden");
    // $("#loginleft").addClass("disphidden");
    $("#forgotleft").removeClass("disphidden");
    $("#forgotright").removeClass("disphidden");
    $("#forgotleft").removeClass("sctou");
    $("#forgotright").removeClass("sctod");
    $("#forgotleft").addClass("sutoc");
    $("#forgotright").addClass("sdtoc");
  }
  
  //비밀번호 찾기에서 로그인 클릭시 로그인 창으로
  $(".forgot").click(function(){
    forgotpopout();
  })
  function forgotpopout(){
    $("#forgotleft").removeClass("sutoc");
    $("#forgotright").removeClass("sdtoc");
    $("#forgotleft").addClass("sctou");
    $("#forgotright").addClass("sctod");
    // $("#login").removeClass("disphidden"); 
    setTimeout(function() {
      
      $("#forgot").addClass("disphidden");
    }, 1000);
  }
  

  //앨범커버 미리보기

  	// 콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgArea').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(":input[name='album_artwork']").change(function() {
		if( $(":input[name='album_artwork']").val() == '' ) {
			$('#imgArea').attr('src' , '');  
		}
		$('#imgViewArea').css({ 'display' : '' });
		readURL(this);
	});

	// 이미지 에러 시 미리보기영역 미노출
	function imgAreaError(){
    $('#imgArea').attr('src' , 'imgs/xxxmusic.png');  
	}


  /*  신용카드 등록  */


  $(".creditregist").click(function(){
    $(".checkout").removeClass("disphidden");
    $(".carddim").removeClass("disphidden");
  })
  $(".carddim").click(function(){
    $(".checkout").addClass("disphidden");
    $(".carddim").addClass("disphidden");
  })