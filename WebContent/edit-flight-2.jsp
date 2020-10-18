<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aircraft</title>
</head>
<body>


	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		int flight_id = Integer.parseInt(request.getParameter("flight_id"));
		String airline_id = request.getParameter("airline_id");
		
		
		int new_flight_id = Integer.parseInt(request.getParameter("new_flight_id"));
		
		int new_domestic = Integer.parseInt(request.getParameter("new_domestic"));

		String new_departDate = request.getParameter("new_depart_date");

		String new_departTime = request.getParameter("new_depart_time");

		String new_arrivalDate = request.getParameter("new_arrival_date");

		String new_arrivalTime = request.getParameter("new_arrival_time");

		String new_deptAptID = request.getParameter("new_depart_apt_id");

		String new_arrivAptID = request.getParameter("new_arriv_apt_id");

		String new_airline_id = request.getParameter("new_airline_id");

		int new_aircraft_id = Integer.parseInt(request.getParameter("new_aircraft_id"));

		int new_price = Integer.parseInt(request.getParameter("new_price"));


		
		String select = "SELECT * FROM Flight where airline_id = '"+ airline_id +"' and flight_id = "+flight_id;
		
		ResultSet result = stmt.executeQuery(select);

		
		if (!result.next()){

			out.print("Flight doesn't exist");
			return;

		}


		String update = "UPDATE Flight set flight_id = '"+ new_flight_id +"', isDomestic = " +new_domestic+", depart_date = '" + new_departDate +"',  depart_time = '" + new_departTime +"', arrival_date = '"
		+ new_arrivalDate +"', arrival_time = '" + new_arrivalTime + "',dept_airpt_id = '" + new_deptAptID + "', arriv_airpt_id = '"+new_arrivAptID+ "', airline_id = '"+new_airline_id+ "', aircraft_id = "
		+new_aircraft_id + ", price = "+ new_price +" where airline_id = '"+ airline_id +"' and flight_id = "+flight_id;
		
		System.out.println(update);
		PreparedStatement psDelete = con.prepareStatement(update);
				

		//psDelete.setInt(1, aircraft_id);		
		//psDelete.setInt(2, num_of_seats);
		//psDelete.setString(3, airline_id);
		psDelete.executeUpdate();



		con.close();

		out.print("Flight edited");
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