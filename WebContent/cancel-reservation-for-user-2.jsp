<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel reservations</title>
</head>
<body>

<% 
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		
		 int tickets_bought=0; String flightClass=""; int loopRan=0;

	
		int ticket_number = Integer.parseInt(request.getParameter("ticket_number"));  //amany
		 
			String query2 = "SELECT * FROM R_buys_relates_customer_ticket where ticket_num = "+ ticket_number;

			ResultSet rs2 = stmt.executeQuery(query2);


			 while (rs2.next()){

		        flightClass = rs2.getString("class");
		        
		        loopRan=1;
		        
		        
		      }
			if (loopRan ==0) {
				out.print("Not a valid ticket number");
				return;

			}
		
		 
			String query3 = "DELETE FROM R_buys_relates_customer_ticket where ticket_num = "+ ticket_number;
			PreparedStatement psDelete = con.prepareStatement(query3);
			psDelete.executeUpdate();
			

		

		out.print("Reservation cancelled"); %>

	<br>
	<%
		if (!flightClass.toLowerCase().equals("first")) {
			out.print("You will be charged a $10 cancellation fee");
		}
		%>


	<br>
	<br>
	<form method="post" action="customer_welcome2.jsp">
		<input type="submit" value="Go back to the main page">
	</form>
	<% 
		
	} catch (Exception ex) {
		out.print(ex);%>
	<br>
	<br>
	<form method="post" action="customer_welcome2.jsp">
		<input type="submit" value="Go back to the main page">
	</form>
	<% 
	}
%>
</body>
</html>