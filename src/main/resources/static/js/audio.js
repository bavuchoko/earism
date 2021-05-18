

// 리스트 클릭시 오디오 재생
// function change_music(music,cover, title, singer){

//         // var data =decodeURI(music);
//         // alert(data);
//         // document.getElementById("audio").pause();
//         document.getElementById("mp3Source").setAttribute('src', "/music/"+music);
//         document.getElementById("audio").load();
//         document.getElementById("audio").play();
//         document.getElementById("covercont").setAttribute('src', "/cover/"+cover);
//         $("#songtitle").empty();
//         $("#songtitle").append(title);
//         $("#songsinger").empty();
//         $("#songsinger").append(singer);
//         $("#controller_itag").removeClass("fa-play");
//         $("#controller_itag").addClass("fa-pause");

// }




var playlist=[]
var list_size =0;
var nowplaying =0;
window.onload =function buakak(){
  
  playlist =document.getElementById("my_frame").contentWindow.addPlayList();
  titles =document.getElementById("my_frame").contentWindow.addTitles();
  covers =document.getElementById("my_frame").contentWindow.addCovers();
  singers =document.getElementById("my_frame").contentWindow.addSingers();
  list_size=playlist.length;
  
    document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[0]);
    document.getElementById("covercont").setAttribute('src', "/cover/"+covers[0]);
    $("#songtitle").empty();
    $("#songtitle").append(titles[0]);
    $("#songsinger").empty();
    $("#songsinger").append(singers[0]);
    document.getElementById("audio").load();



  $(".fa-forward").click(function(){
    nowplaying = parseInt(nowplaying);
    if(nowplaying<list_size-1){
      document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[nowplaying+1]);
      document.getElementById("covercont").setAttribute('src', "/cover/"+covers[nowplaying+1]);
      $("#songtitle").empty();
      $("#songtitle").append(titles[nowplaying+1]);
      $("#songsinger").empty();
      $("#songsinger").append(singers[nowplaying+1]);
      nowplaying= nowplaying+1;
      // alert(nowplaying);
      document.getElementById("audio").load();
      document.getElementById("audio").play();
      $("#controller_itag").removeClass("fa-play");
      $("#controller_itag").addClass("fa-pause");
    }else{
      document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[0]);
      document.getElementById("covercont").setAttribute('src', "/cover/"+covers[0]);
      $("#songtitle").empty();
      $("#songtitle").append(titles[0]);
      $("#songsinger").empty();
      $("#songsinger").append(singers[0]);
      nowplaying= 0;
      // alert(nowplaying);
      document.getElementById("audio").load();
      document.getElementById("audio").play();
      $("#controller_itag").removeClass("fa-play");
      $("#controller_itag").addClass("fa-pause");      
    }
  })


  $(".fa-backward").click(function(){
    nowplaying = parseInt(nowplaying);
    if(nowplaying==0){
      document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[list_size-1]);
      document.getElementById("covercont").setAttribute('src', "/cover/"+covers[list_size-1]);
      $("#songtitle").empty();
      $("#songtitle").append(titles[list_size-1]);
      $("#songsinger").empty();
      $("#songsinger").append(singers[list_size-1]);
      nowplaying= list_size-1;
      // alert(nowplaying);
      document.getElementById("audio").load();
      document.getElementById("audio").play();
      $("#controller_itag").removeClass("fa-play");
      $("#controller_itag").addClass("fa-pause");
    }else{
      document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[nowplaying-1]);
      document.getElementById("covercont").setAttribute('src', "/cover/"+covers[nowplaying-1]);
      $("#songtitle").empty();
      $("#songtitle").append(titles[nowplaying-1]);
      $("#songsinger").empty();
      $("#songsinger").append(singers[nowplaying-1]);
      nowplaying= nowplaying-1;
      // alert(nowplaying);
      document.getElementById("audio").load();
      document.getElementById("audio").play();
      $("#controller_itag").removeClass("fa-play");
      $("#controller_itag").addClass("fa-pause");
    }

  })
}
function getcount(data){
  nowplaying = parseInt(nowplaying);
  nowplaying =data;
  // alert(nowplaying);
  document.getElementById("mp3Source").setAttribute('src', "/music/"+playlist[nowplaying]);
    document.getElementById("covercont").setAttribute('src', "/cover/"+covers[nowplaying]);
    $("#songtitle").empty();
    $("#songtitle").append(titles[nowplaying]);
    $("#songsinger").empty();
    $("#songsinger").append(singers[nowplaying]);
    document.getElementById("audio").load();
    document.getElementById("audio").play();
    $("#controller_itag").removeClass("fa-play");
    $("#controller_itag").addClass("fa-pause");
}



//재생 일시정지 전환
$("#controller_itag").on('click',function(){
  playOrPause();
})


function playOrPause(){
  if($("#controller_itag").hasClass("fa-play")){
        document.getElementById("audio").play();
        $("#controller_itag").removeClass("fa-play");
        $("#controller_itag").addClass("fa-pause");
      }else if($("#controller_itag").hasClass("fa-pause")){
        $("#controller_itag").removeClass("fa-pause");
        $("#controller_itag").addClass("fa-play");
        document.getElementById("audio").pause();
      }
}

function aa(){
  alert("aa");
}
//오디오 볼륨
function changevolume(amount) {
    var audioobject = document.getElementsByTagName("audio")[0];
    audioobject.volume = amount;
  }

//오디오 진행바

$(
    function(){
        var aud =$('audio')[0];
        aud.ontimeupdate =function(){
            $(".progress").css("width", aud.currentTime/ aud.duration * 90 +"%")
            var ct =aud.currentTime.toFixed(0);
            var dr =aud.duration.toFixed(0);
            var ctminutes = "0" + Math.floor(ct / 60);
            var ctseconds = "0" + Math.floor(ct % 60);
            var drminutes = "0" + Math.floor(dr / 60);
            var drseconds = "0" + Math.floor(dr % 60);
            var cttime = ctminutes.substr(-2) + ":" + ctseconds.substr(-2);
            var drtime = drminutes.substr(-2) + ":" + drseconds.substr(-2);
            
            $("#curenttime").text(cttime+ " / ");
            $("#duration").text(drtime);
        }
    },

)

//플레이 리스트 옆 세팅아이콘
const modal = document.querySelector('dialog');
const btn = document.querySelector('button');
const btnClose = document.querySelectorAll('.close');

btn.addEventListener('click', () => openModal());
btnClose.forEach((elm) => elm.addEventListener('click', () => closeModal()));
modal.addEventListener('click', (e) => detectBackdropClick(e));

openModal = () => {
	modal.showModal();
}

closeModal = () => {
	modal.classList.add("dialog__animate-out");
	modal.addEventListener('animationend', handleClose, false);
}

handleClose = () => {
	modal.classList.remove("dialog__animate-out");
	modal.removeEventListener('animationend', handleClose, false);
	modal.close();
}

detectBackdropClick = (event) => {
	if(event.target === modal) {
		closeModal();
	}
}

var swiper = new Swiper('.swiper-container', {
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});



