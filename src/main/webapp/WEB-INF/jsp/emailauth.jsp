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


    <a href="sendmail.do"><p class="emailgo redmail">이메일 인증하기.</p></a>
    <p class="mailinfo"> <i class="fas fa-arrow-up"></i>&nbsp;클릭해서 인증하세요.</p>
    <p class="mailinfo boldn">Earism의 기본적인 이용에는 이메일 인증 필요하지 않습니다.</p>
    <p class="mailinfo boldn">이메일 인증 후에는 퍼블리셔로서 활동할 수 있습니다.</p>
    <p class="mailinfo boldn">더욱 창의적인 활동을 위해 이메일 인증을 진행해 주세요</p>
    <div id="img"></div>
  

 </section>
   


<div class="carddim disphidden"></div>
    

<script src="/js/share.js"></script>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>
<script src="/js/framesize.js"></script>


 

<script>
</script>







  </body>
</html>
