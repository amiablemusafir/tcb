<%@page import="com.tcb.common.Setup"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="com.tcb.common.FBConnection"%>

<!DOCTYPE html>
<html>
<head>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-9742086481369813",
    enable_page_level_ads: true
  });
</script>
<c:url var="home" value="/" scope="request" />
<title>${quizDetailsDto.tstr_headline}</title>
<%
//String contextPath = Setup.contextpath; 
String path = request.getContextPath(); 
FBConnection fbConnection = new FBConnection();
%>
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/structure.css" />" rel="stylesheet">
<!--[if lt IE 9]>
<script src="../assets/js/html5shiv.min.js"></script>
<script src="../assets/js/respond.min.js"></script>
<![endif]-->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="copyright" content="Copyright https://thecoderboy.com. All rights reserved.">
<meta name="title" content="${quizDetailsDto.tstr_headline}"/>
<meta name="description" content="${quizDetailsDto.tstr_content}"/>
<meta name="image" content="https://www.thecoderboy.com/dataimage/details${tstr_img_id}.jpg"/>

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
<script>
function onLoad(loading, loaded) {
    if(document.readyState === 'complete'){
        return loaded();
    }
    loading();
    if (window.addEventListener) {
        window.addEventListener('load', loaded, false);
    }
    else if (window.attachEvent) {
        window.attachEvent('onload', loaded);
    }
};

onLoad(function(){
  
},
function(){
   generateImage();   
});

function searchViaAjax(imgsrc) {
	
	//alert("hello");
	var search = {}
	search["ajdata"] = imgsrc;
	search["question"] = $("#question_id").val();
	search["app_id_image"] = $("#app_id_image").val();
	search["tstr_date"] = $("#tstr_date").val();
	//alert("hello");
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "${home}search/api/getSearchResult",
		data : JSON.stringify(search),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			//$("#myProgress").hide();
   	     	//$("#img").show();
			
   	  		//var json = "<h4>Ajax Response</h4><pre>"+ JSON.stringify(data, null, 4) + "</pre>";
			//alert(json);
		},
		error : function(e) {
			//alert(e);
		},
		done : function(e) {
			//alert("Done");
		}
	});

}



function generateImage() {
	//alert("hello");
       html2canvas($("#wrp"), {
	    onrendered: function(canvas) {
	       var imgsrc = canvas.toDataURL("image/jpg");
	       //alert(imgsrc);
	       $("#newimg1").attr('src',imgsrc);
	       $("#img").css("width: 100%; height: 100%;");
	       $("#del_div").html("");
	       $("#del_div").hide();
	       
	       move();
	       searchViaAjax(imgsrc);	 
	       
	      
       }
    }); 
}

function move() {
	 var width = 2;
	 var id = setInterval(frame, 30);
	 function frame() {
	    if (width >= 100) {
	       $("#myProgress").hide();
   	       $("#img").show();
	       clearInterval(id);
	    } else {
	       width++; 
	    }
	}
}
</script>
<style>
#myProgress {
  width: 100%;
}

#myBar {
  width: 10%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
}
#wrp {
   width: 800px;
   height: 420px;
}
.main_box_img {
   width: 800px;
   height: 420px;
   border: 1px solid black;
   background-image: url(${quizDetailsDto.tstr_image_bg_url});
   backgroung-size: 100%;
   background-repeat: no-repeat;
} 
.main_blank_img {
    width: 800px;
} 
.main_box {
   width: 800px;
   border: 1px solid black;
} 
.main_box_progress {
   width: 600px;
   border: 1px solid black;
} 
.main_blank {
    width: 800px;
} 

.city {
   width: 310PX;
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
	font-size: 34px;
}
h3 {
	font-size: 34px;
	color: #d5103a;
	font-weight: bold;
}

p {
	font-size: 22px;
}

.pluginCountButton {
    color: #6A7180;
    font-size: 11px;
    line-height: 18px;
    text-align: center;
    white-space: nowrap;
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
	.main_box_progress {
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
		padding: 0px 0px 0px 0px; 
		width:100%
	}
	
	p {
		font-size: 12px;
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
	}
	.main_box_progress {
   		width: 100%;
	}
	.main_blank {
   		width: 100%;
	}
   .singlepost_content_div {
		
		width:100%
	}
	
	p {
		font-size: 12px;
	}
}
</style>
<script>
	(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8";
	fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>		
</head>

<body>
<div id="fb-root"></div>
<input type="hidden" id="question_id" name="question_id" value="${question}"/>
<input type="hidden" id="app_id_image" name="app_id_image" value="${tstr_img_id}"/>
<input type="hidden" id="tstr_date" name="tstr_date" value="${tstr_date}"/>
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
            <li class=""><a href="<%=path%>/index/home/1">Home</a></li>
            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">About</a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=path%>/termofservice.html">Term of Service</a></li>
                <li><a href="<%=path%>/privecypolicy.html">Privacy Policy</a></li>
                <li><a href="<%=path%>/contactus.html">Contact Us</a></li>
              </ul>
            </li>
            <li><a href="<%=path%>/showArticle/article/1">Article</a></li>
            <li><a href="<%=path%>/quiz/1">Quiz</a></li>
            <li><a href="<%=path%>/showArticle/trending/1">Trending</a></li>
            <li><a href="<%=path%>/showArticle/entertainment/1">Entertainment</a></li>
           	<li><a href="<%=path%>/showArticle/lifestyle/1">Life Style</a></li>
            <!-- 
            <li><a href="#">Download Template</a></li>
            -->
          </ul>
        </div>
      </div>
    </nav>
    <!-- 
    <form id="searchForm">
      <input type="text" placeholder="Search...">
      <input type="submit" value="">
    </form>
    -->
  </div>
</header>

<section id="contentbody">
  <div class="container">
  	<div class="target">
  
    	<div class="singlepost_content_div">
    		<div>
    			<div style="width: 100%;" align="center">
  				<br/>
  				<div id="share1">
    				<div class="fb-like" data-href="https://www.facebook.com/thecoderboy/" data-layout="button_count" data-action="like" data-size="large" data-show-faces="true" data-share="false"></div>&nbsp;								
					<div  class="fb-share-button" data-href="https://www.thecoderboy.com/showfacebookcontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/" data-layout="button" data-size="large"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.thecoderboy.com/showfacebookcontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/">share</a>
				</div>
				</div>    	
				</div>
				<br/>
				
				<div id="myProgress" style="width: 100%; padding-top: 20px; padding-bottom: 20px;" align="center">
	    			<div class="main_box_progress">
	    				<b>Please wait while we are generating your result....</b>
				  		<img src="../images/progressbar.gif" width="100%"/>
				  		<p><b>Please click on like button to follow our facebook page.</b></p> 
					</div>
				</div>
				
				
	    		<div style="width: 100%;" align="center">
	    			<div id="img" style="display:none;">
	    			<div class="main_box">
	    				<form method="POST" enctype="multipart/form-data" action="myForm" id="myForm">	    					
							<img src="" id="newimg1" name="newimg1" width="100%" height="100%"/>							
							<input type="hidden" name="contextPath" id="contextPath" value="<%=request.getContextPath()%>">
						</form>
					</div>
					</div>     
      				<br/>    	   	
    				<%-- <a href="http://www.facebook.com/sharer.php?u=https://www.xamdesk.com/&t=hello"><img src="<%=contextPath%>/images/share.png"></a> --%>
    				<div id="share2">
    					<div class="fb-like" data-href="https://www.facebook.com/thecoderboy/" data-layout="button_count" data-action="like" data-size="large" data-show-faces="true" data-share="false"></div>&nbsp;&nbsp;
    					<div  class="fb-share-button" data-href="https://www.thecoderboy.com/showfacebookcontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/" data-layout="button" data-size="large"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.thecoderboy.com/showfacebookcontent/${question}/${quizDetailsDto.tnum_id}/${tstr_img_id}/${tstr_date}/">share</a></div>
    				</div>
    				
    				<br/>
  					<br/>	
					<br/>
					<a href="<%=path%>/quiz/1" class="btn blue_btn"><b style="font-size: 18px;">Home</b></a>
					<a href="<%=path%>/quiz/1" class="btn btn-success"><b style="font-size: 18px;">Try Another&nbsp;<img src="../images/reload.png"/></b></a>
				</div>
				
				<div style="width: 100%; margin-top: 1000px;" align="center" id="del_div">
					<div id="wrp">					
						<div class="main_box_img">
							<div class="main_blank_img" style="height: 50px; padding: 0.75em;">
						    	<h2 style="margin-top: 0px; color: #FFFFFF;"><b>&nbsp;</b></h2>
						    </div>
							<div style="width: 50%; height: 100%; float: left;">
								<img src="../profilepic/${question}/pc${tstr_img_id}.jpg" width="60%" height="60%" style="border-radius: 100px; border: 2px solid #ffffff; background-repeat: no-repeat; margin-top: 5%;"/>
				   				<h2 style="font-weight: bold; background: rgba(255, 255, 255, 0.5); color: #000000; width: 70%;">${first_name}&nbsp;${last_name}</h2>
				   				
				   				<!-- <img src="/TCB/images/profile.jpg" width="70%" height="70%" align="left" style="border-radius: 100px; border: 2px solid #ffffff; background-repeat: no-repeat;"/> -->
				   			</div>
				   			<div style="width: 50%; height: 100%; float: right;">
				   				<div style="font-size: 20px; font-weight: bold;">${quizDetailsOptionDto.tstr_option}</div>
				   			</div>
			   			</div> 	    		
	    			</div>
	        	</div>
	    	
				<br/>
				<br/>
				<div style="width: 100%;">
	   				<c:if test="${!empty list}">  
  					<c:forEach items="${list}" var="data"> 
  					<a href="https://www.thecoderboy.com/showpagecontent/the_coder_boy/${data.tnum_id}/234567/23021988/">
  					<div class="city">
  				 		<img alt="" src="<c:out value="${data.tstr_image_url}"/>" style="width: 100%; height: 70%;">
		  				<h4><c:out value="${data.tstr_headline}"/></h4>     			   
    					<div><c:out value="${data.tstr_content}"/></div>  
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
		            <li><a href="https://www.facebook.com/thecoderboy/"><span class="fa fa-facebook"></span></a></li>
		            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
		            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
		            <li><a href="#"><span class="fa fa-linkedin"></span></a></li>
		            <li><a href="#"><span class="fa fa-pinterest"></span></a></li>
		        </ul>
		    </div>  
		</div>
	    <div class="social_area wow fadeInLeft">
	    <div align="center" style="width: 100%;">The result of this page are only as a form of entertainment and should not be taken as serious results. The calculations are based on the interactions of people in your wall as likes and post.<br/>
	 		We never store any sensitive or private user information such a Password, Private Message, Comments, Likes etc.</div> 
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
<script src="<c:url value="/assets/js/jquery-api.min.js" />"></script>
<script src="<c:url value="/assets/js/html2canvas.js" />"></script>

		

</body>
</html>