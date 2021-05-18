      
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
var id = '<%=(String)session.getAttribute("id")%>';

var message ='<%= (String)session.getAttribute("message")%>';
if(message!=null && message!="null"){
    alert(message);}
<%session.removeAttribute("message");%>
</script>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel="stylesheet" href="css/share.css">  
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/play.css">
    <link rel="stylesheet" href="css/lib.css">
    <style>
     @font-face {
    font-family: noto-mid;
    src: url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:wght@100;300;400&display=swap');
     }
    @font-face {
    font-family: roboto;
    src: url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400&display=swap');
    }
    body, html{font-family:noto-mid}
    </style>
    <title>Listen, create, share Earism</title>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    

  </head>

  <body> 
       <div id="alarmsend" class="disphidden">등록중</div>
       <div id="alarmsendone" class="disphidden">본인이 업로드한 곡은 담을 수 없습니다.</div>
       <div id="alarmsendtwo" class="disphidden">이미 구매하신 곡입니다.</div>
       <div id="alarmsendthree" class="disphidden">이미 등록된 곡입니다.</div>
        <div id="centercontainer">
            <div id="centertop">
                <div id="bigpic">
                    <img src="imgs/list/kpop_hits_2014/big/1.jpg">
                </div>
                <div id="introduce">
                    <p>K-Pop Hits 2014</p>
                    <p>Earism Music K-Pop</p>
                    <p><span>Editors' Notes</span>&nbsp;&nbsp;<span>2014년 한해동안 차트를 달궜던 상위 50곡 선정</span></p>
                    <button class="playbt" onclick="parent.playOrPause()"><i class="fas fa-play"></i>&nbsp;&nbsp;play</button>
                    <button class="shufflebt"><i class="fas fa-random"></i>&nbsp;&nbsp;Shuffle</button>
                </div>
                <div id="operation">
                <button onclick="location.href ='cart.do'" class="cartmusi"><i class="fas fa-cart-arrow-down"></i>&nbsp;Cart</button>
                
            

                </div>
            </div>
        </div>

<!-- 곡리스트-->
        <div id="mainlist">
            <ul>
                <li class="toptitle">
                    <p>Song</p>
                    <p>Album</p>
                    <p>time</p>
                </li>
    
                <ul id="playlist">
                <c:forEach var="voa" items="${voa}" varStatus="ct">

            
            
                    <li class="eachsong">
                        <div class="songcover">

                            <a href="#"><img src="/cover/${voa.cover}"></a>
                            <div class="listsonginfo">
                                <a href="#" class="playsong" name="${voa.save_name}" data-cover="${voa.cover}" data-singer="${voa.singer}" title="${voa.title}">
                                    <p id="clicksong" onclick="giveCount(this.dataset.count);" data-count="${ct.index}">${voa.title}</p>
                                </a>
                                <%-- onclick="parent.change_music('${voa.save_name}','${voa.cover}','${voa.title}','${voa.singer}')"; --%>
                                <a href="#"  ><p>${voa.singer}</p></a>
                            </div></a>
                        </div>
                        <div class="songalbum"><a href="#">${voa.album}</a></div>
                        <div class="songtime">
                                <div class='float-circle' id='flickr'>
                            <%-- <c:choose>
                            <c:when test="${not empty sessoinScope.id}"> --%>
                                    <div class='fas fa-cart-plus' id="${voa.s_num}"></div>
                            <%-- </c:when>
                            </c:choose> --%>
                            
                                </div>
                            <div class='main-button share'>
                                <div class='fas fa-ellipsis-h'></div>
                            </div>
                            <span class="price">${voa.price}</span>
                            <span class="alignright">3 : 09</span>
                        </div>
                    </li>
           
                </c:forEach>
                </ul>
            </ul>
        





 
        </div>

<div class="carddim disphidden"></div>
    
<script src="/js/skrollr.js"></script>
<script src="/js/share.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="js/swiper.js"></script>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/frameaudio.js"></script>


