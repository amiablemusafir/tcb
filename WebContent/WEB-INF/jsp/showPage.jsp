<!DOCTYPE html>
<html>
<head>
<title>Jai Mata Di</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.thecoderboy.com/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.thecoderboy.com/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.thecoderboy.com/assets/css/font.css">
<link rel="stylesheet" href="https://www.thecoderboy.com/assets/css/animate.css">
<link rel="stylesheet" href="https://www.thecoderboy.com/assets/css/structure.css">
<!--[if lt IE 9]>
<script src="assets/js/html5shiv.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->
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
			    var text = "Check your navratri greeting card share by "+name;
		        var url = "https://www.thecoderboy.com/showPage/"+name;
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
    padding: 12px 20px;s
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */;
}
@media screen and (max-width: 480px){
	#contentbody {
	    display: inline;
	    float: left;
	    padding: 12px 0 23px;
	    width: 100%;
	}
	
}	

@media screen and (max-width: 320px) {
	#contentbody {
	    display: inline;
	    float: left;
	    padding: 12px 0 23px;
	    width: 100%;
	}
    
}
</style>

</head>
<body>
<div id="preloader">
  <div id="status">&nbsp;</div>
</div>
<!-- <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
 -->
<section id="contentbody">
  <div class="container">
    <div class="row">
    <div style="margin: 0% 10% 0% 10%; text-align: justify;">
    <div align="center">
    <h1 style="color: #fb5707;"><b>${name}</b></h1>
    <h2 style="font-family: fantasy; color: maroon;">Wishing you<br/>Happy Navratri</h2>
    <img alt="Jai Mata Di" src="../images/maaDurga.gif" width="100%" height="100%">
 
    </div>
    <br/>
    <p>Celebrate each day of navratri with ever growing zeal and indulge yourself in pious activities and Gods shall favor you in the coming year.
	   Dance on the Garba floor and celebrate this enchanting festival with your friends and families.
	   Happy Navratri.</p>
    
    <div align="right"><h4><b>- ${name}</b></h4></div> 
    <div align="center">
    <div id="enter_name_error" style="color: red;"></div>
    <input type="text" name="enter_name" id="enter_name" placeholder="Enter your Name Here"/>
    <a data-link="https://www.thecoderboy.com/showPage/Sumit Singh" onclick="showData(this);"><input type="button" value="Share on Whatsup"></a>
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
<script src="https://www.thecoderboy.com/assets/js/jquery.min.js"></script> 
<script src="https://www.thecoderboy.com/assets/js/bootstrap.min.js"></script> 
<script src="https://www.thecoderboy.com/assets/js/wow.min.js"></script> 
<script src="https://www.thecoderboy.com/assets/js/custom.js"></script>
</body>
</html>