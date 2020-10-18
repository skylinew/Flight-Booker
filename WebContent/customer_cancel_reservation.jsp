<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import= "java.time.format.DateTimeFormatter"%>
<%@ page import= "java.time.LocalDateTime"%>
<%@ page import ="java.lang.*"%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upcoming Flights</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			
			String customer_id = "'" + request.getParameter("customer_id") + "'";
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime now = LocalDateTime.now();
			String Date = now + " ";
 			String Datee = "'" + Date.substring(0, 10) + "'";
 			
			String str = "Select * from Flight, R_buys_relates_customer_ticket R where Flight.flight_id = R.flight_id and Flight.airline_id = R.airline_id and R.customer_id = " + customer_id + " and Flight.depart_date >= " + Datee  + " and Flight.flight_id in (Select flight_id from R_buys_relates_customer_ticket where customer_id = " + customer_id + ")";

			ResultSet rs = stmt.executeQuery(str);
		
			%>
			<br><br>
			
			 
			<br><br>
						
			<table>
		  					<tr>
		  						<td width =80>	Flight ID </td>
		  						<td width =130>  Departure Airport </td>
		  						<td width =130>  Arrival Airport </td>
		  						<td width =80>	Airline </td>
		  						<td width =130>	Departure Date </td>
		  						<td width =130>	Arrival Date </td>
		  						<td width =130>	Departure Time </td>
		  						<td width =130>	Arrival Time </td>
		  						<td width =80>	Price </td>
		  						<td width =80>	Ticket Number </td>
		  						 					
		  					</tr>
		  				</table>
	 	<%	while (rs.next()){ %>
	 		  	<form method="post">
	  				<table>
	  					<tr>
						<td width =80>	<%  out.print(rs.getString("Flight.flight_id")); %> </td>
						<td width =130> <%  out.print(rs.getString("Flight.dept_airpt_id"));%> </td>
						<td width =130> <%  out.print(rs.getString("Flight.arriv_airpt_id"));%> </td>
						<td width =80>	<%  out.print(rs.getString("Flight.airline_id")); %> </td>
						<td width =130>	<%  out.print(rs.getString("Flight.depart_date")); %> </td>
						<td width =130>	<%  out.print(rs.getString("Flight.arrival_date")); %> </td>
						<td width =130>	<%  out.print(rs.getString("Flight.depart_time")); %></td>
						<td width =130>	<%  out.print(rs.getString("Flight.arrival_time")); %> </td>
						<td width =80>	<%  out.print(rs.getString("Flight.price")); %> </td>
						<td width =80>	<%  out.print(rs.getString("R.ticket_num")); %> </td>
	  					<td><input  type="hidden" name="ticket_number" value="<%=rs.getString("R.ticket_num")%>"></td>
						<td><input type="submit" value="Cancel This Reservation" onclick="form.action='cancel-reservation-for-user-2.jsp'"></td>
						</tr>
						
	  				</table>
	  				</form>
	  				
	  			
	  			
					
	  			<%  }  
			con.close();
		} catch (Exception e) {
			out.print("Please Try Again");
			

		}
	%>

</body>
</html>