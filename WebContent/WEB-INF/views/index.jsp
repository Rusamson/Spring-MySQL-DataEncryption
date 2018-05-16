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

      <form class="form-signin" action="/rideapp/login/options" method="POST">
        <h2 class="form-signin-heading">Please sign in</h2>
          <c:out value="${loginResult}"></c:out> <br>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
        <br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input id="inputRemember_me" type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        
            	 <a href="/rideapp/register" >New User</a> |
   				 <a href="/rideapp/forgot" >Forgot password</a> 
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
            <script>
            $(function() {
 
                if (localStorage.chkbx && localStorage.chkbx != '') {
                    $('#inputRemember_me').attr('checked', 'checked');
                    $('#inputEmail').val(localStorage.usrname);
                    $('#inputPassword').val(localStorage.pass);
                } else {
                    $('#inputRemember_me').removeAttr('checked');
                    $('#inputEmail').val('');
                    $('#inputPassword').val('');
                }
 
                $('#inputRemember_me').click(function() {
 
                    if ($('#inputRemember_me').is(':checked')) {
                        // save username and password
                        localStorage.usrname = $('#inputEmail').val();
                        localStorage.pass = $('#inputPassword').val();
                        localStorage.chkbx = $('#inputRemember_me').val();
                    } else {
                        localStorage.usrname = '';
                        localStorage.pass = '';
                        localStorage.chkbx = '';
                    }
                });
            });
 
        </script>
  </body>
</html>
