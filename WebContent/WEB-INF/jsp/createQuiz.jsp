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

<script type="text/javascript">
/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

function addOption() {  
	$("#error_message_option").html("");
	var table_loop_size = $("#table_loop_size").val();
	table_loop_size = parseInt(table_loop_size) + 1;
	
	var divHtml = "";
	divHtml = divHtml+'<tr id="itemrow'+table_loop_size+'">';
	divHtml = divHtml+'<td><input type="text" id="option" name="option" placeholder="Enter Option details.."></td>';	
	divHtml = divHtml+'</tr>';
	
	$("#requestList").append(divHtml);	
	$("#table_loop_size").val(table_loop_size);
}

function removeOption() {
	$("#error_message_option").html("");
	var id = $("#table_loop_size").val();
	if(id != '1') {
		$("#itemrow"+id).remove();
		id = parseInt(id)-1;
		$("#table_loop_size").val(id);
	} else {
		$("#error_message_option").html("Minimum One Option Should Be Available On Page");
	}
}
</script>
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
  <div align="center"><h2><b>Create Quiz</b></h2></div> 
  <form:form action="save_quiz_detail.html" method="post">
  	<div style="color: red; font-size: 16px; font-weight: bold;" align="center">${message_details}</div>
    <label for="headline"><b>Headline</b></label>
    <form:input path="headline" id="headline" value="${quizDetailsDtoBean.headline}" placeholder="Your Headline.."/>
    <br/>
    <label for="image_url"><b>Image URL</b></label>
    <form:input path="image_url" id="image_url" value="${quizDetailsDtoBean.image_url}" placeholder="Your Image URL.."/>
	<br/>
    <label for="image_url"><b>Image URL</b></label>
    <form:input path="image_bg_url" id="image_bg_url" value="${quizDetailsDtoBean.image_bg_url}" placeholder="Your Image Background URL.."/>
	<br/>
	<label for="content"><b>Content</b></label>
    <form:textarea id="content" path="content" value="${quizDetailsDtoBean.content}" placeholder="Write something.." style="height:200px"></form:textarea>
	<br/>
	<br/>
	<div align="right">
	 <button type="button" class="btn btn-primary" onclick="addOption();">Add</button> |
	 <button type="button" class="btn btn-primary" onclick="removeOption();">Remove</button>
	</div>
	<div id="error_message_option" style="color: maroon;"></div>
	<label for="option"><b>Option</b></label>
    <table id="requestList" width="100%">
	<tr id="itemrow1">
		<td><input type="text" id="option" name="option" placeholder="Enter Option Details.."></td>
	</tr>
	</table>
	<br/>
	<div align="center">
    <input type="submit" value="Submit"> &nbsp;&nbsp; <input type="button" value="Cancel">
	<input type="hidden" name="table_loop_size" id="table_loop_size" value="1"/>
    </div>
  </form:form>
</div>

<!-- 
	 <label for="country">Country</label>
     <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
     </select>
 -->
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