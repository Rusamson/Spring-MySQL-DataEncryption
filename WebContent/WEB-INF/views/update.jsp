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
    <a href="/rideapp/index" >Home</a>
    
    <h2 class="form-signin-heading">New User</h2>
    
      <form class="form-signin" action="/rideapp/user/update" method="POST">  
         <label for="inputId">ID</label>
        <input type="text" id="id" name="id" value="0" class="form-control"   required autofocus>     
        <label for="inputDriver">Driver :</label>
        <input type="text" id="inputDriver" name="driver" class="form-control"   required autofocus> 
        <label for="inputPhone">Phone :</label>
        <input type="text" id="inputPhone" name="phone" class="form-control"   required>
		<label for="inputAddress">Address:</label>
        <input type="text" id="inputAddress" name="address" class="form-control"   required>
		<label for="inputCity">City :</label>
        <input type="text" id="inputCity" name="city" class="form-control"   required>
        <label for="inputCountry">Country :</label>
        <input type="text" id="inputCountry" name="country" class="form-control"   required>
        <label for="inputPlate">Plate :</label>
        <input type="text" id="inputPlate" name="plate" class="form-control"   required>
        <label for="inputPicture">Picture :</label>
        <input type="text" id="inputPicture" name="picture" class="form-control"   required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Accept Terms and Conditions
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
