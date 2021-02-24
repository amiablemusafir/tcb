<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<%
String contextPath = request.getContextPath(); 
%>
<title>The Coder Boy | Term of Service</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/structure.css" />" rel="stylesheet">
<!--[if lt IE 9]>
<script src="assets/js/html5shiv.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->
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
    <form id="searchForm">
      <input type="text" placeholder="Search...">
      <input type="submit" value="">
    </form>
  </div>
</header>
<section id="contentbody">
  <div class="container">
    <div class="row">
    <div style="margin: 0% 10% 0% 10%; text-align: justify;">
    <h1>Terms and Conditions ("Terms")</h1>


	<p>Last updated: August 26, 2017</p>
	
	
	<p>Please read these Terms and Conditions ("Terms", "Terms and Conditions") carefully before using the https://www.thecoderboy.com website (the "Service") operated by The Coder Boy ("us", "we", or "our").</p>
	
	<p>Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.</p>
	
	<p>By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service. This Terms & Conditions agreement is licensed by The Coder Boy.</p>
	
	
	<h2>Accounts</h2>
	
	<p>When you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.</p>
	
	<p>You are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.</p>
	
	<p>You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>
	
	
	<h2>Links To Other Web Sites</h2>
	
	<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by The Coder Boy.</p>
	
	<p>The Coder Boy has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that The Coder Boy shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>
	
	<p>We strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.</p>
	
	
	<h2>Termination</h2>
	
	<p>We may terminate or suspend access to our Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>
	
	<p>All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>
	
	<p>We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>
	
	<p>Upon termination, your right to use the Service will immediately cease. If you wish to terminate your account, you may simply discontinue using the Service.</p>
	
	<p>All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>
	
	
	<h2>Governing Law</h2>
	
	<p>These Terms shall be governed and construed in accordance with the laws of Delhi, India, without regard to its conflict of law provisions.</p>
	
	<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.</p>
	
	
	<h2>Changes</h2>
	
	<p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.</p>
	
	<p>By continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.</p>
	
	
	<h2>Contact Us</h2>
	
	<p>If you have any questions about these Terms, please contact us.</p>
    
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