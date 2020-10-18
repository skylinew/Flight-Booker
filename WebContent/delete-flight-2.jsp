<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete flight</title>
</head>
<body>


<%
	try {
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		int flight_id = Integer.parseInt(request.getParameter("flight_id"));
		String airline_id = request.getParameter("airline_id");
		
		String select = "SELECT * FROM Flight where airline_id = '"+ airline_id +"' and flight_id = "+flight_id;
		ResultSet result = stmt.executeQuery(select);

		
		if (!result.next()){

			out.print("Flight doesn't exist");
			return;

		}
		


		String deleteFlight = "DELETE FROM Flight where flight_id = '"+ flight_id +"' and airline_id = '" +airline_id+"'";
		System.out.println(deleteFlight);
		PreparedStatement psDelete = con.prepareStatement(deleteFlight);
		psDelete.executeUpdate();
		
		
		
		String deleteTicket1 = "DELETE FROM R_buys_relates_customer_ticket where flight_id = '"+ flight_id +"' and airline_id = '" +airline_id+"'";
		System.out.println(deleteTicket1);
		PreparedStatement psDelete1 = con.prepareStatement(deleteTicket1);
		psDelete1.executeUpdate();
		
		
		out.print("Flight deleted");
		%>
		<br>
		<br>
		<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
		<% 
		
	} catch (Exception ex) {
		out.print("Fill in the form correctly");%>
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