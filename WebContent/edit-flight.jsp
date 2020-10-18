<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit an aircraft</title>
</head>
<body>
<% out.print("Enter the info of the flight you want to update"); %>	
<form method="post">
	<table>
	<tr>    
	<td>Flight ID (int)</td><td><input type="text" name="flight_id"></td>
	</tr>
	<tr>
	<td>Airline ID</td><td><input type="text" name="airline_id"></td>
	</tr>
	</table>
	<br> <br>
	<% out.print("Enter the new info of the flight"); %>	
		<table>
	<tr>    
	<td>Flight ID (int)</td><td><input type="text" name="new_flight_id"></td>
	</tr>
	<tr>    
	<td>Domestic/International (enter 0 for domestic and 1 for international)</td><td><input type="text" name="new_domestic"></td>
	</tr>
	<tr>
	<td>Depart date(YYYY-MM-DD)</td><td><input type="text" name="new_depart_date"></td>
	</tr>
	<tr>
	<td>Depart time(HH:MM in military time) </td><td><input type="text" name="new_depart_time"></td>
	</tr>
	<tr>
	<td>Arrival date(YYYY-MM-DD)</td><td><input type="text" name="new_arrival_date"></td>
	</tr>
	<tr>
	<td>Arrival time(HH:MM in military time)</td><td><input type="text" name="new_arrival_time"></td>
	</tr>
	<tr>
	<td>Departure airport ID</td><td><input type="text" name="new_depart_apt_id"></td>
	</tr>
	<tr>
	<td>Arrival airport ID</td><td><input type="text" name="new_arriv_apt_id"></td>
	</tr>
	<tr>
	<td>Airline ID</td><td><input type="text" name="new_airline_id"></td>
	</tr>
	<tr>
	<td>Aircraft ID</td><td><input type="text" name="new_aircraft_id"></td>
	</tr>
	<tr>
	<td>Price</td><td><input type="text" name="new_price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Edit flight"  onclick="form.action='edit-flight-2.jsp'">
	</form>
	<br><br>
	<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
</body>
</html>