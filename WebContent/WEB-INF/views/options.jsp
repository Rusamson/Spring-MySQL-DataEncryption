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
        <h2 class="form-signin-heading">Welcome <c:out value="${sessionScope.sessionUser.getSurname()}"></c:out></h2>         
    
        <c:if test="${sessionScope.sessionUser.getDriver() == 0}"> 
       
        <a href="/rideapp/details" class="btn btn-lg btn-primary btn-block">Book a Ride</a>
        <a href="/rideapp/booking/user/<c:out value="${sessionScope.sessionUser.getUserID()}"></c:out>" class="btn btn-lg btn-primary btn-block">View your Book</a> 
    
  		 Login as a Driver <a href="/rideapp/register_driver"> Click Here</a>
		</c:if>
        <c:if test="${sessionScope.sessionUser.getDriver() == 1}"> 
        	<a href="/rideapp/booking/country/all" class="btn btn-lg btn-primary btn-block">Give a Ride</a>
        	<a href="/rideapp/trip/<c:out value="${sessionScope.sessionUser.getUserID()}"></c:out>" class="btn btn-lg btn-primary btn-block">My Trips</a> 
        	<a href="/rideapp/user_profile" class="btn btn-lg btn-primary btn-block">My Profile</a>
        	
        	Login as a Client  <a href="/rideapp/user/driverToClient/<c:out value="${sessionScope.sessionUser.getUserID()}"></c:out>"> Click Here</a>
		</c:if>		
       
       

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
