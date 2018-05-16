 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<a href="/rideapp/options">Home</a> |
		 <a href="/rideapp/index">Logout</a> 
		 
		 <h2>My Bookings List</h2>
		   
		  ${fn:length(mybookingsList)} Booking(s) Available
		  
		  <c:forEach items="${mybookingsList}" var="item"> 
		       
		       		<div class="panel panel-info">
			<div class="panel-heading">
			
			From <b><c:out value="${item.origine}" /> </b> to  <b><c:out value="${item.destination}" /></b>
			Contact : <b><c:out value="${item.contact}" /></b>
			</div>
			<div class="panel-body"> 
			Time: <c:out value="${item.triptime}" /> NOW <HR>
			<span style="font-size:20px" >Price: <c:out value="${item.price}" /> </span><HR>
			Contact : <c:out value="${item.contact}" /> <HR>	
			<c:if test="${item.status == 0}"> 
			Status : Waiting for a driver  <HR>	
			</c:if>			
			<c:if test="${item.status != 0}"> 
			Status: Driver accepted View Driver <HR>	
			
			</c:if>			
				<!-- Trigger the modal with a button -->
				<button class="btn btn-info btn-lg" data-target="#myModal<c:out value = "${item.id}"/>" data-toggle="modal" type="button">Cancel Your Booking</button> <!-- Modal -->
				<div class="modal fade" id="myModal<c:out value = "${item.id}"/>" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" data-dismiss="modal" type="button">&times;</button>
								<h4 class="modal-title">Alert</h4>
							</div>
							<div class="modal-body">
								<p>Do you want to cancel your Booking</p>
							</div>
							<div class="modal-footer">
								<a class="btn btn-default btn-default" href="/rideapp/booking/remove/${item.userID}/${item.id}">Yes</a> <button class="btn btn-default" data-dismiss="modal" type="button">No</button>
							</div>
						</div>
					</div>
				</div>
			 
			</div>
		</div>
		 
		  </c:forEach>
		 
 
	</div><!-- /container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js">
	</script>
 
</body>
</html>