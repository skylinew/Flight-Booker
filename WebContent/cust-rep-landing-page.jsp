<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome </title>
</head>
<body>
	<%

		
	out.print("airport options:");%>
	<br>
	<form method="post" action="add-airport.jsp">
		<input type="submit" value="Add airport" >
	</form>
	<form method="post" action="edit-airport.jsp">
		<input type="submit" value="Edit airport" >
	</form>
	<form method="post" action="delete-airport.jsp">
		<input type="submit" value="Delete airport" >
	</form>
		
	<br>
	<br>
	<%out.print("aircraft options:");%>
	
	<form method="post" action="add-aircraft.jsp">
		<input type="submit" value="Add aircraft" >
	</form>
	<form method="post" action="edit-aircraft.jsp">
		<input type="submit" value="Edit aircraft" >
	</form>
	<form method="post" action="delete-aircraft.jsp">
		<input type="submit" value="Delete aircraft" >
	</form>	
	<br>
	<br>
	<%out.print("flight options:");%>
	<form method="post" action="add-flight.jsp">
		<input type="submit" value="Add flight" >
	</form>
	<form method="post" action="edit-flight.jsp">
		<input type="submit" value="Edit Flight" >
		</form>
	<form method="post" action="delete-flight.jsp">
		<input type="submit" value="Delete flight" >
	</form>
	<br><br>
	<%out.print("user options:");%>
	<form method="post" action="make-reservation-for-user.jsp">
		<input type="submit" value="Make reservations for a user" >
	</form>
	<form method="post" action="edit-reservation-for-user.jsp">
					<input type="submit" value="Edit reservations for a user" >
				</form>
	<form method="post" action="cancel-reservation-for-user.jsp">
		<input type="submit" value="Cancel reservations for a user" >
	</form>
	<br><br>
	<%out.print("other options:");%>			
	<form method="post" action="view-all-flight-info.jsp">
		<input type="submit" value="View all flight info" >
	</form>
	
	<form method="post" action="flight-waiting-list.jsp">
		<input type="submit" value="View flight waiting lists" >
	</form>
	<br><br><br>
	<form method="post" action="log-out.jsp">
		<input type="submit" value="Log out" >
	</form>
					

	
			
			
		

		

</body>
</html>