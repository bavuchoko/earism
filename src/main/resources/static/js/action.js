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

// $("document").ready(function(){
//     $(window).scroll(function(){
//         var postion =$(window).scrollTop();
//         console.log(postion);
//     });
// })


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
$(".yetlogedin").click(function(){
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


// $(".needadd").click(function(){
//   $(".checkout").removeClass("disphidden");
// })



function sendfrm(){

  creditfrm.action="registcredit.do";
  creditfrm.methoe="post";
  creditfrm.submit();
}

function inputChecker(){
  
}
//정규식
$(function(){
  $("#id").on("propertychange change keyup paste input", function(){
      var idReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      if( !idReg.test($("#id").val())){
          $(".id_duplicate_check").html("이메일 형태로 입력하세요");
          return;
      }else{
          $.ajax({
              type:'get',
              url:'idcheck.do',
              data:{id:$("#id").val()},
              success:function(data){
                  if(data!=1){
                      if($("#id").val() !=""){
                      $(".id_duplicate_check").html(" ");}
                  }else{
                      $(".id_duplicate_check").html("이미 존재하는 이메일입니다.");}
              },
             
          });
  
      }
  });


  $("#input_id").on("propertychange change keyup paste input", function(){
      var idReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      if( !idReg.test($("#input_id").val())){
          $("#idcheck").html("이메일 형태로 입력하세요");
          return;
      }
      if( idReg.test($("#input_id").val())){
          $("#idcheck").html("환영합니다");
          return;
      }})

  
})
//비번체크

$(function(){
  $(".pwc").on("propertychange change keyup paste input", function(){
      var pwd1 = $(".pw").val();
      
      var pwd2 = $(".pwc").val();
      if ( pwd1 != '' && pwd2 == '' ) {null;
      }else if (pwd1 != "" || pwd2 != "") {
          if (pwd1 == pwd2) {
              $("#pwcheck").html(" ");    // 비밀번호 일치 이벤트 실행
          } else {
              $("#pwcheck").html("비밀번호가 다릅니다.");
          }
      }
  });
})



//음악 업로드
function uploadfile(){
  musicuploader.submit();
}

//아이프레임 페이징
function open_in_frame(url) {
  
	$('#my_frame').attr('src', url);
}

//장바구니 체크박스

$("#cball").on('click', function(){

  chkbox =document.getElementsByName("cb1");
  if($("#cball").is(":checked")){
   for(i=0; i<chkbox.length; i++){
       chkbox[i].checked =true;
   }
  }else{
   for(i=0; i<chkbox.length; i++){
       chkbox[i].checked =false;
   }
  }
});



//장바구니 등록
$(".fa-cart-plus").click(function(){
  var a =$(this).attr("id");
  
  // alert(a);
    $.ajax({
      url: "registcart.do",
      data:{s_num:a},
      success:function(data){
        
        if(data == 0){
          letknow("#alarmsend");
        }else if(data==1){
          letknow("#alarmsendone");
        }else if(data==2){
          letknow("#alarmsendtwo");
        }else if(data==3){
          letknow("#alarmsendthree");
        }
      },
      error:function(){
      }
    })
})

//알림창 띄우기
function letknow(data){
  $(data).removeClass("disphidden");
  setTimeout(function() {
    $(data).addClass("disphidden");
  }, 1000);
}

//알림창예제
// $("#logo").click(function(){
//   letknow("#submitting");
// })


//장바구니에서 구매 진행
function purchasesubmit(){
  if($(".cb1").is(":checked")==false){
    alert("선택된 대상이 없습니다.");
    return false;
  }
  cartfrm.method ="post";
  cartfrm.action ="purchase.do";  
  if(confirm("구매를 진행합니다")==true){
    cartfrm.submit();
  }else{return;}
}

//장바구니 삭제
function deletecartsubmit(){
  if($(".cb1").is(":checked")==false){
    alert("선택된 대상이 없습니다.");
    return false;
  }
  cartfr
  cartfrm.method ="post";
  cartfrm.action ="deletecart.do";  
  if(confirm("장바구니에서 삭제합니다")==true){
    cartfrm.submit();
  }else{return;}
}

//검색창
$("#serchinput").keyup(function(e) {
  var data =$(this).val(); 
  if (e.keyCode == 13) {
  
    open_in_frame('search.do?serchinput='+data);
  }; 

});


function gosubmit(formname){
  formname.submit();
}

//인풋태그 체크
function checkEmpty(obj){

  if(obj.value,trim()==""){
    alert(obj.name+"를 입력하세요");
    obj.focus();
    return false;
  }else{return true;}
}


//재생목록 추가
 
// $(".listaddbtn").click(function(){
//   $.ajax({
//     url : "addlist.do",
//     data:{listname : $(".addlist").val()},
//     success:function(data){
//       var html ="";
//       html += "<div class='swiper-slide'>";
//       html += "<div id='addplaylist'>";
//       html += "<form name='addplaylistfrm' action='addlist.do' method='post'>";
//       html += " <input class='addlist' name='addplaylist' type='text'/>";
//       html += "</form>";
//       html += "<img class='listaddbtn' style ='width:100px; height:100px; margin:0 auto;' src='imgs/plus.png'/>";
//       html += "<p style='text-align:center; width:auto;'>$ 재생목록 추가 $</p>";
//       html += "</div>";
//       html += "</div>";
//       html += "<c:forEach var='pla' items='${pla}'>";
//       html += "<div class='swiper-slide'><div id='thisplaylist'>";
//       html += "<c:choose>";
//       html += "<c:when test='${0 eq pal.vol}'>";
//       html += "<img src='/imgs/xxxmusic.png'/><p>${pla.name}</p>&nbsp;&nbsp;${pla.vol}</div></div>";
//       html += "</c:when>";
//       html += "<c:otherwise>";
//       html += "<img src='/cover/${pla.cover}'/><p>${pla.name}</p>&nbsp;&nbsp;${pla.vol}</div></div>";
//       html += "</c:otherwise>";
//       html += "</c:choose>";
//       html += "</c:forEach>";
//       $(".swiper-wrapper").empty();
//       $(".swiper-wrapper").append(html);
//     },error:function(){}

//   })
  
// })

//재생목록 추가
$(".listaddbtn").click(function(){
  // checkEmpty(addplaylist);
  addplaylistfrm.submit();
})
