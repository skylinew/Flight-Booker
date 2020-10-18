<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="admin_home.jsp"><b>Home</b></a>
<br>
<br>
<br>
<br>


	<%

    	String flightID0 = request.getParameter("Flight ID");
		String  flightID= "'" + flightID0 + "'";
    	String custID0 = request.getParameter("Customer ID");
    	String custID = "'" + custID0  + "'";
    	String airlineID0 = request.getParameter("Airline ID");
    	String airlineID = "'" + airlineID0 + "'";
    	
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();

			
			
			if (flightID0 != null){
			
			String byFlightID = "SELECT SUM(booking_fee) FROM R_buys_relates_customer_ticket  WHERE flight_id = " + flightID +  ";";
			ResultSet resultFlightID= stmt.executeQuery(byFlightID);
			
				if (resultFlightID.next()){
				
				out.print("<table>");
				out.print("<tr>");
					out.print("<th> Flight ID </th>");
					out.print("<th> Total Revenue in Dollars (Booking Fees) </th>");
				out.print("</tr>");
				
				
				out.print("<tr>");
					out.print("<td>");
						 out.print(flightID0);
					out.print("</td>");
						
					out.print("<td>");
					out.print("$" + resultFlightID.getString(1));
				out.print("</td>");
				out.print("</tr>");
		

				out.print("</table>");
				out.print("<br>");
				}
				else out.print("No Revenue Data for this Flight ID");
			}
			
		
			
			if (airlineID0 != null){
			String byAirlineID = "SELECT SUM(b.booking_fee) FROM R_buys_relates_customer_ticket b JOIN Flight f  ON b.flight_id = f.flight_id WHERE f.airline_id = " + airlineID + ";";
			ResultSet resultAirlineID = stmt.executeQuery(byAirlineID);
			
			if (resultAirlineID.next()){
			out.print("<table>");
				out.print("<tr>");
					out.print("<th> Airline ID </th>");
					out.print("<th>Total Revenue in Dollars (Booking Fees) </th>");
				out.print("</tr>");
				
				out.print("<tr>");
				out.print("<td>");
					out.print(airlineID0);
				out.print("</td>");
				
				out.print("<td>");
				out.print("$" + resultAirlineID.getString(1));
				
			out.print("</td>");
			out.print("</tr>");
				
				
			out.print("</table>");	
			}	
			
			else out.print("No Revenue Data for this Airline ID");
			}
			
		
			
			if (custID0 != null){
			String byCustID = "SELECT SUM(b.booking_Fee) FROM R_buys_relates_customer_ticket b WHERE b.customer_id = " + custID;
			ResultSet resultCustID = stmt.executeQuery(byCustID);
			
			
			if (resultCustID.next()){
			out.print("<table>");
				out.print("<tr>");
					out.print("<th> Customer ID </th>");
					out.print("<th>Total Revenue in Dollars(Booking Fees) </th>");
				
				out.print("</tr>");
				
				out.print("<tr>");
				out.print("<td>");
					out.print(custID0);
				out.print("</td>");
				
				out.print("<td>");
				out.print("$" + resultCustID.getString(1));
			out.print("</td>");
			out.print("</tr>");
				
				
			out.print("</table>");	
				
			}
			else out.print("No Revenue Data for this Customer ID");
			}
			
		

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>