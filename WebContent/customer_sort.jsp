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

		
		String sort = request.getParameter("sort");		
		String st = request.getParameter("str");
		String st2 = request.getParameter("str2");


		String newSt, newSt2;
		ResultSet rs1;
		ResultSet rs2;
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
		
		if (sort.equals("price"))
		{
			newSt = st + " order by price ASC";
			newSt2 = st2 + " order by price ASC";
		}
		else if(sort.equals("takeofftime"))
		{
			newSt = st + " order by depart_time ASC";
			newSt2 = st2 + " order by depart_time ASC";
			}
		else
		{
			newSt = st + " order by arrival_time ASC";
			newSt2 = st2 + " order by arrival_time ASC";	
			}
		  				
		  				%>
			  			<br> The first flight <br>
			  			<%   
		  				rs1 = stmt.executeQuery(newSt);
		  				
		  				while (rs1.next()){%>
			  				<table>
			  					<tr>
			  						<td width =80>	<%  out.print(rs1.getString("flight_id")); %> </td>
			  						<td width =130> <%  out.print(rs1.getString("dept_airpt_id"));%> </td>
			  						<td width =130> <%  out.print(rs1.getString("arriv_airpt_id"));%> </td>
			  						<td width =80>	<%  out.print(rs1.getString("airline_id")); %> </td>
			  						<td width =130>	<%  out.print(rs1.getString("depart_date")); %> </td>
			  						<td width =130>	<%  out.print(rs1.getString("arrival_date")); %> </td>
			  						<td width =130>	<%  out.print(rs1.getString("depart_time")); %></td>
			  						<td width =130>	<%  out.print(rs1.getString("arrival_time")); %> </td>
									<td width =80>	<%  out.print(rs1.getString("price")); %> </td>
			  					</tr>
			  				</table>							
			  			<%  }  %>
			  			<br><br> The second flight <br>
			  			<%   
		  				
		  				rs2 = stmt.executeQuery(newSt2);

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

		<br>
		<br>
		<form method="post" action="log-out.jsp">
			<input type="submit" value="Log out" >
			</form>
	<%} catch (Exception ex) {
		out.print("No inf available");
		
			
		%>
					
		<br>
		<br>
		
	<%}%>
</body>
</html>