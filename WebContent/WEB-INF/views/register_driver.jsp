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
 
 <c:if test="${sessionScope.sessionUser.getPlate() != null}"> 
         <c:redirect url="/user/clientToDriver/${sessionScope.sessionUser.getUserID()}"/>
 </c:if>
 
      <form class="form-signin" action="/rideapp/user/register/driver" method="POST">
        <a href="/rideapp/index" >Home</a>
        <h2 class="form-signin-heading">Driver Details</h2> 
        <input type="hidden" id="inputUserID" name="userID" value="<c:out value="${sessionScope.sessionUser.getUserID()}"></c:out>" class="form-control" placeholder="userID" readonly="readonly">    
        <label for="inputPhone">Contact :</label>
        <input type="text" id="inputPhone" name="phone" class="form-control"   required autofocus> 
        <label for="inputPlate">Plate Number :</label>
        <input type="text" id="inputPlate" name="plate" class="form-control"   required  >
		<label for="inputAddress">Street Address :</label>
        <input type="text" id="inputAddress" name="address" class="form-control"   required  > 
        <div class="checkbox">
          <label>
            <input type="checkbox" value="accept-terms" required> Accept Terms and Conditions
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Resgister</button>
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
