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
		 <% 
         DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
         LocalDateTime now = LocalDateTime.now();
        // System.out.println(dtf.format(now)); //2016/11/16 12:08:43
        	Calendar calendar = Calendar.getInstance();
	      //  calendar.setTime(now));
        System.out.println(calendar.getTimeInMillis());
         %>
	<div class="container">
		<a href="/rideapp/options">Home</a> | <a href="/rideapp/index">Logout</a>
		<h2>List of my Trips</h2> 
		<div class="panel-group"> 
		 <c:forEach items="${myList}" var="item">  
		    <c:if test="${item[1].status eq '1'}">
			<div class="panel panel-info">
				<div class="panel-heading">
				NOW	   <c:out value="${item[1].triptime}" /> / From :
					   <c:out value="${item[1].origine}" />  to :
					   <c:out value="${item[1].destination}" /> / Price:
					   <c:out value="${item[1].price}" />  
				</div>
				<div class="panel-body">
					Name: 
					<span id="name"></span>
			<script type="text/javascript"> 
			   $.get("/rideapp/user/<c:out value="${item[0].clientID}" />",
			  function(data) { 
				   $("#name").append(data);
			    //alert(data.name);
			  }
			);
			   </script>
			 /  Contact:
				   <c:out value="${item[1].contact}" />
				</div>
			</div>	
			</c:if>   		 
		</c:forEach>    
		 
		</div>
	</div><!-- /container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="https://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js">
	</script> 
 
</body>
</html>