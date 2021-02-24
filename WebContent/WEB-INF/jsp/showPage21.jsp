<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Happy Deepawali</title>
<meta property="og:type" content="website" />
<meta property="og:title" content="Happy Deepawali" />
<meta property="og:url" content="http://thecoderboy.com/greeting/greeting/21/${name}/" />
<meta property="og:description" content="CLICK HERE" /> <meta property="og:site_name" content="Create Festival Wishes" />
<meta property="og:image" content="http://thecoderboy.com/images/diwali.jpg">
<%
String contexpath = request.getContextPath();
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/assets/css/w3.css" />"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link href="fonts.googleapis.com/css?family=Hind" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script type="text/javascript"> 
  function showData(name) {
       var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
   };
      $("#enter_name_error").html("");
      if( isMobile.any() ) {
          var name = $("#enter_name").val();
          if(name == "") {
           $("#enter_name_error").html("Please enter your name");
           return false;
          } else {
           name = name.replace(/ /g, '-');
          }
       var text = "आपका दीपावली सन्देश आपका इंतज़ार कर रहा है ! कृपया निचे दी गई लिंक पे क्लिक करे और पढ़े ! "+name;
          var url = "https://www.thecoderboy.com/greeting/21/"+name+"/";
          var message = encodeURIComponent(text) + " - " + encodeURIComponent(url);
             var whatsapp_url = "whatsapp://send?text=" + message;
             window.location.href = whatsapp_url;
         } else {
             alert("Please share this article in mobile device");
         }
  }
</script>
<style>
input[type=button] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=text], select, textarea {
    width: 80%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */;
}

body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
body {
    background-image: url('<%=contexpath%>/images/grass_bg.jpg');
    background-repeat: repeat;
}
.bgimg {
    min-height: 100%;
    background-position: center;
    background-size: cover;
}

@media screen and (max-width: 480px){
 #contentbody {
     display: inline;
     float: left;
     padding: 0px 0 23px;
     width: 100%;
 }
 
} 

@media screen and (max-width: 320px) {
 #contentbody {
     display: inline;
     float: left;
     padding: 0px 0 23px;
     width: 100%;
 }
   
}

.container {
 padding-right: 10px;
 padding-left: 10px;
 margin-right: auto;
 margin-left: auto;
}

@media ( min-width :768px) {
 .container {
  width: 750px
 }
}

@media ( min-width :992px) {
 .container {
  width: 970px
 }
}

@media ( min-width :1200px) {
 .container {
  width: 1260px
 }
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}
.name {
    color: #ffffff;
    position: relative;
    -webkit-animation: myfirst 2s linear 2s infinite alternate; /* Safari 4.0 - 8.0 */
    animation: myfirst 2s linear 2s infinite alternate;
}

/* Safari 4.0 - 8.0 */
@-webkit-keyframes myfirst {
    0%   {color:red;}
    25%  {color:yellow;}
    50%  {color:while;}
    75%  {color:cyan;}
    100% {color:red;}
}

/* Standard syntax */
@keyframes myfirst {
    0%   {color:white;}
    25%  {color:yellow;}
    50%  {color:red;}
    75%  {color:Yellow;}
    100% {color:red;}
}
</style>
<body>


     <div style="width: 100%;">
<table width="100%">
<tr>
<td width="35%" align="left"><img alt="The Coder Boy" src="<c:url value="/images/subh.png" />"></td>
<td width="30%" align="center"><img alt="The Coder Boy" src="<c:url value="/images/swastik.jpg" />"></td>
<td width="35%" align="right"><img alt="The Coder Boy" src="<c:url value="/images/labh.png" />"></td>
</tr>
</table>
</div>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  

  <section id="contentbody">
	
   	 <div class="container">
     <div class="row">
     <div style="margin: 0% 10% 0% 10%; text-align: justify;">

     <div align="center">
     <br/>
     <br/>
     <h1><b class="name">${name}</b></h1>    
     </div>
     </div>
     </div>
     </div>
     </section>
     <div align="center" style="margin: -10% 0% 0% 5%;">
     <h4 style="color: #ffffff;"><b>Wishing you Happy Diwali</b></h4>
     </div>
     <img alt="The Coder Boy" src="<c:url value="/images/mydiwali.gif" />" width="100%" height="100%">
 
     <div class="container" style="">
     <div class="row">
     <div style="margin: 0% 10% 0% 10%; text-align: justify;">
     <div align="center">
     <br/>
     <p style="font-family: 'Hind', sans-serif;"><b/>${name} के तरफ से आपको और आपके समस्त परिवार को दिवाली की हार्दिक शुभकामनामायें <br/><br/>दीपक का प्रकाश हर पल आपके जीवन में नई रोशनी लाएए बस यही शुभकामना है आपके लिए इस दीपावली में। शुभ दीपावली!</b></p>
   
     <div align="right"><h4><b>~ ${name}</b></h4></div>
   
     </div>
     </div>
     <div align="center">
   <div id="enter_name_error" style="color: red;"></div>
   <input type="text" name="enter_name" id="enter_name" placeholder="Enter your Name Here"/>
   <a data-link="https://www.thecoderboy.com/showPage/Sumit Singh" onclick="showData(this);"><input type="button" value="Share on Whatsup"></a>
  </div>
   </div>
   <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
   <!-- Greeting Page Add -->
   <ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-9742086481369813"
     data-ad-slot="2411931887"
     data-ad-format="auto"></ins>
   <script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
 </section>
 </div>
</div>
<br/>

<div style="background-color: #000000; width: 100%px; height: 50px; margin-bottom: 0px; color: #ffffff;" align="center">
     <br/>Powered by <a href="https://www.thecoderboy.com/" target="_blank"><b>The Coder Boy</b></a>
</div>

</body>
</html>
