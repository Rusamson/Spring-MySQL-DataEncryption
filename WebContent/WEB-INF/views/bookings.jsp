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

    <div class="container">
    <a href="/rideapp/options" >Home</a> |
    <a href="/rideapp/index" >Logout</a>  
     
     Your username is <c:out value="${sessionScope.sessionUser.getSurname()}"></c:out>  <br>
	 
	 <h2>My Booking</h2>  
		  
<table>
  <c:forEach items="${mybookingsList}" var="item">
    <tr>
      <td><c:out value="${item}" /></td>
    </tr>
  </c:forEach>
</table>

			<div class="panel panel-info">
			  <div class="panel-heading">Time: 6:45pm / Dublin panel st to Balbriggan main St  / Price: 20 euro </div>
			  <div class="panel-body">
			  Name: Samson , Phone : 0894891201, Ratings: 3.5 <br>
			  <hr> 
			  
			    <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Cancel Your Booking</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alert</h4>
        </div>
        <div class="modal-body">
          <p>Do you want to cancel your Booking</p>
        </div>
        <div class="modal-footer">
        <a href="/rideapp/options" class="btn btn-default  btn-default">Yes</a>      
           <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
      
    </div>
  </div>
	<hr>
	 Your Ride is on the way : 
	10 mns Remaining <hr>
	<a href="/rideapp/details" class="btn btn-default btn-primary btn-default">Edit Your Ride</a>
     <a href="/SpringTomcatTest/rest/map" class="btn btn-default btn-primary btn-default">View Your Ride</a>
  </div>  
  </div>
			 
  
		 

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
