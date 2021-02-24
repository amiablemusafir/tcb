<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>The Coder Boy | Login</title>
		<link rel='shortcut icon' type='image/x-icon' href='image/favicon.ico'/>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<script language="javascript" type="text/javascript" src="assets/js/md5hash.js"></script>
	
			<script type="text/javascript">
			/* $(function() {
				$('html, body').animate({
				      scrollTop: $("#istr_login_id").offset().top
				}, 400);
			}); */
		
			function LoginValidation() {
		
				var username = document.getElementById('istr_login_id').value;
				var password = document.getElementById('istr_password').value;
				
				username = username.trim();
				password = password.trim();
				
				var randomString = document.getElementById('randomstr').value;
				
				if (username == '') {
					alert('Please enter Username');
					return false;
				}
				if (password == '') {
					alert('Please enter Password');
					return false;
				} else {
				
					var hashPass = calcMD5(password);
				
					var concateString = hashPass + randomString;
					
					var finalPassword = calcMD5(concateString);
						
					document.getElementById('istr_password').value = finalPassword;
		
		
				}
		
				return true;
		
			}
	
</script>
<style type="text/css">

/* ---------- LOGIN ---------- */
#login {margin: 50px auto; width: 550px;}
#istr_login_id {width: 300px; }
#istr_password {width: 300px; }
#login_button {width: 300px; }
.bot1 {width: 50%; margin-top : 60px; float: left;}
.bot2 {width: 50%; margin-top : 80px; float: right;}

.space {padding: 1em 0em 0em 0em;}
#textfield_box {width : 300px;}
.bigbox {
	  width: 550px; 
	-webkit-border-radius: 20px 20px 0px 0px;
	-moz-border-radius: 20px 20px 0px 0px;
	 border-radius: 20px 20px 0px 0px;
	 border:2px solid #861414;
	 background:rgb(253, 253, 252);
	 -webkit-box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
	 -moz-box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
	 box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
}

.messagebox {
	-webkit-border-radius: 20px 20px 0px 0px;
	-moz-border-radius: 20px 20px 0px 0px;
	 border-radius: 20px 20px 0px 0px;
	 border:2px solid #FFFFFF;
	 background:rgb(253, 253, 252);
	 -webkit-box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
	 -moz-box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
	 box-shadow: rgba(0, 116, 199, 0.74) 22px 22px 22px;
}

/* For mobile phones: */
@media screen and (max-width: 400px) {
	.messagebox {width: 98%;}
	.bigbox {width: 98%;}
	#login {margin: 10px 10px; width: auto;}
	.space {padding: 1em 0em 0em 0em;}
	#istr_login_id {width: 90%; height: 30px;}
	#istr_password {width: 90%; height: 30px;}
	#login_button {width: 90%;}
	.bot1 {width: 90%; margin-top : 0px; float: left;}
	.bot2 {width: 90%; margin-top : 0px; float: left;}
	
	
@media only screen and (min-width: 600px) {
     /* For tablets: */
    .messagebox {width: auto;}
	.bigbox {width: auto;}
    #login {margin: 0px auto; width: auto;}
    .space {padding: 1em 0em 0em 0em;}
}
@media only screen and (min-width: 768px) {
    /* For desktop: */
    .messagebox {width: 400px;}
	.bigbox {width: 400px;}
	
  }
}

#message {
	margin: 20px auto;
	width: 400px;
}
form input {
	background-color: #e5e5e5;
	border: none;
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	color: #5a5656;
	font-family: 'Open Sans', Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 50px;
	outline: none;
	width: 300px;
	-webkit-appearance:none;
	-webkit-box-shadow: rgba(0, 116, 199, 0.74) 2px 2px 2px;
	-moz-box-shadow: rgba(0, 116, 199, 0.74) 2px 2px 2px;
	box-shadow: rgba(0, 116, 199, 0.74) 2px 2px 2px;
}
form input[type="submit"] {
	background-color: #008dde;
	border: none;
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	color: #f4f4f4;
	cursor: pointer;
	font-family: 'Open Sans', Arial, Helvetica, sans-serif;
	height: 50px;
	text-transform: uppercase;
	-webkit-appearance:none;
}
form a {
	color: #5a5656;
	font-size: 10px;
}
form a:hover { text-decoration: underline; }
.btn-round {
	background-color: #5a5656;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	color: #f4f4f4;
	display: block;
	font-size: 12px;
	height: 50px;
	line-height: 50px;
	margin: 0px 125px;
	text-align: center;
	text-transform: uppercase;
	width: 50px;
}

.loginBtn {
  box-sizing: border-box;
  position: relative;
  width: 300px;
  height: 4em;
  margin: 0.2em;
  padding: 0 15px 0 46px;
  border: none;
  text-align: left;
  line-height: 34px;
  white-space: nowrap;
  border-radius: 0.2em;
  font-size: 12px;
  color: #FFF;
}
.loginBtn:before {
  content: "";
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  width: 40x;
  height: 100%;
}
.loginBtn:focus {
  outline: none;
}
.loginBtn:active {
  box-shadow: inset 0 0 0 32px rgba(0,0,0,0.1);
}

</style>
	</head>
		<div align="center">
			<div id="login">
				<div class="bigbox">
					<div class="space">
					<img src="image/login.png">
					<h1>The Coder Boy</h1>
					<font color="#000000">Please enter Username and Password</font>
					<br/>
					<div align="center" style="color: #D22117; font-size: 14px; font-weight: bold;" id="messages"><s:property value="messages"/></div>
						<form id="adminDetailDto" name="formLogin" action="authentication" method="post" onsubmit="return(LoginValidation());">
						<div class="login_fieldset">
							<p><input type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;Enter Username or Email Id" required name="loginId" id="istr_login_id"></p>
							<p><input type="password"  required name="password" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;Enter Password" id="istr_password" type="password"></p>
							<h6><a href="#">Forgot Password?</a></h6>
							<p><input type="submit" value="Login" id="login_button"></p>
						</div>
								
						<input type="hidden" name="contextPath" id="contextPath" value="<%=request.getContextPath()%>"/>
						<input type="hidden" name="randomstr" id="randomstr" value="<%=request.getSession().getAttribute("randomString")%>"/>
						</form>
						<br/>
						<br/>
					</div>
				</div>
			</div>
			<br/>
			<br/>
		</div> <!-- end login -->
	</body>
</html>