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
Trips are <br><hr>
 
<table  >
<tr><th>BookingID</th><th>DriverID</th></tr>
<c:forEach items="${trips}" var="trip">
    <tr>
        <td> <c:out value="${trip.bookingID}"/></td>
        <td>  <c:out value="${trip.driverID}"/></td>  
    </tr>
</c:forEach>

</table>

</body>
</html>