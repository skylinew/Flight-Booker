<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit reservations for a user</title>
</head>
<body>

	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM  Flight";
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
			
			out.print("Domestic?");
			out.print("</td>");
			out.print("<td>");
			
			out.print("Depart date");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Depart time");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Arrival date");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Arrival time");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Departure Airport");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Arrival Airport");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Airline ID");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Aircraft ID");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Tickets bought");
			out.print("</td>");
			out.print("<td>");	
			
			out.print("Price");
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
				
				out.print(result.getString("isDomestic"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("depart_date"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("depart_time"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("arrival_date"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("arrival_time"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("dept_airpt_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("arriv_airpt_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("aircraft_id"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("tickets_bought"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				out.print(result.getString("price"));
				out.print("</td>");
				out.print("<td>");
				//out.print("</tr>");
				
				

			}
			out.print("</table>");
			%>
			<br><br>
			<form method="post">
			
			<% out.print("Enter the ticket numnber you want to change"); %>
			<table>
			<tr>    
			<td>Ticket number</td><td><input type="text" name="ticket_number"></td>
			</tr>
			</table>
			<br><br>
			<% out.print("Enter info of the new first flight for this ticket"); %>
			<table>
			<tr>    
			<td>Flight ID (int)</td><td><input type="text" name="first_flight_id"></td>
			</tr>
			<tr>    
			<td>Airline ID</td><td><input type="text" name="first_airline_id"></td>
			</tr>
			</table>
			<br><br>
			<% out.print("Enter info of the new second flight (leave blank if no second flight)"); %>
			<table>
			<tr>    
			<td>Flight ID (int)</td><td><input type="text" name="second_flight_id"></td>
			</tr>
			<tr>    
			<td>Airline ID</td><td><input type="text" name="second_airline_id"></td>
			</tr>
			</table>
			<br><br>
			<% out.print("Enter the class for the tickets"); %>
			<table>
			<tr>    
			<td>Class</td><td><input type="text" name="class"></td>
			</tr>
			</table>
			
			
			<input type="submit" value="Make reservations"  onclick="form.action='edit-reservation-for-user-2.jsp'">
			</form>
			
			
			
			
			
			
			
			
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
</html>
