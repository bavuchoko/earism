
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
    <link rel="stylesheet" href="css/search.css">
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

    
        <div id="albums">
            <p>Albums</p>
            <div id="albumlist">
                <ul>
                    <c:forEach var="votitle" items="${votitle}">

                        <li><img src="/cover/${votitle.cover}"><p>${votitle.album}</p></li>
    
                    </c:forEach>   
                </ul>
            </div>
    
        </div>
        <div id="artists">
            <p>Artists</p>
            <div id="artistlist">
                <ul>
                    <c:forEach var="vosinger" items="${vosinger}">

                        <li><img src="/cover/${vosinger.cover}"><p>${vosinger.singer}</p></li>
                    
                    </c:forEach>
                </ul>
            </div>
        </div>
    

<!-- 곡리스트에 화살표 클릭시 추가메뉴 -->
        <div id="mainlist">
            <p>Songs</p>
            <ul>
                <li class="toptitle">
                    <p>Song</p>
                    <p>Album</p>
                    <p>time</p>
                </li>
            
      
    <c:forEach var="votitle" items="${votitle}">


            
                <li class="eachsong">
                    <div class="songcover">

                        <a href="#"><img src="/cover/${votitle.cover}"></a>
                        <div class="listsonginfo">
                           <a href="#" class="playsong" name="${voa.save_name}" data-cover="${voa.cover}" data-singer="${voa.singer}" title="${voa.title}"><p>${voa.title}</p></a>
                            <a href="#"><p>${votitle.singer}</p></a>
                        </div></a>
                    </div>
                    <div class="songalbum"><a href="#">${votitle.album}</a></div>
                    <div class="songtime">
                        <div class='float-circle' id='flickr'>
                            <div class='fas fa-cart-plus' id="${votitle.s_num}"></div>
                        </div>
                  
                        <div class='main-button share'>
                            <div class='fas fa-ellipsis-h'></div>
                        </div>
                        <span class="alignright">3 : 09</span>
                    </div>
                </li>
           
    </c:forEach>

            </ul>
        
        </div>


    <div id="setplaylist">
        <div id="plhead"></div>
        <div id="plbody"></div>
    </div>

 </section>
   
  



    
<script src="/js/skrollr.js"></script>
<script src="/js/share.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="js/swiper.js"></script>
<script src="js/lib.js"></script>
<script src="js/action.js"></script>
<script src="/js/framesize.js"></script>
<script src="/js/frameaudio.js"></script>
    <script>
    var swiper = new Swiper('.swiper-container2', {
      slidesPerView: 3,
      spaceBetween: 30,
      pagination: {
        
        clickable: true,
      },
    });
  </script>     


<script>
</script>

  </body>
</html>
