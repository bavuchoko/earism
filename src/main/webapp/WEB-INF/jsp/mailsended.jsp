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

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     
    <link rel="stylesheet" href="css/share.css">  
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/lib.css">
    <link rel="stylesheet" href="css/listener.css">
    <link rel="stylesheet" href="css/email.css">
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

  <body style="position:fixed; top:0px;">

    <p class="emailgo">이메일이 발송되었습니다.</p>
    <p class="mailinfo boldn">가입하신 이메일로 인증메일이 발송되었습니다.</p>
     <p class="mailinfo redmail boldn"> 메일함을 확인해 주세요</p>
    <div id="img"></div>
  
   <!-- 로그인 창 -->
         <div id="login_dim" class="disphidden"></div>
        <div id="login" class="disphidden">
            <div id="loginleft" class="disphidden"></div>
            <div id="loginright" class="disphidden">
                
                <div id="loginask">
                    <span>Don't have account?</span>
                    <span class="join">Join</span>
                </div>
                <form method="post" action="login.do">
                    <div id="login_main">
                        <span>아이디는 이메일 형식이어야 합니다</span>
                        <p id="emailicon"><i class="fas fa-at"></i></p>
                        <input name="inputid" type="text" placeholder="email@address.com">
                        <p id="passwdicon"><i class="fas fa-key"></i></p>
                        <input name="inputpw" type="password">
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
                <form method="post" action="join.do">
                    <div id="join_main">
                        <span id="idcheck">아이디는 이메일 형식이어야 합니다</span>
                        <p id="emailiconjoin"><i class="fas fa-at"></i></p>
                        <input name="inputid" type="text" placeholder="email@address.com">
                        <p id="nicknamejoin"><i class="fas fa-signature"></i></p>
                        <input name="nickname" type="text" placeholder="Choose your nickname">
                        <p id="passwdiconjoin1"><i class="fas fa-key"></i></p>
                        <input name="pw" type="password">
                        <span id="pwcheck">비밀번호가 일치하지 않습니다</span>
                        <p id="passwdiconjoin2"><i class="fas fa-key"></i></p>
                        <input name="pwc" type="password">
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
                <form method="post" action="repw.do">
                    <p id="passwdiconforgot1"><i class="fas fa-key"></i></p>
                    <span class="forgotspan" id="pwcheck">새로운 비밀번호를 입력하세요</span>
                    <input class="forgotinput" name="pw" type="password">
                    <span class="forgotspan"  id="pwcheck">비밀번호가 일치하지 않습니다</span>
                    <p id="passwdiconforgot2"><i class="fas fa-key"></i></p>
                    <input class="forgotinput" name="pwc" type="password">
                    </div>
                    <input id="forgotbt" type="submit" value="Submit">
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
   


<div class="carddim disphidden"></div>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/framesize.js"></script>


 

<script>
</script>







  </body>
</html>
