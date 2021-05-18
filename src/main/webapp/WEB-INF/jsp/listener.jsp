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
    <link rel="stylesheet" href="css/lib.css">
    <link rel="stylesheet" href="css/listener.css">
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
 
        <div id="myinfo">
            <a href="#"><div id="mypic">
                <img src="imgs/albums/4.jpg">
            </div></a>
            <div id="maininfo">
                <c:choose>
                    <c:when test="${'y' eq sessionScope.auth}">
                <p class="email">${sessionScope.id} &nbsp;<i class="fas fa-check-circle" style="color:green;"></i></p>
                    </c:when>
                    <c:when test="${'n' eq sessionScope.auth}"> 
                <p class="email">${sessionScope.id}  &nbsp;<a href="#" onclick="parent.open_in_frame('emailauth.do')"><i class="fas fa-question-circle" style="color:red;"></i></a></p>
                    </c:when>
                    <c:when test="${empty sessionScope.id}">  
                <p class="email">Need Login &nbsp;<i class="fas fa-question-circle" style="color:red;"></i></p>
                    </c:when>
                </c:choose>
                <p class="repw"><a href="#">Change Password &nbsp;<i class="fas fa-unlock-alt" style="color:gray;"></i></a></p>
                <p class="name"><a href="#">${vo.getNickname()} &nbsp; <i class="fas fa-signature" style="color:gray;"></i></a></p>
                <p>${vo.getJoin_date()}</p>
            </div>
            <div id="subinfo">
                <c:choose>
                    <c:when test="${'미등록' eq vo.getCredit1()}">
                        <p class="creditregist"><i class="far fa-credit-card needadd"></i> Add</p>
                    </c:when>
                    <c:otherwise>
                        <p class="credit"><i class="fab fa-cc-visa"></i>${vo.getCredit1()}</p>
                    </c:otherwise>
                </c:choose>                <c:choose>
                    <c:when test="${'미등록' eq vo.getCredit2()}">
                        <p class="creditregist"><i class="far fa-credit-card needadd"></i> Add</p>
                    </c:when>
                    <c:otherwise>
                        <p class="credit"><i class="fab fa-cc-visa"></i>${vo.getCredit2()}</p>
                    </c:otherwise>
                </c:choose>                <c:choose>
                    <c:when test="${'미등록' eq vo.getCredit3()}">
                        <p class="creditregist"><i class="far fa-credit-card needadd"></i> Add</p>
                    </c:when>
                    <c:otherwise>
                        <p class="credit"><i class="fab fa-cc-visa"></i>${vo.getCredit3()}</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>


        <div id="artists">
            <p>추천 아티스트</p>
            <div id="artistlist">
                <ul>
                  <c:forEach var="artist" items="${artist}">   
                        <li><img src="/cover/${artist.cover}"><p>${artist.singer}</p></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    
<!-- 곡리스트-->
        <p class="purchased">재생리스트</p>
        <div id="mainlist">
            <ul>
                <li class="toptitle">
                    <p>Song</p>
                    <p>Album</p>
                    <p>time</p>
                </li>
       <c:forEach var="voa" items="${voa}">         
                <li class="eachsong">
                    <div class="songcover">

                        <a href="#"><img src="/cover/${voa.cover}"></a>
                        <div class="listsonginfo">
                           <a href="#" class="playsong" name="${voa.save_name}" data-cover="${voa.cover}" data-singer="${voa.singer}" title="${voa.title}"><p>${voa.title}</p></a>
                            <a href="#"><p>${voa.singer}</p></a>
                        </div></a>
                    </div>
                    <div class="songalbum"><a href="#">${voa.album}</a></div>
                    <div class="songtime">

                  
                        <div class='float-circle' id='dropbox'>
                            <div class='fas fa-list-ol'  id="${voa.s_num}"></div>
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

  
 <!--   신용카드 입력    -->
 <div class="checkout disphidden">
  <div class="credit-card-box">
    <div class="flip">
      <div class="front">
        <div class="chip"></div>
        <div class="logo">
          <svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834" style="enable-background:new 0 0 47.834 47.834;">
            <g>
              <g>
                <path d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z"/>
              </g>
            </g>
          </svg>
        </div>
        <div class="number"></div>
        <div class="card-holder">
          <label>Card holder</label>
          <div></div>
        </div>
        <div class="card-expiration-date">
          <label>Expires</label>
          <div></div>
        </div>
      </div>
      <div class="back">
        <div class="strip"></div>
        <div class="logo">
          <svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834" style="enable-background:new 0 0 47.834 47.834;">
            <g>
              <g>
                <path d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z"/>
              </g>
            </g>
          </svg>

        </div>
        <div class="ccv">
          <label>CCV</label>
          <div></div>
        </div>
      </div>
    </div>
  </div>
  <form class="form" autocomplete="off" novalidate  name="creditfrm">
    <fieldset>
      <label for="card-number">Card Number</label>
      <input type="num" name="cardnum1" id="card-number" class="input-cart-number" maxlength="4" />
      <input type="num" name="cardnum2" id="card-number-1" class="input-cart-number" maxlength="4" />
      <input type="num" name="cardnum3" id="card-number-2" class="input-cart-number" maxlength="4" />
      <input type="num" name="cardnum4" id="card-number-3" class="input-cart-number" maxlength="4" />
    </fieldset>
    <fieldset>
      <label for="card-holder">Card holder</label>
      <input type="text" name="cardholder" id="card-holder" />
    </fieldset>
    <fieldset class="fieldset-expiration">
      <label for="card-expiration-month">Expiration date</label>
      <div class="select">
        <select id="card-expiration-month" name="expiredat">
          <option></option>
          <option>01</option>
          <option>02</option>
          <option>03</option>
          <option>04</option>
          <option>05</option>
          <option>06</option>
          <option>07</option>
          <option>08</option>
          <option>09</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
        </select>
      </div>
      <div class="select">
        <select id="card-expiration-year" name="expireyear">
          <option></option>
          <option>2021</option>
          <option>2022</option>
          <option>2023</option>
          <option>2024</option>
          <option>2025</option>
          <option>2026</option>
          <option>2027</option>
          <option>2028</option>
          <option>2029</option>
          <option>2030</option>
          <option>2031</option>
        </select>
      </div>
    </fieldset>
    <fieldset class="fieldset-ccv">
      <label for="card-ccv">CCV</label>
      <input type="text" name="cardcvc" id="card-ccv" maxlength="3" />
    </fieldset>
    <button class="btncard" onclick="sendfrm()"><i class="fa fa-lock"></i> submit</button>
  </form>
</div>
   <div class="carddim disphidden"></div>


<script src="/js/skrollr.js"></script>
<script src="/js/share.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="js/swiper.js"></script>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/frameaudio.js"></script>


 










  </body>
</html>
