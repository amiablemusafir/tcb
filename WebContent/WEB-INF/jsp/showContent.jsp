<%@page import="com.tcb.model.QuizDetailsDto"%>
<%@page import="com.tcb.common.Setup"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="com.tcb.common.FBConnection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<%
String contextPath = request.getContextPath(); 
FBConnection fbConnection = new FBConnection();
%>
<title>${quizDetailsDto.tstr_headline}</title>

<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/structure.css" />" rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="copyright" content="Copyright https://thecoderboy.com. All rights reserved.">
<meta name="title" content="${quizDetailsDto.tstr_headline}"/>
<meta name="description" content="${quizDetailsDto.tstr_content}"/>
<meta name="image" content="https://www.thecoderboy.com/dataimage/details${tstr_img_id}.jpg"/>
<meta content="${quizDetailsDto.tstr_headline}" property="og:title">

<meta property="og:site_name" content="TheCoderBoy"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://www.thecoderboy.com/showpagecontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/" />
<meta property="og:title" content="${quizDetailsDto.tstr_headline}" />
<meta property="og:description" content="${quizDetailsDto.tstr_content}" />
<meta property="og:image" content="https://www.thecoderboy.com/dataimage/${question}/details${tstr_img_id}${tstr_date}.jpg"/>
<meta property="og:image:type" content="image/jpg" />
<meta property="og:image:width" content="800" />
<meta property="og:image:height" content="420" />
<meta property="fb:app_id" content="322262071517889">

<style>
.main_box {
   width: 50%;
   border: 1px solid black;
} 
.main_blank {
   width: 50%;
} 
.city {
   width: 320PX;
   float: left;
   margin: 20px;
   padding: 10px;
   max-width: 500px;
   height: 300px;
   border: 1px solid black;
}   
.singlepost_content_div {
	background-color:#fff; 
	display:inline;
	float:left; 
	margin-bottom:10px;
	margin-left:55px; 
	margin-right:15px; 
	padding:20px; 
	width:90%
}
h2 {
font-size: 28px;
}


@media screen and (max-width: 480px){
	#contentbody {
	    display: inline;
	    float: left;
	    padding: 12px 0 23px;
	    width: 100%;
	}
	.city {
   	   width: 100%;
   	   margin: 0px;
   	   padding-top: 20px;
   	   margin-top: 30px;
    }
    .main_box {
   		width: 100%;
   		border: 1px solid black;
	}
	.main_blank {
   		width: 100%;
	}
    .singlepost_content_div {
		background-color:#fff; 
		display:inline;
		float:left; 
		margin-bottom:10px;
		margin-left: 5px; 
		margin-right: 5px; 
		padding:20px; 
		width:100%
	}
	h2 {
		font-size: 24px;
	}
}	

@media screen and (max-width: 320px) {
	#contentbody {
	    display: inline;
	    float: left;
	    padding: 12px 0 23px;
	    width: 100%;
	}
    .city {
       width: 100%;
       margin: 0px;
   	   padding-top: 20px;
   	   margin-top: 30px;
    }
    .main_box {
   		width: 100%;
   		border: 1px solid black;
	}
	.main_blank {
   		width: 100%;
	}
   .singlepost_content_div {
		background-color:#fff; 
		display:inline;
		float:left; 
		margin-bottom:10px;
		margin-left: 5px; 
		margin-right: 5px; 
		padding:20px; 
		width:100%
	}
	h2 {
		font-size: 18px;
	}
}
</style>
</head>

<body>
<div id="preloader">
  <div id="status">&nbsp;</div>
</div>
<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
<header id="header">
  <div class="container">
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="index.html"><span>The Coder Boy</span></a> </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav custom_nav">
            <li class=""><a href="<%=contextPath%>/index/home/1">Home</a></li>
            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">About</a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=contextPath%>/termofservice.html">Term of Service</a></li>
                <li><a href="<%=contextPath%>/privecypolicy.html">Privacy Policy</a></li>
                <li><a href="<%=contextPath%>/contactus.html">Contact Us</a></li>
              </ul>
            </li>
            <li><a href="<%=contextPath%>/showArticle/article/1">Article</a></li>
            <li><a href="<%=contextPath%>/quiz/1">Quiz</a></li>
            <li><a href="<%=contextPath%>/showArticle/trending/1">Trending</a></li>
            <li><a href="<%=contextPath%>/showArticle/entertainment/1">Entertainment</a></li>
           	<li><a href="<%=contextPath%>/showArticle/lifestyle/1">Life Style</a></li>
            <!-- 
            <li><a href="#">Download Template</a></li>
            -->
          </ul>
        </div>
      </div>
    </nav>
   <%--  
   <form id="searchForm">
      <input type="text" placeholder="Search...">
      <input type="submit" value="">
    </form> 
   --%>
  </div>
</header>
<section id="contentbody">
  <div class="container">
    <div class="row">
    <div class="singlepost_content_div">
    	<div style="width: 100%;" align="center">
    	<div class="main_blank" style="background-color: yellow;">
    	<h2 style="background-color: yellow;">${quizDetailsDto.tstr_headline}</h2>
    	</div>
    	<%QuizDetailsDto quizDetailsDto = (QuizDetailsDto) request.getSession().getAttribute("quizDetailsDto"); %>
    	<a href="<%=fbConnection.getFBAuthUrl(quizDetailsDto.getTnum_id())%>">
    	<div class="main_box">
    		<img alt="" src="<c:out value="${quizDetailsDto.tstr_image_url}"/>" style="width: 98%;">
    	</div> 
    	</a>
    	<div class="main_blank" style="background-color: aqua;">
    	<p>${quizDetailsDto.tstr_content}</p>  
    	</div>
    	
    	
    	<div class="main_blank">
    	<br/>
    	<p>Please login with Facebook to see your result</p> 
    	<a href="<%=fbConnection.getFBAuthUrl(quizDetailsDto.getTnum_id())%>"><img alt="" src="<%=contextPath%>/images/fb_btn.png" width="100%" height="100%"></a> 	
		</div>
		
		<br/>
		<a href="<%=contextPath%>/index/1" class="btn blue_btn"><b style="font-size: 18px;">Home</b></a>
		<a href="<%=contextPath%>/index/1" class="btn btn-success"><b style="font-size: 18px;">Try Another&nbsp;<img src="<c:url value="/images/reload.png" />"/></b></a>

		</div>    
    	<br/>
		<br/>
		<div style="width: 100%;">
	    <c:if test="${!empty list}">  
  			<c:forEach items="${list}" var="data"> 
  				<a href="<%=contextPath%>/showpagecontent/the_coder_boy/${data.tnum_id}/234567/23021988/">
  				<div class="city">
  				 	<img alt="" src="<c:out value="${data.tstr_image_url}"/>" style="width: 100%; height: 70%;">
		  			<h4><c:out value="${data.tstr_headline}"/></h4>     			   
    				<P><c:out value="${data.tstr_content}"/></P>  
    			</div>
    			</a>
   			</c:forEach>  
 		</c:if>
 		</div> 
 		<br/>
 		<br/>
 	</div>
    <div class="social_area wow fadeInLeft">
    	<ul>
            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
            <li><a href="#"><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#"><span class="fa fa-pinterest"></span></a></li>
        </ul>
    </div>  
 
   </div>
    <p align="center">The result of this page are only as a form of entertainment and should not be taken as serious results. The calculations are based on the interactions of people in your wall as likes and post.<br/>
 		We never store any sensitive or private user information such a Password, Private Message, Comments, Likes etc.</p> 
      
      
    
   </div>
</section>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="footer_inner">
          <p class="pull-left">Copyright &copy; 2017 TCB</p>
          <p class="pull-right">Developed By : The Coder Boy</p>
        </div>
      </div>
    </div>
  </div>
</footer>
<script src="<c:url value="/assets/js/jquery.min.js" />"></script> 
<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script> 
<script src="<c:url value="/assets/js/wow.min.js" />"></script> 
<script src="<c:url value="/assets/js/custom.js" />"></script>
</body>
</html>