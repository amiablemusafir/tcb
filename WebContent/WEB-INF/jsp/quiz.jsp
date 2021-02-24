<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>The Coder Boy</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/structure.css" />" rel="stylesheet">
<meta name="keywords" content="The Coder Boy,Fb Fun Apps, Destiny, Love, LIC, New Bollywood Movies, Kiss, Future, Relationship, Friends, Fun, Fact, Insurance, Sip, Investment, Quality, Solumate, Jeevansathi, God,Message, Hidden, Talent, Millionaire, kathimithi, jambulimudi, How Many Beer You Can Drink?">

<!--[if lt IE 9]>
<script src="../assets/js/html5shiv.min.js"></script>
<script src="../assets/js/respond.min.js"></script>
<![endif]-->
<style>
.city {
   width: 500PX;
   float: left;
   margin: 20px;
   padding: 10px;
   max-width: 500px;
   height: 300px;
   border: 1px solid black;
       margin-top: 30px;
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


@media screen and (max-width: 480px){
	.city {
   	   width: 100%;
   	   margin: 0px;
   	   padding-top: 20px;
   	   margin-top: 30px;
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
}	

@media screen and (max-width: 320px) {
    .city {
       width: 100%;
       margin: 0px;
   	   padding-top: 20px;
   	   margin-top: 30px;
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
}
</style>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-9742086481369813",
    enable_page_level_ads: true
  });
</script>
</head>
<%
String contextPath = request.getContextPath(); 
%>
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
    <form id="searchForm">
      <input type="text" placeholder="Search...">
      <input type="submit" value="">
    </form>
  </div>
</header>
<section id="contentbody">
  <div class="container">
    <div class="row">
    <div class="singlepost_content_div">
    <p align="center" style="font-weight: bold;">Page No - ${page_no}</p>
    <div class="singlepage_pagination">
    <c:choose>
    	<c:when test="${prev=='0'}"></c:when>    
    	<c:otherwise>
        	<a class="previous_btn" href="<%=contextPath%>/prev/${prev}">Previous</a> 
    	</c:otherwise>
	</c:choose>
	<c:choose>
    	<c:when test="${next=='0'}"></c:when>    
    	<c:otherwise>
        	<a class="next_btn" href="<%=contextPath%>/next/${next}">Next</a> 
    	</c:otherwise>
	</c:choose>
    </div>
		<div style="width: 100%;">
		<c:if test="${!empty list}">  
  			<c:forEach items="${list}" var="data"> 
  				<a href="<%=contextPath%>/showpagecontent/the_coder_boy/${data.tnum_id}/234567/23021988/">
  				<div class="city">
  				 	<img alt="" src="<c:out value="${data.tstr_image_url}"/>" style="width: 100%; height: 70%;">
		  			<h4><b><c:out value="${data.tstr_headline}"/></b></h4>     			   
    				<P><c:out value="${data.tstr_content}"/></P>  
    			</div>
    			</a>
   			</c:forEach>  
 		</c:if>
 		</div> 
 		<br/>
 		<br/>
 	    <div class="singlepage_pagination">
	    <c:choose>
	    	<c:when test="${prev=='0'}"></c:when>    
	    	<c:otherwise>
	        	<a class="previous_btn" href="<%=contextPath%>/prev/${prev}">Previous</a> 
	    	</c:otherwise>
		</c:choose>
		<c:choose>
	    	<c:when test="${next=='0'}"></c:when>    
	    	<c:otherwise>
	        	<a class="next_btn" href="<%=contextPath%>/next/${next}">Next</a> 
	    	</c:otherwise>
		</c:choose>
	    </div>
    <p align="center" style="font-weight: bold;">Page No - ${page_no}</p>
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