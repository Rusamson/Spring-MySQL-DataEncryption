 
<%@page contentType="text/html" import="java.time.LocalDateTime" %>
<%@page contentType="text/html" import="java.time.format.DateTimeFormatter" %>
<%@page contentType="text/html" import="java.util.Calendar" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
  <head>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Custom styles for this template
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/theme1/css/sidebar.css" rel="stylesheet" > 
    <link href="${pageContext.request.contextPath}/resources/theme1/css/page.css" rel="stylesheet" >   
     <link href="${pageContext.request.contextPath}/resources/theme1/css/topbar.css" rel="stylesheet" >
     -->
    <spring:url value="/resources/theme/css/main.css" var="mainCss" />   
	<spring:url value="/resources/theme/js/main.js" var="mainJs" />

	<link href="${mainCss}" rel="stylesheet" /> 
    <script src="${mainJs}"></script>
  </head>
  <body>
		<c:if test="${sessionScope.sessionUser == null}"> 
  		  <% response.sendRedirect("/rideapp/session/expired"); %>
		</c:if>
<div class="container">
    <a href="/rideapp/options" >Home</a> |
    <a href="/rideapp/index" >Logout</a>
    <hr>
    <c:out value="${message}"/><br>
My Profile <br>

<div id="image" >

</div>

<div id="message" >
</div>

 <hr>
 <!-- 
 <form method="POST" action="${pageContext.request.contextPath}/user/upload" enctype="multipart/form-data">
    <input type="hidden" name="userID" value="<c:out value="${sessionScope.sessionUser.getUserID()}"/>" />
    <input type="file" name="file" /><br/>
    <input type="submit" value="Submit" />
</form>
   -->
   <button onClick="myUpload(<c:out value="${sessionScope.sessionUser.getUserID()}"/>);">Upload Image </button>
<table >
<tr><th>ID</th><th>Firstname</th></tr> 
    <tr>
        <td> FirstName</td>
        <td>  <c:out value="${sessionScope.sessionUser.getFirstname()}"/></td>  
    </tr> 
    <tr>
        <td> FirstSurname</td>
        <td>  <c:out value="${sessionScope.sessionUser.getSurname()}"/></td>  
    </tr>
    <tr>
        <td> Email</td>
        <td>  <c:out value="${sessionScope.sessionUser.getEmail()}"/></td>  
    </tr>
    <tr>
        <td> Phone</td>
        <td>  <c:out value="${sessionScope.sessionUser.getPhone()}"/></td>  
    </tr> 
    <tr>
        <td> Address</td>
        <td>  <c:out value="${sessionScope.sessionUser.getAddress()}"/></td>  
    </tr> 
</table>

</div>
 


 <script type="text/javascript"> 
	 $.get('/rideapp/user/hasPicture/<c:out value="${sessionScope.sessionUser.getUserID()}"/>',
		 function(data) {
		   if(data == 0){ 
			   var tmpHtml = '<img alt="" src="/rideapp_uploads/uploads/images/image.png" width="150"/>';
			 $("#image").html(tmpHtml);
		   }else{
			   var tmpHtml = '<img alt="" src="/rideapp_uploads/uploads/images/image_<c:out value="${sessionScope.sessionUser.getUserID()}"/>.jpg"  width="150"/>';
			   $("#image").html(tmpHtml); 
		   }
		}
	 );
 </script>
 
   <script>
   //android part 
   
   //initialize web viewstrinng 
   window.AppInventor.setWebViewString(""); 
   
  function myUpload(userID){
    //document.write("The value from the app is<br />" + window.AppInventor.getWebViewString());
    window.AppInventor.setWebViewString(userID); 
  }

  </script>
</body>
</html>