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
    <link rel="stylesheet" href="css/email.css">
    <link rel="stylesheet" href="css/play.css">






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

  <body id="body">

<div id="alarmupload" class="disphidden">업로드중</div>
 <section id="maincontainer">
    <div id="lefter">
        <div class="logodiv"><p onclick="open_in_frame('main.do')" class="logo" style="cursor:pointer;">Earism</p></div>
        <div id="leftercontainer">
       
            <input name="serchinput" id="serchinput" type="text" placeholder="Search"/>
   
            <ul>
                <li onclick="open_in_frame('listener.do')"><i class="fas fa-headphones-alt"></i>&nbsp;&nbsp;&nbsp;<span>Listener</span></li>
                <li onclick="open_in_frame('publisher.do')"><i class="fas fa-upload"></i>&nbsp;&nbsp;&nbsp;<span>Publisher</span></li>
                <li><i class="fas fa-user-friends"></i>&nbsp;&nbsp;&nbsp;<span>Follow</span></li>
                <li onclick="open_in_frame('history.do')"><i class="fas fa-history"></i>&nbsp;&nbsp;&nbsp;<span>History</span></li>
            </ul>
        <p id="playlists">PLAY LISTS</p>
        <span>
            <button class="button">Play List</button>
            <dialog>
                <div class="dialog__inner">
                    
                    <div class="dialog__content">
                        <div id="modal_top">
                            <h3></h3>
                        </div>
                    
                        <div id="cover_pic">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div id="addplaylist">
                                            <form name="addplaylistfrm" action="addlist.do" method="post">
                                            <input class="addlist" name="addplaylist" type="text"/>
                                            </form>
                                            <img class="listaddbtn" style ="width:100px; height:100px; margin:0 auto;" src="imgs/plus.png"/>
                                            <p style="text-align:center; width:auto;">$ 재생목록 추가 $</p>
                                        </div>
                                    </div>
                                    <c:forEach var="pla" items="${pla}">
                                        <div class="swiper-slide"><div id="thisplaylist">
                                            <c:choose>
                                            <c:when test="${0 eq pal.vol}">
                                                <img src="/imgs/xxxmusic.png"/><p>${pla.name}</p>&nbsp;&nbsp;${pla.vol}</div></div>
                                            </c:when>
                                            <c:otherwise>
                                            <img src="/cover/${pla.cover}"/><p>${pla.name}</p>&nbsp;&nbsp;${pla.vol}</div></div>
                                            </c:otherwise>
                                            </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    
                
                    </div>	
                </div>
            </dialog>
        </span>
        <ul>
            <c:forEach var="pla" items="${pla}">
                <li><i class="fas fa-headphones-alt"></i>&nbsp;&nbsp;&nbsp;<span id="playlistcustom">${pla.list_name}</span</li>
            </c:forEach>
        </ul>
    </div>
</div>
<dvi id="righter">
    <div id="header">
        <!-- 멤버 아코디언 메뉴-->
        <div class="acowrapper disphidden">
            <ui class="mainMenu">
                <li class="itemaco" id="account">
                    <a href="#account" class="btnaco"><i class="fas fa-user-circle"></i>My Account</a>
                    <div class="subMenu">
                        <a href="">회원정보변경</a>
                        
                    </div>
                </li>
                <li class="itemaco" id="about">
                    <a href="#about" class="btnaco"><i class="fas fa-address-card"></i>About</a>
                    <div class="subMenu">
                        <a href="#" onclick="open_in_frame('listener.do')">구매내역</a>
                        <a href="">결제정보</a>
                        <a href="#" onclick="open_in_frame('publisher.do')">업로드내역</a>
                    </div>
                </li>
                <li class="itemaco" id="support">
                    <a href="#support" class="btnaco"><i class="fas fa-info"></i>Support</a>
                    <div class="subMenu">
                        <a href="">문의하기</a>
                    </div>
                </li>
                <li class="itemaco">
                    <a href="logout.do" class="btnaco"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                </li>
            </ui>
        </div>  
        <div class="acodim disphidden">
        </div>

        <div id="controller">
            <div class="aaa">
                <i class="fas fa-random"></i>
                <i class="fas fa-backward"></i>
                <i id="controller_itag" class="fas fa-play"></i>
                <i class="fas fa-forward"></i>
                <i class="fas fa-redo"></i>
            </div>
        </div>
        <div id="songinfo">
            <div id="song">
                <div id="songpic"><img id="covercont" src="imgs/xxxmusic.png" style="width:48px; height:48px;"></div>
                <div id="songbar">
                    <p id="songtitle"></p>
                    <p id="songsinger"></p>
                    
                    <div class="progress">
                        <div class="progress-cell">
                            <div class="progress-cell-inner">
                                <div class="progress-buffer"></div>
                                <div class="progress-indicator"></div>
                            </div>
                        </div>
                    </div> 
                    <span id="curenttime"></span>
                    <span id="duration"></span>
                </div>
            </div>
        </div>
        <div id="sound">
            <i class="fas fa-volume-up"></i>
            <div id="volumebar">
                <input type="range" id="slider" min="0" max="1" step="0.05" value="0.4" onchange="changevolume(this.value)">                
            </div>
        </div>
        <div id="member">
            <a href="#">
                <c:choose>
        <c:when test="${empty sessionScope.id}">
            <i class="fas fa-user-circle yetlogedin gray"></i>
            </c:when>
        <c:when test="${not empty sessionScope.id}">    
                <i class="fas fa-user-circle logedin"></i>
                </c:when>
            </c:choose>
            </a>
        </div>
    </div>


    <div id="frameoutter">
       <iframe id="my_frame" src="main.do" width="100%" height="100%" border="0" framespacing="0" marginheight="0" marginwidth="0" scrolling="yes"  vspace="0" ></iframe>

    </div>







</div>









   <!-- 로그인 창 -->
         <div id="login_dim" class="disphidden"></div>
        <div id="login" class="disphidden">
            <div id="loginleft" class="disphidden"></div>
            <div id="loginright" class="disphidden">
                
                <div id="loginask">
                    <span>Don't have account?</span>
                    <span class="join">Join</span>
                </div>
                <form method="post" name="loginfrm" action="login.do">
                    <div id="login_main">
                        <span></span>
                        <p id="emailicon"><i class="fas fa-at"></i></p>
                        <input name="inputid" type="text" placeholder="email@address.com">
                        
                        <p id="passwdicon"><i class="fas fa-key"></i></p>
                        <input name="pw" type="password"/>

                    </div>
                    <input id="loginbt" type="submit" value="Login">
                </form>
                    <span id="findpw">Forgot password?</span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
        </div>
        <!------  로그인끝 ------->
        <!------  회원가입 ------>
        <div id="join" class="disphidden">
            <div id="joinleft" class="sctol">
                
                <div id="joinask">
                    <span>I have account!</span>
                    <span class="login">Login</span>
                </div>
                <form method="post" name="joinfrm" action="join.do">
                    <div id="join_main">
                        <span id="idcheck"></span>
                        <p id="emailiconjoin"><i class="fas fa-at"></i></p>
                        <input name="inputidj" type="text" placeholder="email@address.com">
                        
                        <p id="nicknamejoin"><i class="fas fa-signature"></i></p>
                        <input name="nickname" type="text" placeholder="Choose your nickname">
                        
                        <p id="passwdiconjoin1"><i class="fas fa-key"></i></p>
                        <input name="pw"  class="pw" type="password">
                        
                        <span id="pwcheck"></span>
                        <p id="passwdiconjoin2"><i class="fas fa-key"></i></p>
                        <input name="pwc"  class="pwc" type="password">

                    </div>
                    <input id="joinbt" type="submit" value="Join">
                </form>
                    <span id="findpw"></span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
            <div id="joinright" class="sctor"></div>
        </div>
        <!------  회웝가입끝 ------>
        
        <!------  비밀번호찾기  ------>
        <div id="forgot" class="disphidden">
            <div id="forgotleft" class="sctou">
                
                <div id="forgotask">
                    <span>Check your email</span>
                    <span class="forgot">Login</span>
                </div>
                
                    <div id="forgot_main">
                        <span id="idcheck">가입시 입력한 이메일을 입력하세요</span>
                        <p id="emailiconforgot"><i class="fas fa-at"></i></p>
                        <input name="inputid" type="text" placeholder="email@address.com">
                        <input id="sendcode" type="submit" value="Send code">
                        <p id="codeforgot"><i class="fas fa-signature"></i></p>
                        <span id="pwcheck">메일함을 확인하세요</span>
                        <input name="code" type="text" placeholder="Enter code we've send">
                        <input id="entercode" type="submit" value="Enter code">
                    <!-- 코드 맞으면 출력 -->
                <form method="post" name="repw" action="repw.do">
                    <p id="passwdiconforgot1"><i class="fas fa-key"></i></p>
                    <span class="forgotspan" id="pwcheck">새로운 비밀번호를 입력하세요</span>
                    <input class="forgotinput" name="pwn" type="password">
                    <span class="forgotspan"  id="pwcheck">비밀번호가 일치하지 않습니다</span>
                    <p id="passwdiconforgot2"><i class="fas fa-key"></i></p>
                    <input class="forgotinput" name="pwc" type="password">
                    </div>
                    <input id="forgotbt" onclick="gosubmit('repw')" value="Submit">
                </form>
                    <span id="findpw"></span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
            <div id="forgotright" class="sctod"></div>
        </div>
        <!------  비밀번호찾기끝  ------>
 
 


 </section>

<audio id="audio" controls="controls" class="audioplayer" style="display:none;">
    <source id="mp3Source" src="null"></source>
    Your browser does not support the audio format.
</audio>







    
<script src="/js/skrollr.js"></script>
<script src="/js/share.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="js/swiper.js"></script>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/audio.js"></script>



 

<script>
</script>







  </body>
</html>

