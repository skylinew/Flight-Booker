<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight</title>
</head>
<body>


	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		


		int flight_id = Integer.parseInt(request.getParameter("flight_id"));

		int domestic = Integer.parseInt(request.getParameter("domestic"));

		if (domestic != 0 && domestic !=1) {
			out.print("Enter a valid value for the domestic/international field");%>
	<br>
	<br>
	<form method="post" action="cust-rep-landing-page.jsp">
		<input type="submit" value="Go back to the main page">
	</form>
	<%
		}
		String departDate = request.getParameter("depart_date");

		String departTime = request.getParameter("depart_time");

		String arrivalDate = request.getParameter("arrival_date");

		String arrivalTime = request.getParameter("arrival_time");

		String deptAptID = request.getParameter("depart_apt_id");

		String arrivAptID = request.getParameter("arriv_apt_id");

		String airline_id = request.getParameter("airline_id");

		int aircraft_id = Integer.parseInt(request.getParameter("aircraft_id"));

		int price = Integer.parseInt(request.getParameter("price"));


		
		


		String insert = "INSERT INTO Flight VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		

		ps.setInt(1, flight_id);	

		ps.setInt(2, domestic);
		ps.setString(3, departDate);
		ps.setString(4, departTime);
		ps.setString(5, arrivalDate);
		ps.setString(6, arrivalTime);

		ps.setString(7, deptAptID);
		ps.setString(8, arrivAptID);
		ps.setString(9, airline_id);		
		ps.setInt(10, aircraft_id);	
		ps.setInt(11, 0);

		ps.setInt(12, 0);
		ps.setInt(13, price);
		

		
		ps.executeUpdate();
		
		/*int layovers = Integer.parseInt(request.getParameter("layovers"));
		int round_trip = Integer.parseInt(request.getParameter("round_trip"));
		int total_fare = Integer.parseInt(request.getParameter("arrival_date"));
		int cancel_fee = Integer.parseInt(request.getParameter("cancel_fee"));
		
		


		String insert2 = "INSERT INTO R_AssociatedWith_Ticket (layovers, round_trip, total_fare, flight_id, arrival_date, arrival_time, dept_airpt_id, arriv_airpt_id, airline_id, aircraft_id)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps2 = con.prepareStatement(insert2);
		

		ps.setInt(1, flight_id);		
		ps.setInt(2, domestic);
		ps.setString(3, departDate);
		ps.setString(4, departTime);
		ps.setString(5, arrivalDate);
		ps.setString(6, arrivalTime);
		ps.setString(7, deptAptID);
		ps.setString(8, arrivAptID);
		ps.setInt(9, airline_id);		
		ps.setInt(10, aircraft_id);	 */	


		con.close();

		out.print("Flight added");
		%>
	<br>
	<br>
	<form method="post" action="cust-rep-landing-page.jsp">
		<input type="submit" value="Go back to the main page">
	</form>
	<% 
		
	} catch (Exception ex) {
		out.print(ex);%>
	<br>
	<br>
	<form method="post" action="cust-rep-landing-page.jsp">
		<input type="submit" value="Go back to the main page">
	</form>
	<% 
	}
%>
</body>
</html>