<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Article</title>

<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/font.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="/assets/css/structure.css" />" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">

</head>
<%
String contextPath = request.getContextPath(); 
%>
<body>
<div class="topnav" id="myTopnav">
	  <a href="#home" style="background-color: rgba(4, 15, 128, 1);"><b>Home</b></a> 
	  <a href="<%=contextPath%>/createQuizPage.html" style="background-color: #e76b33;"><b>Create Quiz</b></a> 
	  <a href="<%=contextPath%>/createArticlePage.html" style="background-color: #7dc34d;"><b>Create Article</b></a>
	  <a href="#about" style="background-color: #09c;"><b>Edit Quiz</b></a> 
	  <a href="<%=contextPath%>/editArticlePage.html" style="background-color: #e76b33;"><b>Edit Article</b></a>
	  <a href="<%=contextPath%>/uploadimage.html" style="background-color: #09c;"><b>Upload Image</b></a>  
	  <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<br/>
<div class="container">
  <div align="center"><h2><b>Upload Image</b></h2>
  <br/>
  <br/>
  <br/>
  <h3 style="color:red">${filesuccess}</h3>  
  <form:form method="post" action="saveImageFile" enctype="multipart/form-data">  
	<p><label for="image">Choose Image</label></p>  
	<p><input name="file" id="fileToUpload" type="file" /></p>  <br/>
	<br/>
	<p><input type="submit" value="Upload"></p>  
  </form:form>
  </div> 
  <br/>
  <br/>
  <br/>
</div>
<br/>
<br/>
<footer id="footer">
  <div class="container_footer">
  <div class="footer_inner">
          <p class="pull-left">Copyright &copy; 2017 TCB</p>
          <p class="pull-right">Developed By : The Coder Boy</p>
   </div>
   </div>
</footer>
</body>
<script src="<c:url value="/assets/js/jquery.min.js" />"></script> 
<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script> 
<script src="<c:url value="/assets/js/wow.min.js" />"></script> 
<script src="<c:url value="/assets/js/custom.js" />"></script>
</html>