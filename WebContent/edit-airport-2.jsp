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

		String airport_id = request.getParameter("airport_id");
		
		String new_airport_id = request.getParameter("new_airport_id");
		
		String new_airport_name = request.getParameter("new_airport_name");
		
		String select = "SELECT * FROM Airport where airport_id = '"+ airport_id +"'"; 
		ResultSet result = stmt.executeQuery(select);

		
		if (!result.next()){

			out.print("Airport doesn't exist");
			return;

		}


		String update = "UPDATE Airport set airport_id = '"+ new_airport_id +"', name = '" +new_airport_name+"' where airport_id = '"+ airport_id +"'";
		PreparedStatement psDelete = con.prepareStatement(update);
		System.out.println(update);
		

		//psDelete.setInt(1, aircraft_id);		
		//psDelete.setInt(2, num_of_seats);
		//psDelete.setString(3, airline_id);
		psDelete.executeUpdate();



		con.close();

		out.print("Airport edited");
		%>
		<br>
		<br>
		<form method="post" action="cust-rep-landing-page.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
		<% 
		
	} catch (Exception ex) {
		out.print("Airport not edited");%>
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