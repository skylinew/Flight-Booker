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
		
		String id0 = request.getParameter("AirportID");
		String idU = id0.toUpperCase();
		String id = "'" + idU + "'";
		out.print("<br>");
		
    	
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			
			String query = "SELECT * FROM Flight f WHERE f.dept_airpt_id = " +  id + "OR f.arriv_airpt_id = " + id + ";";
			
			ResultSet flightSet= stmt.executeQuery(query);
			
			
			out.print("Flights by Airport ID: " + id0);
			
			out.print("<table>");
			out.print("<tr>");
				out.print("<th> Flight ID </th>");
				out.print("<th> Is Domestic</th>");
				out.print("<th> Depart Date </th>");
				out.print("<th> Depart Time </th>");
				out.print("<th> Arrival Date  </th>");
				out.print("<th> Arrival Time </th>");
				out.print("<th> Departing Airport ID  </th>");
				out.print("<th> Arriving Airport ID </th>");
				out.print("<th> Airline ID  </th>");
				out.print("<th> Aircraft ID </th>");
				out.print("<th> Tickets Bought </th>");
				out.print("<th> Waiting List Size  </th>");
				
			out.print("</tr>");
			
			while (flightSet.next()){
	
			out.print("<tr>");
			
				out.print("<td>");
				out.print(flightSet.getInt("flight_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getInt("isDomestic"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getDate("depart_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getTime("depart_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getDate("arrival_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getTime("arrival_time"));
				out.print("</td>");
				
				out.print("<td>");
				if (idU.equals(flightSet.getString("dept_airpt_id"))) out.print("<mark>" + flightSet.getString("dept_airpt_id") + "</mark>");
				else  out.print(flightSet.getString("dept_airpt_id"));
				out.print("</td>");
				
				out.print("<td>");
				if ((flightSet.getString("arriv_airpt_id")).equals(idU)) out.print("<mark>" + flightSet.getString("arriv_airpt_id") + "</mark>");
				else  out.print(flightSet.getString("arriv_airpt_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getString("airline_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getString("aircraft_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(flightSet.getInt("tickets_bought"));
				out.print("</td>");
		
		
				
				out.print("<td>");
				out.print(flightSet.getInt("waiting_list_size"));
				out.print("</td>");
				
			
	
			}
		out.print("</table>");
				
			db.closeConnection(con);
		} 
			catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>