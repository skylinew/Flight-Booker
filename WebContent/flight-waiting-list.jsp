<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter flight number</title>
</head>
<body>
<form method="post">
	<table>
	<tr>    
	<td>Flight ID (int)</td><td><input type="text" name="flight_id"></td>
	</tr>
	<tr>
	<td>Airline ID </td><td><input type="text" name="airline_id"></td>
	</tr>
	</table>
	<br>
	
	<input type="submit" value="View waiting list"  onclick="form.action='flight-waiting-list-2.jsp'">
	</form>
	<br><br>
	<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>

</body>
</html>


