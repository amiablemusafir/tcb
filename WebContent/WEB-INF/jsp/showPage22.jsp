<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>छठ पूजा</title>
<meta property="og:type" content="website" />
<meta property="og:title" content="छठ पूजा" />
<meta property="og:url" content="http://thecoderboy.com/greeting/greeting/22/${name}/" />
<meta property="og:description" content="CLICK HERE" /> <meta property="og:site_name" content="Create Festival Wishes" />
<meta property="og:image" content="http://thecoderboy.com/images/chaatpuja.jpg">
<meta name="image" content="http://thecoderboy.com/images/chaatpuja.jpg"/>

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
       var text = name+" के तरफ से छठ पूजा की शुभकामनाओ के लिए कृपया निचे दी गई लिंक पे क्लिक करे और पढ़े ! ";
          var url = "https://www.thecoderboy.com/greeting/22/"+name+"/";
          var message = encodeURIComponent(text) + " - " + encodeURIComponent(url);
             var whatsapp_url = "whatsapp://send?text=" + message;
             window.location.href = whatsapp_url;
         } else {
             alert("Please share this article in mobile device");
         }
  }
</script>
<style>
.main-greeting {
    max-width: 400px;
    margin: auto;
    text-align: center;
    position: relative;
    padding: 10px;
    background: rgba(255, 255, 255, 0.39);
    box-shadow: 3px 4px 41px 0 rgba(0, 0, 0, 0.64);
    margin-bottom: 60px;
}
.main-greeting2 {
    margin: auto;
    text-align: center;
    position: relative;
    padding: 5px;
    background: rgba(37, 33, 33, 0.39);
    box-shadow: 3px 4px 41px 0 rgba(241, 239, 239, 0.64);
    margin-bottom: 0px;
}
input[type=button] {
    height: 40px;
    background-color: #040e8e;
    border: 2px solid #ffffff;
    position: fixed;
    font-size: 1.5rem;
    left: 10px;
    bottom: 0px;
    left: 75%;
    margin-top: 6px;
    margin-bottom: 16px;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    z-index: 1;
}
input[type=text], select, textarea {
    height: 40px;
    width: 70%;
    text-align: center;
    font-size: 1.5rem;
    display: inline-block;
    padding: 12px;
    border: 1px solid #040e8e;
    border-radius: 4px;
    position: fixed;
    left: 10px;
    bottom: 0px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    z-index: 1;
    resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */;
}

body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
body {
    background-image: url('<%=contexpath%>/images/banana.jpg');
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
     <h1><b class="name">${name}</b></h1>    
     </div>
     </div>
     </div>
     </div>
     </section>
     
     <div align="center" style="margin: -10% 0% 0% 0%; width: 100%;">
     <h4 style="color: #ffffff;"><b><marquee scrollamount="5" width="10%">&lt;&lt;&lt;</marquee>छठ पूजा की हार्दिक शुभकामनामायें <marquee scrollamount="5" direction="right" width="10%">&gt;&gt;&gt;</marquee></b></h4>
     </div>
     
     <div class="main-greeting">
     <img alt="The Coder Boy" src="<c:url value="/images/chaatpuja.gif" />" width="100%" height="100%"><br/><br/>
     <audio controls autoplay>
  <source src="<c:url value="/images/chaatpujasong.mp3" />" type="audio/mpeg">
</audio>
</div> 
     <div class="container" style="">
     <div class="row">
     <div style="margin: 0% 10% 0% 10%; text-align: justify;">
     <div align="center">
     <p style="font-family: 'Hind', sans-serif;"><b/>${name} के तरफ से आपको और आपके समस्त परिवार को छठ पूजा की हार्दिक शुभकामनामायें <br/><br/>गेहूं का ठेकुआ, चावल के लड्डू
खीर,अन्नानास, निम्बू, और कद्दू
छठी मैया करे हर मुराद पूरी
बाटे घर घर लड्डू…
जय छठी मैया शुभ छठ पूजा</b></p>
   
     <div align="right"><h4><b>~ ${name}</b></h4></div>
   
     </div>
     </div>
     <div>  
 </div>
 </div>
  <div id="enter_name_error" style="color: red;"></div>
   <div align="left" style="width : 70%;">
   <input type="text" name="enter_name" id="enter_name" placeholder="यहाँ अपना नाम लिखे"/>
   </div>
   <div align="right" style="width : 30%;">
   <a data-link="https://www.thecoderboy.com/greeting/22/Sumit Singh" onclick="showData(this);"><input type="button" value="Send"></a>
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
     <div class="container">
     <div class="row">
     <div class="main-greeting2">
     <div style="margin: 10% 5% 0% 5%; text-align: justify;">
     <div align="left">
     <p style="font-family: 'Hind', sans-serif;">
     <h3>जानिए चार दिन के पर्व छठ में क्‍या है हर एक दिन का महत्‍व..</h3>
     <h4>
     24 अक्टूबर - नहाय खाए<br/>
     25 अक्टूबर - खरना<br/>
     26 अक्टूबर - संध्या अर्घ्य <br/>
     27 अक्टूबर - सूर्योदय अर्घ्य <br/>
     </h4>
लोक आस्था का महापर्व छठ का आरंभ 24 अक्टूबर 2017 यानि मंगलवार से शुरू हो रहा है. कार्तिक मास की शुक्ल पक्ष की चतुर्थी से सप्तमी तक चलने वाला यह चार दिन का पर्व खाए नहाय के साथ शुरू होता है. तड़के महिलाएं नदियों और तालाबों के तट पर जुट जाती हैं. इस साल छठ 24 अक्टूबर को नहाय खाए से शुरु हो रहा है. 25 अक्टूबर को खरना मनाया जाएगा. इसके बाद छठ व्रती 26 अक्टूबर को अस्ताचलगामी सूर्य को अर्घ्य देंगी और 27 नवंबर को सुबह का अर्घ्य देने के बाद अरुणोदय में सूर्य छठ व्रत का समापन किया होगा. आईए जानते हैं इस चार दिन के पर्व के हर दिन के महत्‍व के बारे में...
<br/>
<h3>पहला दिन</h3>
खाए नहाय, छठ पूजा व्रत का पहला दिन. इस दिन नहाने खाने की विधि की जाती है. इस दिन स्‍वयं और आसपास के माहौल को साफ सुथरा किया जाता है. लोग अपने घर की सफाई करते हैं और मन को तामसिक भोजन से दूर कर पूरी तरह शुद्ध शाकाहारी भोजन ही लेते हैं.
<h3>दूसरा दिन</h3>
खरना, छठ पूरा का दूसरा दिन होता है. इस दिन खरना की विधि की जाती है. खरना का मतलब है पूरे दिन का उपवास. व्रती व्‍यक्ति इस दिन जल की एक बूंद तक ग्रहण नहीं करता. शाम होने पर गन्ने का जूस या गुड़ के चावल या गुड़ की खीर का प्रसाद बना कर बांटा जाता है.
<h3>तीसरा दिन</h3>
इस दिन शाम का अर्घ्य दिया जाता है. सूर्य षष्ठी को छठ पूजा का तीसरा दिन होता है. आज पूरे दिन के उपवास के बाद शाम को डूबते सूर्य को अर्घ्य दिया जाता है. मान्‍यता के अनुसार शाम का अर्घ्य के बाद रात में छठी माता के गीत गाए जाते हैं और व्रत कथा भी सुनी जाती है.
<h3>चौथा दिन</h3>
छठ पर्व के चौथे और अंतिम दिन सुबह का अर्घ्य दिया जाता है. आज के दिन सुबह सूर्य निकलने से पहले ही घाट पर पहुंचना होता है और उगते सूर्य को अर्घ्य देना होता है. अर्घ्य देने के बाद घाट पर छठ माता से संतान-रक्षा और घर परिवार के सुख शांति का वर मांगा जाता है. इस पूजन के बाद सभी में प्रसाद बांट कर फिर व्रती खुद भी प्रसाद खाकर व्रत खोल लेते हैं...
     </b></p>
     </div>
     </div>
     <div> 
     </div> 
 </div>
 </div>

 </section>
 </div>
</div>
<br/>

<div style="background-color: #000000; width: 100%px; margin-bottom: 0px; color: #ffffff;" align="center">
     <br/>Powered by <a href="https://www.thecoderboy.com/" target="_blank"><b>The Coder Boy</b></a>
     </br>
	</br>
	</br>
	</br>
</div>

</body>
</html>
