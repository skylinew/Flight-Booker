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
<title>Waiting list</title>
</head>
<body>

	<%
	    
		try {
			
			int flight_id = Integer.parseInt(request.getParameter("flight_id")); //USE THIS AMANY
			String airline_id = request.getParameter("airline_id"); //USE THIS AMANY
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM  R_has_waitinglist_customer_flight where airline_id = '"+ airline_id + "' and flight_id = "+flight_id; //USE THIS AMANY
			System.out.println(str);
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Flight ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			
			out.print("Cusomter ID");
			out.print("</td>");
			out.print("<td>");
			
			out.print("Priority Number");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Airline ID");
			out.print("</td>");
			out.print("<td>");	
			
		
			
			
			

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("flight_id"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				
				out.print(result.getString("customer_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("priority_num"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
			

			}
			out.print("</table>");
			%>
			
			
			<br>
			<br>
			<form method="post" action="cust-rep-landing-page.jsp">
				<input type="submit" value="Go back to the main page" >
				</form>
				
		<% 

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print("oops");
		}
	%>

</body>