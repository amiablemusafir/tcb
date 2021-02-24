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
            <c:if test="${!empty articleDetailsDtoList}">  
  			<c:forEach items="${articleDetailsDtoList}" var="data"> 
	  			<div class="single_stuff wow fadeInDown">
	              <div class="single_stuff_img"> <a href="<%=contextPath%>/showArticleDetails/${data.tnum_article_id}"><img src="<c:out value="${data.tstr_image_url}"/>" alt="" width="100%"></a> </div>
	              <div class="single_stuff_article">
	                <div class="single_sarticle_inner"> 
	                 <c:if test="${data.tstr_article_type == 'article'}">  
	                	<a class="stuff_category" href="<%=contextPath%>/showArticle/article.html">
	                 	Article
	                 	</a>
	                 </c:if>
	                 <c:if test="${data.tstr_article_type == 'trending'}">
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/trending.html">
	                 	Trending
	                 	</a>
	                 </c:if>
	                 <c:if test="${data.tstr_article_type == 'entertainment'}">
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/entertainment.html">
	                 	Entertainment
	                 	</a>
	                 </c:if>
	                 <c:if test="${data.tstr_article_type == 'lifestyle'}"> 
	                 	<a class="stuff_category" href="<%=contextPath%>/showArticle/lifestyle.html">
	                 	Lifestyle
	                 	</a>
	                 </c:if>
	                
	                  <div class="stuff_article_inner"> <span class="stuff_date">${data.tdt_mmm} <strong>${data.tdt_dd}</strong></span>
	                    <h2><a href="<%=contextPath%>/showArticleDetails/${data.tnum_article_id}">${data.tstr_headline}</a></h2>
	                    <p>${data.tstr_sort_content} ...</p>
	                  </div>
	                </div>
	              </div>
	            </div>	
   			</c:forEach>  
 			</c:if>
            
            <!-- <div class="single_stuff wow fadeInDown">
	           <div class="single_stuff_article">
	           	<div class="singlepage_pagination" style="margin-bottom: 20px;"> <a class="previous_btn" href="#">Previous</a> <a class="next_btn" href="#">Next</a> </div>
	           </div>
	        </div>    -->
            
            <div class="stuffpost_paginatinonarea wow slideInLeft">
              <ul class="newstuff_pagnav">
                <c:if test="${prev != '0'}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${prev}">Previous</a></li>              	
                </c:if>
              	<c:if test="${page1 == currentPage}">
              		<li><a class="active_page" href="<%=contextPath%>/index/${pageaction}/${page1}">${page1}</a></li>
                </c:if>
                <c:if test="${page1 != currentPage}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${page1}">${page1}</a></li>
                </c:if>
                
                <c:if test="${page2 == currentPage}">
              		<li><a class="active_page" href="<%=contextPath%>/index/${pageaction}/${page2}">${page2}</a></li>
                </c:if>
                <c:if test="${page2 != currentPage}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${page2}">${page2}</a></li>
                </c:if>
                
                <c:if test="${page3 == currentPage}">
              		<li><a class="active_page" href="<%=contextPath%>/index/${pageaction}/${page3}">${page3}</a></li>
                </c:if>
                <c:if test="${page3 != currentPage}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${page3}">${page3}</a></li>
                </c:if>
                
                <c:if test="${page4 == currentPage}">
              		<li><a class="active_page" href="<%=contextPath%>/index/${pageaction}/${page4}">${page4}</a></li>
                </c:if>
                <c:if test="${page4 != currentPage}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${page4}">${page4}</a></li>
                </c:if>
                
                <c:if test="${page5 == currentPage}">
              		<li><a class="active_page" href="<%=contextPath%>/index/${pageaction}/${page5}">${page5}</a></li>
                </c:if>
                <c:if test="${page5 != currentPage}">
              		<li><a href="<%=contextPath%>/index/${pageaction}/${page5}">${page5}</a></li>
                </c:if>
                
              	<c:if test="${next != '0'}">
                 	<li><a href="<%=contextPath%>/index/${pageaction}/${next}">Next</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="row">
          <div class="rightbar_content">
            <div class="single_blog_sidebar wow fadeInUp">
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
            <div class="single_blog_sidebar wow fadeInUp">
              <h2>Popular Posts</h2>
              <ul class="middlebar_nav wow">
              <c:if test="${!empty articleDetailsDtoPopularPostList}">  
  				<c:forEach items="${articleDetailsDtoPopularPostList}" var="datapopular"> 
                	<li><a href="<%=contextPath%>/showArticleDetails/${datapopular.tnum_article_id}" class="mbar_thubnail"><img alt="" src="<c:out value="${datapopular.tstr_image_url}"/>"></a> <a href="<%=contextPath%>/showArticleDetails/${datapopular.tnum_article_id}" class="mbar_title">${datapopular.tstr_headline}</a> </li>
                </c:forEach>
             </c:if>
              </ul>
            </div>
            <div class="single_blog_sidebar wow fadeInUp">
              <h2>Popular Tags</h2>
              <ul class="poplr_tagnav">
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