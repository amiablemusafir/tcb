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

<!-- Code Starts from Here -->
<section id="contentbody">
  <div class="container">
    <div class="row">
      <div class=" col-sm-12 col-md-6 col-lg-6">
        <div class="row">
          <div class="leftbar_content">
           <h2>${pagename}</h2>
	           <div class="singlepost_area">
	              <div class="singlepost_content">
	              	  <c:if test="${articleDetailsDto.tstr_article_type == 'news'}">  
	                	<a class="stuff_category" href="<%=contextPath%>/showArticle/article.html">
	                 	Article
	                 	</a>
	                 </c:if>
	                 <c:if test="${articleDetailsDto.tstr_article_type == 'trending'}">
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/trending.html">
	                 	Trending
	                 	</a>
	                 </c:if>
	                 <c:if test="${articleDetailsDto.tstr_article_type == 'entertainment'}">
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/entertainment.html">
	                 	Entertainment
	                 	</a>
	                 </c:if>
	                 <c:if test="${articleDetailsDto.tstr_article_type == 'lifestyle'}"> 
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/lifestyle.html">
	                 	Lifestyle
	                 	</a>
	                 </c:if>
	                <span class="stuff_date">${articleDetailsDto.tdt_mmm} <strong>${articleDetailsDto.tdt_dd}</strong></span>
	                <h2><a href="#">${articleDetailsDto.tstr_headline}</a></h2>
	                <img class="img-center" src="${articleDetailsDto.tstr_image_url}" alt="" width="100%">
	                
	                <c:if test="${!empty articleContentDetailsDtoList}">  
	  				  <c:forEach items="${articleContentDetailsDtoList}" var="contentdata"> 
		             	${contentdata.tstr_content}
		              </c:forEach>
	             	</c:if>
	                
	                <br/>
	                <div class="singlepage_pagination"> <a class="previous_btn" href="<%=contextPath%>/showArticleDetails/${prev}">Previous</a> <a class="next_btn" href="<%=contextPath%>/showArticleDetails/${next}">Next</a> </div>
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
	            <div class="similar_post_area">
	              <h2>Similar Post You May Like <i class="fa fa-thumbs-o-up"></i></h2>
	              <ul class="featured_nav similarpost_nav wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
	             	<c:if test="${!empty articleDetailsDtoList}">  
  					<c:forEach items="${articleDetailsDtoList}" var="data"> 
	             	<li> <a href="<%=contextPath%>/showArticleDetails/${data.tnum_article_id}" class="featured_img"><img alt="" src="${data.tstr_image_url}"></a>
                  		<div class="featured_title"> <a href="<%=contextPath%>/showArticleDetails/${data.tnum_article_id}" class="">${data.tstr_headline}</a> </div>
                	</li>
                	</c:forEach>
                	</c:if>
                  </ul>
	            </div>
	          </div>
	        </div>
	      </div>
	     
	      <div class="col-sm-6 col-md-4 col-lg-4">
	        <div class="row">
	          <div class="rightbar_content">
	            <div class="single_blog_sidebar">
	              <h2>The Featured Stuff</h2>
	              <ul class="featured_nav">
	              	<c:if test="${!empty articleDetailsDtoArticleList}">  
	  					<c:forEach items="${articleDetailsDtoArticleList}" var="datastuff"> 
		                <li> <a class="featured_img" href="<%=contextPath%>/showArticleDetails/${datastuff.tnum_article_id}"><img src="<c:out value="${datastuff.tstr_image_url}"/>" alt=""></a>
		                  <div class="featured_title"> <a class="" href="<%=contextPath%>/showArticleDetails/${datastuff.tnum_article_id}">${datastuff.tstr_headline}</a> </div>
		                </li>
		                </c:forEach>
	                </c:if>
	              </ul>
	            </div>
	            <div class="single_blog_sidebar">
	              <h2>Popular Posts</h2>
	              <ul class="middlebar_nav wow fadeInDown">
	              <c:if test="${!empty articleDetailsDtoPopularPostList}">  
	  				<c:forEach items="${articleDetailsDtoPopularPostList}" var="datapopular"> 
	                	<li><a href="<%=contextPath%>/showArticleDetails/${datapopular.tnum_article_id}" class="mbar_thubnail"><img alt="" src="<c:out value="${datapopular.tstr_image_url}"/>"></a> <a href="<%=contextPath%>/showArticleDetails/${datapopular.tnum_article_id}" class="mbar_title">${datapopular.tstr_headline}</a> </li>
	                </c:forEach>
	              </c:if> 
	              </ul>
	            </div>
	            <div class="single_blog_sidebar">
	              <h2>Popular Tags</h2>
	              <ul class="poplr_tagnav wow fadeInDown">
	                <li><a href="#">Arts</a></li>
	                <li><a href="#">Games</a></li>
	                <li><a href="#">Nature</a></li>
	                <li><a href="#">Comedy</a></li>
	                <li><a href="#">Sports</a></li>
	                <li><a href="#">Tourism</a></li>
	                <li><a href="#">Videos</a></li>
	              </ul>
	            </div>          
          </div>
        </div>
      </div>   
      
    </div>
  </div>
</section>

<!-- Code End Here -->
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