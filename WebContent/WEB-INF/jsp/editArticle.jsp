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
  <div align="center"><h2><b>Edit Article</b></h2>
  <form:form action="/TCB/search_article_detail.html" method="post">
  <div style="color: red; font-size: 16px; font-weight: bold;" align="center" id="info">${message_details}</div>
  <table width="80%">
  <tr>
  <td>
  	<form:select path="article_type" id="article_type">
    	<form:option value="0">-- Select Article Type --</form:option>
    	<form:option value="article">Article</form:option>
    	<form:option value="trending">Trending</form:option>
    	<form:option value="entertainment">Entertainment</form:option>
    	<form:option value="lifestyle">Lifestyle</form:option>
    </form:select>
  </td>
  </tr>
  <tr>
  <td><div align="center" style="width: 100%;"><input type="submit" value="Search"></div></td>
  </tr>  
  </table>
  </form:form>
</div>
<br/>
<br/>
  <table width="100%">
  <tr style="background-color: #e76b33; height: 40px;">
  <th width="10%">&nbsp;&nbsp;SL&nbsp;No.</th>
  <th width="70%">&nbsp;&nbsp;Headline</th>
  <th width="10%">&nbsp;&nbsp;Edit</th>
  <th width="10%">&nbsp;&nbsp;Delete</th>  
  </tr>
   <c:if test="${!empty articleDetailsDtoList}">  
  		<%int i = 1;%>
  		<c:forEach items="${articleDetailsDtoList}" var="data">
  		<tr style="background-color: #ffffff; height: 40px;">
  		<td>&nbsp;&nbsp;<%=i%></td>
  		<td>${data.tstr_headline}</td>
  		<td><a class="btn blue_btn" href="<%=contextPath%>/editArticleDetails/${data.tnum_article_id}">Edit</a></td>
  		<td><a class="btn btn-danger" href="<%=contextPath%>/deleteArticleDetails/${data.tnum_article_id}">Delete</a></td>
  		<%i++;%>
  		</tr>
  		</c:forEach>
   </c:if>
   <c:if test="${empty articleDetailsDtoList}"> 
   <tr style="background-color: #ffffff; height: 40px;">
   		<td colspan="4" align="center"><b>Data Not Found</b></td>
   </tr>
   </c:if>
  </table>
  
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