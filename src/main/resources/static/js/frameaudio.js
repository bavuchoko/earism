

var rowlist =document.getElementById('playlist').getElementsByClassName('playsong');
//플레이 리스트
function addPlayList(){
    var playlist =[];
    for(var i=0; i <rowlist.length; i++){
        playlist.push(rowlist[i].name);
    }
    return playlist;
}
//타이틀 리스트
function addTitles(){
    var titles=[];
    for(var i=0; i <rowlist.length; i++){
        titles.push(rowlist[i].title);
    }
    return titles;
}
//플레이 리스트
function addCovers(){
    var covers=[];
    for(var i=0; i <rowlist.length; i++){
        covers.push(rowlist[i].dataset.cover);
    }
    return covers;
}
//플레이 리스트
function addSingers(){
    var singers=[];
    for(var i=0; i <rowlist.length; i++){
        singers.push(rowlist[i].dataset.singer);
    }
    return singers;
}

function giveCount(data){
    parent.getcount(data);

}

//iframe 내부 play 버튼
// $(".playbt").click(function(){
//     aa();
// })