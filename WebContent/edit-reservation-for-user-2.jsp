<!-- @author Allison Coopersmith -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit reservations</title>
</head>
<body>

<% 
	try {
		
		System.out.println("1");

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		
		 int tickets_bought=0; int loopRan=0;
		 
		 
		//variables i use in loops, so i intialize them at the beginning
			int first_loopRan = 0;
			int first_aircraft_id = 0;
			int first_tickets_bought = 0;
			int first_numSeats = 0;
			int first_total_fare = 0;
			int first_waiting_list_size = 0;
			String first_arrivingApt = "";
			String first_departingApt = "";
			int second_loopRan = 0;
			int second_aircraft_id = 0;
			int second_tickets_bought = 0;
			int second_numSeats = 0;
			int second_total_fare = 0;
			int second_waiting_list_size = 0;
			String second_arrivingApt = "";
			String second_departingApt = "";
			int second_flight_id = 0;
			
			String customerID="";
			
			System.out.println("2");


	
		int ticket_num = Integer.parseInt(request.getParameter("ticket_number"));
		String flightClass = request.getParameter("class");
		
		long millis = System.currentTimeMillis();

		java.sql.Date date = new java.sql.Date(millis);
		
		
		System.out.println("3");

		 
		
		//make sure the ticket number is good
			String query2 = "SELECT * FROM R_buys_relates_customer_ticket where ticket_num = "+ ticket_num;
			System.out.println(query2);

			ResultSet rs2 = stmt.executeQuery(query2);
			System.out.println(query2);
	

			 while (rs2.next()){

		        date = rs2.getDate("date_of_purchase");
		        
				customerID = rs2.getString("customer_id");


		        
		        loopRan=1;
		        
		        
		      }
			 
			if (loopRan ==0) {
				out.print("Not a valid ticket number");
				return;

			}
			
			//information the user inputted
			
			int first_flight_id = Integer.parseInt(request.getParameter("first_flight_id"));
			String first_airline_id = request.getParameter("first_airline_id");

			String second_airline_id = request.getParameter("second_airline_id");
			if (second_airline_id.length() > 0) {
				second_flight_id = Integer.parseInt(request.getParameter("second_flight_id"));

			}

			//check to make sure both the flights exist. make sure the first flight's arriving airport=second flight's departing airport. extract info from both flights needed to make the booking
			String query = "SELECT * FROM Flight where flight_id = " + first_flight_id + " and airline_id = '"
					+ first_airline_id + "'";

			ResultSet rs3 = stmt.executeQuery(query);
			while (rs3.next()) {

				first_tickets_bought = rs3.getInt("tickets_bought");
				first_aircraft_id = rs3.getInt("aircraft_id");
				first_total_fare = rs3.getInt("price");
				first_waiting_list_size = rs3.getInt("waiting_list_size");
				first_arrivingApt = rs3.getString("arriv_airpt_id");
				first_departingApt = rs3.getString("dept_airpt_id");
				first_loopRan = 1;

			}
			if (first_loopRan == 0) {
				out.print("One of these flights doesn't exist");
				return;

			}

			if (second_airline_id.length() > 0) {
				String secondFlightChecker = "SELECT * FROM Flight where flight_id = " + second_flight_id + " and airline_id = '"
						+ second_airline_id + "'";

				ResultSet rsSecondFlight = stmt.executeQuery(secondFlightChecker);
				while (rsSecondFlight.next()) {

					second_tickets_bought = rsSecondFlight.getInt("tickets_bought");
					second_aircraft_id = rsSecondFlight.getInt("aircraft_id");
					second_total_fare = rsSecondFlight.getInt("price");
					second_waiting_list_size = rsSecondFlight.getInt("waiting_list_size");
					second_arrivingApt = rsSecondFlight.getString("arriv_airpt_id");
					second_departingApt = rsSecondFlight.getString("dept_airpt_id");

					second_loopRan = 1;

				}
				if (second_loopRan == 0) {
					out.print("One of these flights doesn't exist");
					return;

				}
				if (!first_arrivingApt.equals(second_departingApt)) {
					out.print("Not a valid flight");
					out.print("first arrives at " + first_arrivingApt);
					out.print("second departs " + second_departingApt);

					return;
				}

			}
			
			
			
			
		
		 //delete the initial reservation 
			String query3 = "DELETE FROM R_buys_relates_customer_ticket where ticket_num = "+ ticket_num;
			System.out.println(query3);
			PreparedStatement psDelete = con.prepareStatement(query3);
			psDelete.executeUpdate();
			
			
			
			//Book the first flight or get on the waiting list

			String bookFirstFlight = "SELECT * FROM Aircraft where aircraft_id = " + first_aircraft_id
					+ " and airline_id = '" + first_airline_id + "'";

			ResultSet rsbookFirstFlight = stmt2.executeQuery(bookFirstFlight);

			while (rsbookFirstFlight.next()) {

				first_numSeats = rsbookFirstFlight.getInt("num_of_seats");

			}

			if (first_numSeats > first_tickets_bought) {

				int new_first_tickets_bought = first_tickets_bought + 1;
				int new_total_fare = first_total_fare + 5;
				System.out.println(first_total_fare);
				System.out.println(flightClass);

				String insert = "INSERT INTO R_buys_relates_customer_ticket (ticket_num, customer_id, date_of_purchase, flight_id, class, airline_id, booking_fee, cancel_fee, total_fare, layovers, roundtrip, ticket_order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				PreparedStatement ps = con.prepareStatement(insert);
				System.out.println(insert);

				ps.setInt(1, ticket_num);
				ps.setString(2, customerID);

				ps.setString(3, date.toString());

				ps.setInt(4, first_flight_id);

				ps.setString(5, flightClass);

				ps.setString(6, first_airline_id);

				ps.setInt(7, 5);
				//no cancel fee if you buy first class
				if (flightClass.toLowerCase().equals("first")) {
					ps.setInt(8, 0);
				} else {
					ps.setInt(8, 10);
				}
				ps.setInt(9, new_total_fare);

				if (second_airline_id.length() != 0) {
					ps.setInt(10, 1);
				} else {
					ps.setInt(10, 0);
				}
				if (second_arrivingApt.equals(first_departingApt)) {
					ps.setInt(11, 1);

				}

				else {
					ps.setInt(11, 0);

				}

				if (second_airline_id.length() != 0) {
					ps.setInt(12, 1);
				} else {
					ps.setInt(12, 0);
				}

				ps.executeUpdate();

				String update = "UPDATE Flight set tickets_bought = " + new_first_tickets_bought
						+ " where airline_id = '" + first_airline_id + "' and flight_id= " + first_flight_id;
				System.out.println(update);

				PreparedStatement psupdate = con.prepareStatement(update);

				psupdate.executeUpdate();

				out.print("Reservation made for flight #" + first_flight_id + ". The cost is $" + first_total_fare
						+ " and there is a $5 booking fee <br>");

			}
			//if the first flight is full
			else {
				int first_priority_num = first_waiting_list_size + 1;
				System.out.println("priority num=" + first_priority_num);

				String insert = "INSERT INTO R_has_waitinglist_customer_flight (flight_id, customer_id, priority_num, airline_id)  VALUES (?, ?, ?, ?)";

				PreparedStatement ps = con.prepareStatement(insert);
				ps.setInt(1, first_flight_id);
				ps.setString(2, customerID);
				ps.setInt(3, first_priority_num);
				ps.setString(4, first_airline_id);

				System.out.println(ps);

				ps.executeUpdate();

				String update = "UPDATE Flight set waiting_list_size = " + first_priority_num
						+ " where airline_id = '" + first_airline_id + "' and flight_id= " + first_flight_id;

				PreparedStatement psupdate = con.prepareStatement(update);

				psupdate.executeUpdate();

				out.print("Flight # " + first_flight_id
						+ " is full. You are on the waiting list and your priority number is " + first_priority_num
						+ "<br>");

			}
			//Now do the same thing for flight 2--if it was entered

			//Book the second flight or get on the waiting list

			if (second_airline_id.length() > 0) {

				String query5 = "SELECT * FROM Aircraft where aircraft_id = " + second_aircraft_id
						+ " and airline_id = '" + second_airline_id + "'";

				ResultSet rs5 = stmt2.executeQuery(query5);

				while (rs5.next()) {

					second_numSeats = rs5.getInt("num_of_seats");

				}

				if (second_numSeats > second_tickets_bought) {

					int new_second_tickets_bought = second_tickets_bought + 1;
					System.out.println(second_total_fare);
					System.out.println(flightClass);

					String insert = "INSERT INTO R_buys_relates_customer_ticket (ticket_num, customer_id, date_of_purchase, flight_id, class, airline_id, booking_fee, cancel_fee, total_fare, layovers, roundtrip, ticket_order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

					PreparedStatement ps = con.prepareStatement(insert);
					System.out.println(insert);

					ps.setInt(1, ticket_num);
					ps.setString(2, customerID);

					ps.setString(3, date.toString());

					ps.setInt(4, second_flight_id);

					ps.setString(5, flightClass);

					ps.setString(6, second_airline_id);

					ps.setInt(7, 0);
					//no cancel fee if you buy first class
					if (flightClass.toLowerCase().equals("first")) {
						ps.setInt(8, 0);
					} else {
						ps.setInt(8, 10);
					}
					ps.setInt(9, second_total_fare);

					ps.setInt(10, 1);
					
					if (second_arrivingApt.equals(first_departingApt)) {
						ps.setInt(11, 1);

					}

					else {
						ps.setInt(11, 0);

					}

					
						ps.setInt(12, 2);
				

					ps.executeUpdate();

					String update = "UPDATE Flight set tickets_bought = " + new_second_tickets_bought
							+ " where airline_id = '" + second_airline_id + "' and flight_id= " + second_flight_id;
					System.out.println(update);

					PreparedStatement psupdate = con.prepareStatement(update);

					psupdate.executeUpdate();

					out.print("Reservation made for flight #" + second_flight_id + ". The cost is $"
							+ second_total_fare + "<br>");

				}
				//if the second flight is full
				else {
					int second_priority_num = second_waiting_list_size + 1;
					System.out.println("priority num=" + second_priority_num);

					String insert = "INSERT INTO R_has_waitinglist_customer_flight (flight_id, customer_id, priority_num, airline_id)  VALUES (?, ?, ?, ?)";

					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, second_flight_id);
					ps.setString(2, customerID);
					ps.setInt(3, second_priority_num);
					ps.setString(4, second_airline_id);

					System.out.println(ps);

					ps.executeUpdate();

					String update = "UPDATE Flight set waiting_list_size = " + second_priority_num
							+ " where airline_id = '" + second_airline_id + "' and flight_id= " + second_flight_id;

					PreparedStatement psupdate = con.prepareStatement(update);

					psupdate.executeUpdate();

					out.print("Flight # " + second_flight_id
							+ " is full. You are on the waiting list and your priority number is "
							+ second_priority_num);

				}
			}

			stmt.close();
			stmt2.close();
			db.closeConnection(con);


		

		out.print("Reservation updated"); %>


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