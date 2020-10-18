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

	<%
	

		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		
		String custName0 = request.getParameter("customer_name");
    	String flightNum0 = request.getParameter("flight_id");
    	String flightNum = "'" + flightNum0 + "'";
    	
    	String custName = "'" + custName0 + "'";
    	out.print("<br>");
    	
	    
		try {
	

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			
	///////////////////////////////////////////////////////
	//LIST OF RESERVATIONS BY FLIGHT ID/NUMBER
	///////////////////////////////////////////////////////	
	
		
			if (flightNum0 != null){
				
			
			String query = "SELECT * FROM R_buys_relates_customer_ticket  WHERE flight_id = " + flightNum0 + ";";
			ResultSet resultFlightNum = stmt.executeQuery(query);
			
			
			//Make table to list reservation by flight number
			out.print("List of Reservations by Flight Number: " +  "<mark>" + flightNum0 + "</mark>");
			out.print("<br>");
			out.print("<br>");
	
			
			out.print("<table>");
			out.print("<tr>");
				out.print("<th> Customer ID 	</th>");
				out.print("<th> Ticket Number 	</th>");
				out.print("<th> Date of Purchase 	</th>");
				out.print("<th> Flight ID 	</th>");
				out.print("<th> Class 	</th>");
				out.print("<th> Airline ID 	</th>");
			out.print("</tr>");
			
			while (resultFlightNum.next()){
			out.print("<tr>");
			
				out.print("<td>");
				out.print(resultFlightNum.getString("customer_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(resultFlightNum.getInt("ticket_num"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(resultFlightNum.getDate("date_of_purchase"));
				out.print("</td>");
				
				out.print("<td>");
				out.print("<mark>" + resultFlightNum.getInt("flight_id") + "</mark>");
				out.print("</td>");
				
				out.print("<td>");
				out.print(resultFlightNum.getString("class"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(resultFlightNum.getString("airline_id"));
				out.print("</td>");
				
				out.print("</tr>");
			}
			
	
		
		out.print("</table>");
		
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
			}
	
			
			
	///////////////////////////////////////////////////////
		//LIST OF RESERVATIONS BY CUSTOMER NAME	
	///////////////////////////////////////////////////////
	
	
			if (custName0 != null){
				
			String query ="SELECT * FROM R_buys_relates_customer_ticket b JOIN Customer c ON c.username = b.customer_id WHERE c.name =  " + custName;
			ResultSet resultCustName = stmt.executeQuery(query);
			
			//make table for list of reservations by customer name	
			out.print("List of Reservations for customer : " + "<mark>" + custName0 + "</mark>");
			out.print("<br>");
			out.print("<br>");
			
			out.print("<table>");
			out.print("<tr>");
				out.print("<th> Customer ID </th>");
				out.print("<th> Ticket Number</th>");
				out.print("<th> Date of Purchase </th>");
				out.print("<th> Flight ID </th>");
				out.print("<th> Class  </th>");
				out.print("<th> Airline ID </th>");
			out.print("</tr>");
			
			while (resultCustName.next()){
				out.print("<tr>");
				
					out.print("<td>");
					out.print(resultCustName.getString("customer_id"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(resultCustName.getInt("ticket_num"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(resultCustName.getDate("date_of_purchase"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(resultCustName.getInt("flight_id"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(resultCustName.getString("class"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(resultCustName.getString("airline_id"));
					out.print("</td>");
					
					out.print("</tr>");
			
			}
		
	
			
	
		
		out.print("</table>");
			
			}
			
		
			

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>