<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.lang.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights sorted by flights</title>
</head>
<body>

	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String str = "'" + request.getParameter("str") + "'";
		out.print(str);
		out.print(str);

		
		ResultSet rs = stmt.executeQuery(str);
		%>
		
		
		
		
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
  						<td width =130>	Number Of Stops </td>
  						<td width =80>	Price </td>
  						
  						
  						 					
  					</tr>
  				</table>
 	<%	while (rs.next()){ %>
  			<form method="post" action = "selectFlight.jsp">
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
  						<td width =130>	<%  out.print(rs.getString("layovers")); %> </td>
						<td width =80>	<%  out.print(rs.getString("total_fare")); %> </td>
  						
  					    <td><input  type="hidden" name="flight_id" value="<%=rs.getString("flight_id")%>"></td>	
  					    <td><input  type="hidden" name="airline_id" value="<%=rs.getString("airline_id")%>"></td>								
  						<td><input type="submit" value="select"></td>				
  					</tr>
  				</table>
  			</form>
  			<%  }  
		con.close();%>

		<br>
		<br>
		<form method="post" action="log-out.jsp">
			<input type="submit" value="Log out" >
			</form>
	<%} catch (Exception ex) {
		out.print("Please fill in the information");%>
		<br>
		<br>
		
	<%}%>
</body>
</html>