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

<script src="<c:url value="/assets/tinymce/tinymce.dev.js" />"></script>
<script src="<c:url value="/assets/tinymce/plugins/table/plugin.dev.js" />"></script>
<script src="<c:url value="/assets/tinymce/plugins/paste/plugin.dev.js" />"></script>
<script src="<c:url value="/assets/tinymce/plugins/spellchecker/plugin.dev.js" />"></script>

<script type="text/javascript">
function submitValidationPage() {
	
	/* alert(tinymce.get('create_blog').getContent()); */
	$("#info").html("");
	
	var article_type = document.getElementById('article_type').value;
	if (article_type == '0') {
		$("#info").html("Please Select Article Type");
		document.getElementById('article_type').focus();

		return false;
	}
	
	var headline = document.getElementById('headline').value;
	if (headline == '') {
		$("#info").html("Please Enter Headline");
		document.getElementById('headline').focus();

		return false;
	}
	
	var image_url = document.getElementById('image_url').value;
	if (image_url == '') {
		$("#info").html("Please Enter Image Url");
		document.getElementById('image_url').focus();

		return false;
	}
	
	var share_image_url = document.getElementById('share_image_url').value;
	if (share_image_url == '') {
		$("#info").html("Please Enter Share Image URL");
		document.getElementById('share_image_url').focus();

		return false;
	}
	
	var sort_content = document.getElementById('sort_content').value;
	if (sort_content == '') {
		$("#info").html("Please Enter Short Content");
		document.getElementById('sort_content').focus();

		return false;
	}	
	
	var ostr_message = tinymce.get('create_blog').getContent();
	if (ostr_message == '') {
		$("#info").html("Please Enter Message");
		document.getElementById('create_blog').focus();

		return false;
	}		
	return true;

}
/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

tinymce.init({
	selector: "textarea",
	theme: "modern",
	plugins: [
		"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
		"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		"save table contextmenu directionality emoticons template paste textcolor importcss"
	],
	content_css: "css/development.css",
	add_unload_trigger: false,

	toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons table",
	toolbar2: "custompanelbutton textbutton spellchecker",

	image_advtab: true,

	style_formats: [
		{title: 'Bold text', format: 'h1'},
		{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
		{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
		{title: 'Example 1', inline: 'span', classes: 'example1'},
		{title: 'Example 2', inline: 'span', classes: 'example2'},
		{title: 'Table styles'},
		{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
	],

	template_replace_values : {
		username : "Sumit Singh"
	},

	template_preview_replace_values : {
		username : "Xamdesk"
	},

	//file_browser_callback: function() {},

	templates: [ 
		{title: 'Some title 1', description: 'Some desc 1', content: '<strong class="red">My content: {$username}</strong>'}, 
		{title: 'Some title 2', description: 'Some desc 2', url: 'development.html'} 
	],

	setup: function(ed) {
		ed.addButton('custompanelbutton', {
			type: 'panelbutton',
			text: 'Panel',
			panel: {
				type: 'form',
				items: [
					{type: 'button', text: 'Ok'},
					{type: 'button', text: 'Cancel'}
				]
			}
		});

		ed.addButton('textbutton', {
			type: 'button',
			text: 'Text'
		});
	},

	spellchecker_callback: function(method, words, callback) {
		if (method == "spellcheck") {
			var suggestions = {};

			for (var i = 0; i < words.length; i++) {
				suggestions[words[i]] = ["First", "second"];
			}

			callback(suggestions);
		}
	}
});

function addOption() {  
	var table_loop_size = $("#table_loop_size").val();
	table_loop_size = parseInt(table_loop_size) + 1;
	
	var divHtml = "";
	divHtml = divHtml+'<tr id="itemrow'+table_loop_size+'">';
	divHtml = divHtml+'<td><textarea id="content'+table_loop_size+'" name="content" placeholder="Write something.." style="height:100px"></textarea><input type="hidden" name="sequence" id="sequence'+table_loop_size+'" value="'+table_loop_size+'"/><br/><br/></td>';	
	divHtml = divHtml+'</tr>';
	
	$("#requestList").append(divHtml);	
	$("#table_loop_size").val(table_loop_size);
}

function removeOption() {
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
  <div align="center"><h2><b>Create Article</b></h2></div> 
  <form:form action="/TCB/update_article_detail.html" method="post" onsubmit="return(submitValidationPage())">
  	<div style="color: red; font-size: 16px; font-weight: bold;" align="center" id="info">${message_details}</div>
  	<label for="headline"><b>Article Type</b></label>
    <form:select path="article_type" id="article_type">
    	<form:option value="0">-- Select --</form:option>
    	<form:option value="article">Article</form:option>
    	<form:option value="quiz">Quiz</form:option>
    	<form:option value="trending">Trending</form:option>
    	<form:option value="entertainment">Entertainment</form:option>
    	<form:option value="lifestyle">Lifestyle</form:option>
    </form:select>
    <br/>
    <form:hidden path="article_id" id="article_id"/>
    <label for="headline"><b>Headline</b></label>
    <form:input path="headline" id="headline" placeholder="Your Headline.."/>
    <br/>
    <label for="image_url"><b>Image URL</b></label>
    <form:input path="image_url" id="image_url" placeholder="Your Image URL.."/>
     <br/>
    <label for="share_image_url"><b>Share Image URL</b></label>
    <form:input path="share_image_url" id="share_image_url" placeholder="Your Share Image URL.."/>
	<br/>
	<label for="content"><b>Sort Content</b></label>
    <form:input path="sort_content" id="sort_content" placeholder="Your Sort Content.."/>
    <div id="error_message_option" style="color: maroon;"></div>
	<label for="option"><b>Content</b></label>
	
	<table id="requestList" width="100%">
	<%int i = 1;%>  		
	<c:if test="${!empty articleContentDetailsDtoList}">  
  		<c:forEach items="${articleContentDetailsDtoList}" var="data">	
		<tr id="itemrow1">
			<td>
			<textarea id="content<%=i%>" name="content" placeholder="Write something..">${data.tstr_content}</textarea>
			<input type="hidden" name="sequence" id="sequence<%=i%>" value="${data.tstr_sequence}"/>
			<input type="hidden" name="article_content_id" id="tnum_article_content_id<%=i%>" value="${data.tnum_article_content_id}"/>
			<br/><br/>
			</td>
		</tr>
		<%i++;%>
		</c:forEach>
	</c:if>
	</table>
	<div align="right">
	 <button type="button" class="btn btn-primary" onclick="addOption();">Add</button> |
	 <button type="button" class="btn btn-primary" onclick="removeOption();">Remove</button>
	</div>
    
    <br/>
	<div align="center">
    <input type="submit" value="Submit"> &nbsp;&nbsp; <input type="button" value="Cancel">
	<input type="hidden" name="table_loop_size" id="table_loop_size" value="<%=i%>"/>
    </div>
  </form:form>
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