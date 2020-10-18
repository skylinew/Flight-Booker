<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel reservations</title>
</head>
<body>
<% out.print("Enter the ticket number for the reservation you want to cancel"); %>	
<form method="post">
	<table>
	<tr>    
	<td>Ticket number</td><td><input type="text" name="ticket_number"></td>
	</tr>
	</table>
	
	<br> <br>
	<input type="submit" value="Cancel reservation"  onclick="form.action='cancel-reservation-for-user-2.jsp'">
	</form>
	<br><br>
	<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>

</body>
</html>