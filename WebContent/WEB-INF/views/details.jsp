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
      <form class="form-signin" action="/rideapp/booking/add" method="POST">
        <a href="/rideapp/options" >Home</a> |
        <a href="/rideapp/index" >Logout</a> 
        <h2 class="form-signin-heading">Book for a Ride</h2> 
        
        <input type="hidden" id="inputUserID" name="userID" value="<c:out value="${sessionScope.sessionUser.getUserID()}"></c:out>" class="form-control" placeholder="userID" readonly="readonly">
        
        <label for="inputFrom">From :</label>
        <input type="text" id="inputFrom" name="origine" class="form-control" placeholder="Your Location" required autofocus>        
         <label for="inputTo">To :</label>
        <input type="text" id="inputTo" name="destination" class="form-control" placeholder="Destination" required>
        <label for="inputPrice">Price Offer :</label>
        <input type="text" id="inputPrice" name="price" class="form-control" placeholder="(eg. 20 Euro)" required>

		 <% 
         DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
         LocalDateTime now = LocalDateTime.now();
        // System.out.println(dtf.format(now)); //2016/11/16 12:08:43
         %>
		<label for="inputTime">Trip Time :</label>
		 <select class="form-control">
		  <option value="volvo">Now</option>
		  <option value="saab">in 30 mns</option>
		  <option value="opel">in 1 hour</option>
		  <option value="audi">More...</option>
		</select>
        <input type="text" id="inputTime" name="triptime" value="0" class="form-control" placeholder="time" required>
 
         <label for="inputPhone">Contact :</label>
        <input type="text" id="inputPhone" name="contact" class="form-control" placeholder="Phone number" required>
        
        <input type="hidden" id="inputCreated" name="timebooked" value="<%= dtf.format(now)%>" class="form-control"   readonly="readonly">       
         
           <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Book</button>
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
