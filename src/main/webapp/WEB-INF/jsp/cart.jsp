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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
    <link rel="stylesheet" href="css/share.css">  
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/cart.css">
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

        <div id="centercontainer">
            <div id="centertop">
                <div id="bigpic">
                    <img src="imgs/list/kpop_hits_2014/big/music.jpg">
                </div>
                <div id="introduce">
                    <p>Process Payment</p>
                    <p>결제하기</p>
                    <p><span>카트에 담겨있는 곡에 대한 결제를 진행합니다.</span></p>
                    <button class="playbt" onclick="purchasesubmit()"><i class="fas fa-credit-card"></i>&nbsp;&nbsp;결제진행</button>
                    <button class="deletebt"onclick="deletecartsubmit()"><i class="fas fa-minus-circle"></i></i>&nbsp;&nbsp;삭제</button>    
                </div>

            </div>
        </div>
                       


<!-- 곡리스트-->
        <div id="mainlist">
            <ul>
                <li class="toptitle">
                    <p><input type="checkbox" name="cb1" class="cb1" id="cball">Song</p>
                    <p>Album</p>
                    <p>time</p>
                </li>
                <form name="cartfrm">    
    <c:forEach var="voa" items="${voa}">    
                <li class="eachsong">
                    <div class="songcover">

                        <input type="checkbox" name="cb1" value="${voa.s_num}" class="cb1">
                        <a href="#"><img src="/cover/${voa.cover}"></a>
                        <div class="listsonginfo">
                            <a href="#"><p>${voa.title}</p></a>
                            <a href="#"><p>${voa.singer}</p></a>
                        </div></a>
                    </div>
                    <div class="songalbum"><a href="#">${voa.album}</a></div>
                    <div class="songtime">
                  
                        <div class='float-circle' id='dropbox'>
                            <div class='fas fa-list-ol'></div>
                        </div>
                        <div class='main-button share'>
                            <div class='fas fa-ellipsis-h'></div>
                        </div>
                        <span class="price">${voa.price}</span>
                        <span class="alignright">3 : 09</span>
                    </div>
                </li>
           </c:forEach>
               </form>


            </ul>
        
        </div>



 </section>
   
 



    
<script src="/js/skrollr.js"></script>
<script src="/js/share.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="js/swiper.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/action.js"></script>



 

<script>
</script>

  </body>
</html>
