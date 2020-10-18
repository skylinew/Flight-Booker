<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.lang.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available Flights</title>
</head>
<body>

	
<br><br>
<strong>Available Flights</strong><br><br>
	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String departureAirport = "'" + request.getParameter("from") + "'";
		String destinationAirport = "'" + request.getParameter("to") + "'";
		String departureDate = "'" +  request.getParameter("dDate") + "'";
		String returnDate = "'" +  request.getParameter("rDate") + "'";
		
		String round_trip = "'" + request.getParameter("round_trip") + "'";
	
		String flexible = request.getParameter("flexible");
		String pdepartureAirport = departureAirport;
		String pdestinationAirport  = destinationAirport;

		
		
		String str;
		String str2;
		if (flexible.equals("true")){
			if(round_trip.equals("'1'")){  
				str = "select * from Flight where Flight.dept_airpt_id = " +  departureAirport + " and Flight.arriv_airpt_id = " + destinationAirport 
						+ " and (Flight.depart_date = " + departureDate + " or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 3 DAY)" + " or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = SUBDATE("+ departureDate + ", INTERVAL 3 DAY) )"
						+ " and Flight.arrival_date <  ADDDATE("+ returnDate+ ", INTERVAL 3 DAY)";
				str2 = "select * from Flight  where dept_airpt_id = " +  destinationAirport + " and arriv_airpt_id = " + departureAirport 
						+ " and (Flight.depart_date = " + returnDate + " or Flight.depart_date = ADDDATE("+ returnDate+ ", INTERVAL 1 DAY) or Flight.depart_date = ADDDATE("+ returnDate+ ", INTERVAL 2 DAY) or Flight.depart_date = ADDDATE("+ returnDate+ ", INTERVAL 3 DAY)" + " or Flight.depart_date = SUBDATE("+ returnDate+ ", INTERVAL 1 DAY) or Flight.depart_date = SUBDATE("+ returnDate+ ", INTERVAL 2 DAY) or Flight.depart_date = SUBDATE("+ returnDate+ ", INTERVAL 3 DAY) )";
				ResultSet rs2 = stmt.executeQuery(str2);%>
					
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
		  						 					
		  					</tr>
		  				</table>
		  				
		 	<%	while (rs2.next()){ %>
		  				<table>
		  					<tr>
		  						<td width =80>	<%  out.print(rs2.getString("flight_id")); %> </td>
		  						<td width =130> <%  out.print(rs2.getString("dept_airpt_id"));%> </td>
		  						<td width =130> <%  out.print(rs2.getString("arriv_airpt_id"));%> </td>
		  						<td width =80>	<%  out.print(rs2.getString("airline_id")); %> </td>
		  						<td width =130>	<%  out.print(rs2.getString("depart_date")); %> </td>
		  						<td width =130>	<%  out.print(rs2.getString("arrival_date")); %> </td>
		  						<td width =130>	<%  out.print(rs2.getString("depart_time")); %></td>
		  						<td width =130>	<%  out.print(rs2.getString("arrival_time")); %> </td>
								<td width =80>	<%  out.print(rs2.getString("price")); %> </td>
		  							
		  					</tr>
		  				</table>
						
		  			<%  }  
			}
			else {
				str = "select * from Flight where Flight.dept_airpt_id = " +  departureAirport + " and Flight.arriv_airpt_id = " + destinationAirport 
						+ " and (Flight.depart_date = " + departureDate + " or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 3 DAY)" + " or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = SUBDATE("+ departureDate + ", INTERVAL 3 DAY) )"
						;
				str2 =  "select * from Flight where Flight.dept_airpt_id = " +  departureAirport + " and  Flight.arriv_airpt_id <> " + destinationAirport
						+ " and (Flight.depart_date = " + departureDate + " or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = ADDDATE("+ departureDate+ ", INTERVAL 3 DAY)" + " or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 1 DAY) or Flight.depart_date = SUBDATE("+ departureDate+ ", INTERVAL 2 DAY) or Flight.depart_date = SUBDATE("+ departureDate + ", INTERVAL 3 DAY) )"
						+ " and Flight.arriv_airpt_id in("
						+ "select Flight.dept_airpt_id from Flight where Flight.arriv_airpt_id = " + destinationAirport + " )"
						+ " union "
						+ "select * from Flight where Flight.arriv_airpt_id = " + destinationAirport + " and Flight.dept_airpt_id <> " +  departureAirport
						+ " and Flight.dept_airpt_id in ( "
						+ "select Flight.arriv_airpt_id from Flight where Flight.dept_airpt_id = " + departureAirport + ")" 
						;
						%>
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
					 					
				</tr>
			</table>
			<% ResultSet rs2 = stmt.executeQuery(str2);
				while (rs2.next()){ %>
				<table>
					<tr>
						<td width =80>	<%  out.print(rs2.getString("flight_id")); %> </td>
						<td width =130> <%  out.print(rs2.getString("dept_airpt_id"));%> </td>
						<td width =130> <%  out.print(rs2.getString("arriv_airpt_id"));%> </td>
						<td width =80>	<%  out.print(rs2.getString("airline_id")); %> </td>
						<td width =130>	<%  out.print(rs2.getString("depart_date")); %> </td>
						<td width =130>	<%  out.print(rs2.getString("arrival_date")); %> </td>
						<td width =130>	<%  out.print(rs2.getString("depart_time")); %></td>
						<td width =130>	<%  out.print(rs2.getString("arrival_time")); %> </td>
					<td width =80>	<%  out.print(rs2.getString("price")); %> </td>
					</tr>
				</table>
			
			<%  }  
			}
		}
		else {
			if(round_trip.equals("'1'")){
				str = "select * from Flight where Flight.dept_airpt_id = " +  departureAirport 
						+ " and Flight.arriv_airpt_id = " + destinationAirport 
						+ " and Flight.depart_date = " + departureDate
 						+ " and Flight.arrival_date < " + returnDate;
 				str2 = "select * from Flight where Flight.dept_airpt_id = " +  destinationAirport  
						+ " and Flight.arriv_airpt_id = " + departureAirport 
						+ " and Flight.depart_date = " + returnDate;
				ResultSet rs2 = stmt.executeQuery(str2);%>
		 					
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
  						 					
  					</tr>
  				</table>
  				
 	<%	while (rs2.next()){ %>
  				<table>
  					<tr>
  						<td width =80>	<%  out.print(rs2.getString("flight_id")); %> </td>
  						<td width =130> <%  out.print(rs2.getString("dept_airpt_id"));%> </td>
  						<td width =130> <%  out.print(rs2.getString("arriv_airpt_id"));%> </td>
  						<td width =80>	<%  out.print(rs2.getString("airline_id")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("depart_date")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("arrival_date")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("depart_time")); %></td>
  						<td width =130>	<%  out.print(rs2.getString("arrival_time")); %> </td>
						<td width =80>	<%  out.print(rs2.getString("price")); %> </td>
  					</tr>
  				</table>
				
  			<%  }  

				
			 }
			else{
				str = "select * from Flight where Flight.dept_airpt_id = " +  departureAirport 
						+ " and Flight.arriv_airpt_id = " + destinationAirport 
						+ " and Flight.depart_date = " + departureDate;
				str2 =  "select * from Flight where Flight.dept_airpt_id = " +  departureAirport
						+ " and Flight.arriv_airpt_id <> " + destinationAirport
						+ " and Flight.depart_date = " + departureDate
						+ " and Flight.arriv_airpt_id in("
						+ "select Flight.dept_airpt_id from Flight where Flight.arriv_airpt_id = " + destinationAirport + " )"
						+ " union "
						+ "select * from Flight where Flight.arriv_airpt_id = " + destinationAirport
						+ " and Flight.dept_airpt_id <> " +  departureAirport 
						+ " and Flight.dept_airpt_id in ( "
						+ "select Flight.arriv_airpt_id from Flight where Flight.dept_airpt_id = " + departureAirport + ")"; 
				%>
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
  						 					
  					</tr>
  				</table>
  				<% 
  				ResultSet rs2 = stmt.executeQuery(str2);
  				while (rs2.next()){ %>
  				<table>
  					<tr>
  						<td width =80>	<%  out.print(rs2.getString("flight_id")); %> </td>
  						<td width =130> <%  out.print(rs2.getString("dept_airpt_id"));%> </td>
  						<td width =130> <%  out.print(rs2.getString("arriv_airpt_id"));%> </td>
  						<td width =80>	<%  out.print(rs2.getString("airline_id")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("depart_date")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("arrival_date")); %> </td>
  						<td width =130>	<%  out.print(rs2.getString("depart_time")); %></td>
  						<td width =130>	<%  out.print(rs2.getString("arrival_time")); %> </td>
						<td width =80>	<%  out.print(rs2.getString("price")); %> </td>
  					</tr>
  				</table>
				
  			<%  }  
			}
				
		} 		
 
		ResultSet rs = stmt.executeQuery(str);
		%>
		 
					
		
 	<%	while (rs.next()){ %>
  				<table>
  					<tr>
  						<td width =80>	<%  out.print(rs.getString("flight_id")); %> </td>
  						<td width =130> <%  out.print(rs.getString("dept_airpt_id"));%> </td>
  						<td width =130> <%  out.print(rs.getString("arriv_airpt_id"));%> </td>
  						<td width =80>	<%  out.print(rs.getString("airline_id")); %> </td>
  						<td width =130>	<%  out.print(rs.getString("depart_date")); %> </td>
  						<td width =130>	<%  out.print(rs.getString("arrival_date")); %> </td>
  						<td width =130>	<%  out.print(rs.getString("depart_time")); %></td>
  						<td width =130>	<%  out.print(rs.getString("arrival_time")); %> </td>
						<td width =80>	<%  out.print(rs.getString("price")); %> </td>
  									
  					</tr>
  				</table>
				
  			<%  }
  			con.close();%>
  			
  			
  		<br><br>
		Make A Reservation
		<form method="post" action="make-reservation-for-user-2.jsp">
		Enter the following information <br>
			First Flight ID <input type="text" name="first_flight_id">
			First Flight Airline <input type="text" name="first_airline_id">
			<br>
			Second Flight ID <input type="text" name="second_flight_id">
			Second Flight Airline <input type="text" name="second_airline_id">
			<br>
			Ticket Class <input type="text" name="class"> 
			<input type="submit" value="Done" >
			</form>
  			
 	<br><br>
 	Sort By:
 		<form>
 		<select name="sort">
 		  <option value="price">Price</option>
 		  <option value="takeofftime">Take-off time</option>
 		  <option value="landingtime">Landing time</option>
 		</select>
 		  <input  type="hidden" name="str" value="<%=str%>">
 		  <input  type="hidden" name="str2" value="<%=str2%>">
 		  <input type="submit" value="sort"  onclick="form.action='customer_sort.jsp'">
 		</form>
 		<br><br>
 	Filter By:
 	<form>
 		  Enter your maximum budget: <input type="text" name="price">
 		  <br>
 		  Airline: <input type="text" name="airline">
 		  <br>
 		  Number of stops: <input type="text" name="noofstops">
 		  <br> 		  
 		  <input  type="hidden" name="pdep_airport" value="<%=pdepartureAirport%>">
 		  <input  type="hidden" name="parr_airport" value="<%=pdestinationAirport%>">
 		  <input  type="hidden" name="str" value="<%=str%>">
 		  <input  type="hidden" name="str2" value="<%=str2%>">
 		  <input type="submit" value="filter"  onclick="form.action='customer_filter-flight.jsp'">
 		</form>
 		
 		
		<br>
		<br>
		<form method="post" action="log-out.jsp">
			<input type="submit" value="Log out" >
			</form>
	<%} catch (Exception ex) {
		out.print("Please fill in the information");
		
			
		%>
					
		<br>
		<br>
		
	<%}%>
</body>
</html>