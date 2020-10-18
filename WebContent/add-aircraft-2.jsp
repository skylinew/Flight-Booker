<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aircraft</title>
</head>
<body>


<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		int aircraft_id = Integer.parseInt(request.getParameter("aircraft_id"));
		int num_of_seats = Integer.parseInt(request.getParameter("num_of_seats"));
		String airline_id = request.getParameter("airline_id");
		


		String insert = "INSERT INTO Aircraft(aircraft_id, num_of_seats, airline_id)"
				+ "VALUES (?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		

		ps.setInt(1, aircraft_id);		
		ps.setInt(2, num_of_seats);
		ps.setString(3, airline_id);
		ps.executeUpdate();

		con.close();

		out.print("Aircraft added");
		%>
		<br>
		<br>
		<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
		<% 
		
	} catch (Exception ex) {
		out.print("Aircraft not added");%>
		<br>
		<br>
		<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
		<% 
	}
%>
</body>
</html>