<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<%
String contextPath = request.getContextPath(); 
%>
<title>The Coder Boy | Privacy Policy</title>
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
<script type="text/javascript">
		function StudentValidation() {
				 
				 $('#info').html('');
				 
				 var result = '';
				 var pattern = new RegExp(/^[0-9]{1,10}$/);
					 
				 
				 var name = document.getElementById('your_name').value;
				 if (name == '') {
					$('#info').html('Please Enter Your Name');
					document.getElementById('your_name').focus();

					return false;
				 }
					
				 var phone_no = document.getElementById('phone_no').value;
				 if (phone_no == '') {
					$('#info').html('Please Enter Phone Number');
					document.getElementById('phone_no').focus();

					return false;
				}
				
				if (!isInteger(phone_no)) {
					$('#info').html('Enter valid Phone Number');
					document.getElementById('phone_no').focus();
					return false;
				}
				if(phone_no.length != 10) {
					$('#info').html('Phone Number should 10 digits');
					document.getElementById('phone_no').focus();
					return false;
				}		
				var message = document.getElementById('message').value;
				if (message == '') {
					$('#info').html('Please Enter Message');
					document.getElementById('message').focus();

					return false;
				}
				
				var captchatext = document.getElementById('captchatext').value;
				if (captchatext == '') {
					$('#info').html('Please Enter Valid Details');
					document.getElementById('captchatext').focus();

					return false;
				}
				
				return true;	 	 
			 }
		 
		 
			function isInteger(s) {
				var i;
				for (i = 0; i < s.length; i++) {
				var c = s.charAt(i);
				if (((c < "0") || (c > "9")))
					return false;
				}
				return true;
			}
		</script>
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
    <div class="single_page">
	<h1 class="title entry-title">Contact Us</h1>
		<br/>
		<p class="sed-para"> Thank you for your interest in The Coder Boy. Please Please send us mail on info@thecoderboy.com for any concern.</p>
									<br/>
									<p class="sit-in" style="text-align: justify;">Feel free to contact Thecoderboy for any Feedback. We value your feedback and product suggestions. If you need a call back from us, Please mention your mobile number on mail body, you will get the call back from us within 24-48 hours. If you need to complain against any post of The Coder Boy, Write a mail to <b><a href="mailto:info@thecoderboy.com">info@thecoderboy.com</a></b>. Your feedback will be forwarded to the management for appropriate corrective measures and we will try to solve your problem as soon as possible.</p>
									
									<br/>
									<div class="sed-para">
									
										<p class="sed-para">
										<b>Tel: &nbsp;&nbsp;(+91) 9958903074, 9090459655</b><br/>
										<b>Email: &nbsp;&nbsp;<a href="mailto:info@thecoderboy.com">info@thecoderboy.com</a></b></p>
									</div>
									
								
								
								<div class="clearfix"> </div>
							</div>
						

						</div>			
	
	
	</div>
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